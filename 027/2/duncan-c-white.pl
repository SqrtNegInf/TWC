#!/usr/bin/env perl
use v5.36;

#
# my $val = combine( $op, $oldval, $newval );
#	Combine an optional old value $oldval (or undefined)
#	and a new value $newval, under operation $op ('=',
#
sub combine( $op, $oldval, $newval )
{
	return $newval if $op eq "=";
	return $oldval + $newval if $op eq "+=";
	return $oldval - $newval if $op eq "-=";
	return $oldval * $newval if $op eq "*=";
	return $oldval / $newval if $op eq "/=";
	return $oldval % $newval if $op eq "%=";
}


#
# my( $varset, $input ) = process( $infh );
#	Process an input file (handle $infh), every line of which
#	should be of the form VARNAME OP VALUE (where OP='=', '+=',
#	'-=', '*=', '/=' or '%='), and build and return a set of all
#	variables named in that input file, and an array @$input of
#	all [VARNAME,OP,VALUE] decoded triples.
#
sub process( $infh )
{
	my %vars;
	my @input;
	while( <$infh> )
	{
		chomp;
		my( $var, $op, $value ) = split( /\s+/, $_ );
		push @input, [$var,$op,$value];
		$vars{$var}++;
	}
	return ( \%vars, \@input );
}

die "Usage: ch-2.pl\nor    ch-2.pl filename\n" if @ARGV>1;
my $varset;
my $input;
if( @ARGV == 0 )
{
	( $varset, $input ) = process( \*DATA );
}
else
{
	open( my $infh, '<', $ARGV[0] ) || die;
	( $varset, $input ) = process( $infh );
	close( $infh );
}


my $time = 0;					# current time
my %currv = map { $_ => 0 } keys %$varset;	# current values of variables
$time++;

my %track;	# track all historical values of all variables
foreach my $var (keys %$varset)
{
	$track{$var} = [ 0 ];
}


#
# update( $triple );
#	Take a single triple $triple of the form [ VARNAME, OP, VALUE ]
#	(where OP='=', '+=', '-=', '*=', '/=' or '%='),
#	and update %currv and %track..
#
sub update( $triple )
{
	my( $var, $op, $value ) = @$triple;
	$currv{$var} = combine( $op, $currv{$var}, $value );
	foreach my $var (keys %$varset)
	{
		push @{$track{$var}}, $currv{$var};
	}
	$time++;
}


foreach my $triple (@$input)
{
	update( $triple );
}

say "Final values:";
foreach my $var (sort keys %currv)
{
	say "$var: $currv{$var}";
}

say "Historical values:";
foreach my $var (sort keys %track)
{
	say "$var: ", join(',', @{$track{$var}} );
}

#print "show results in gnuplot? ";
#my $in = <STDIN>;
#prepare_gnuplot() if $in =~ /^y/i;


#
# prepare_gnuplot();
#	Prepare the gnuplot files, the data file will contain
#	track[var][time] ordered first by time, then by vars,
#	and the command file will continue instuctions to plot
#	each column as a separate named variable.
#
sub prepare_gnuplot()
{
	# prepare the data file..
	open( my $outfh, '>', '2.dat' ) || die;
	foreach my $t (0..$time-1)
	{
		my @line = ( $t );
		foreach my $var (sort keys %track)
		{
			push @line, $track{$var}[$t];
		}
		say $outfh join(' ', @line);
	}
	close( $outfh );

	# prepare the gnuplot command file..
	open( $outfh, '>', '2.cmd' ) || die;
	say $outfh "set grid";
	my $pos = 1;
	my @pl = map {
			$pos++;
			"'2.dat' using 1:$pos with lines title '$_'";
		} sort keys %track;
	say $outfh "plot ", join(', ', @pl);
	say $outfh "pause mouse key";
	close( $outfh );

	# run gnuplot
	#system( "gnuplot 2.cmd" );
}

__DATA__
x = 10
y = 20
x = 20
y += 100
x -= 5
y *= 2
x *= 3
