#!/usr/bin/env perl
use v5.36;

#   Let's try handwriting a RD parser..

#
# my $val = factor( $inputref );
#	Parse the input string $$inputref, an integer expression factor,
#	removing text from $$inputref as we consume it, calculating and
#	returning the result as we go.
#
sub factor
{
	my( $inputref ) = @_;
	my $orig = $$inputref;
	if( $$inputref =~ s/^\(// )
	{
		$orig = $$inputref;
		my $val = expr( $inputref );
		die "factor: bad nested expression $orig\n" unless defined $val;
		die "factor: ')' expected in $$inputref after expr\n"
			unless $$inputref =~ s/\)//;
		return $val;
	}
	return -$1 if $$inputref =~ s/^-(\d+)//;
	return $1  if $$inputref =~ s/^(\d+)//;
	die "factor: '(' or -n or n expected at $$inputref\n";
}


#
# my $val = term( $inputref );
#	Parse the input string $$inputref, an integer expression term, removing
# 	text from $$inputref as we consume it, and calculate and return the
#	result.
#
sub term
{
	my( $inputref ) = @_;
	my $val = factor( $inputref );
	while( $$inputref =~ m|^[*/]| )
	{
		if( $$inputref =~ s/^\*// )
		{
			my $v2 = factor( $inputref );
			$val *= $v2;
		}
		elsif( $$inputref =~ s|^/|| )
		{
			my $v2 = factor( $inputref );
			die "term: can't divide by 0\n" if $v2==0;
			$val = int($val/$v2);
		}
	}
	return $val;
}


#
# my $val = expr( $inputref );
#	Parse the input string $$inputref, an integer expression, removing
# 	text from $$inputref as we consume it, and calculate and return the
#	result.
sub expr
{
	my( $inputref ) = @_;
	my $val = term( $inputref );
	while( $$inputref =~ /^[+-]/ )
	{
		if( $$inputref =~ s/^\+// )
		{
			my $v2 = term( $inputref );
			$val += $v2;
		}
		elsif( $$inputref =~ s/^-// )
		{
			my $v2 = term( $inputref );
			$val -= $v2;
		}
	}
	return $val;
}


#
# my $val = parseexpr( $input );
#	Parse the input string $input, an integer expression, and calculate
#	and return the result - or die with an error message.
#
sub parseexpr
{
	my( $input ) = @_;

	$input =~ s/\s+//g;	# remove all whitespace

	my $val = expr( \$input );
	die "leftover input $input after expr\n" unless $input eq '';
	return $val;
}


my $debug=0;

my $expr = join( ' ', '3*2+2' );

my $val = parseexpr( $expr );
say $val;
