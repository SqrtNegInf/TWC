#!/usr/bin/env perl
use v5.36;

# find_recursive( $prefix, $x, $y, $lref, $resultref );
#	Find all possible numbers made by concatenating the numbers from @$lref,
#	whose length is exactly $X but value is less than $Y, given that
#	the prefix (numeric string) is $prefix.  Add answers to @$resultref.
#
sub find_recursive( $prefix, $x, $y, $lref, $resultref )
{
	foreach my $el (@$lref)
	{
		my $newp = $prefix.$el;
		my $newlen = length($newp);
		next if $newp >= $y || $newlen > $x;

		push @$resultref, $newp if $newp < $y && $newlen==$x;

		# try with that element appended to the prefix
		find_recursive( $newp, $x, $y, $lref, $resultref );
	}
}



#
# my @result = findall( $x, $y, @l );
#	Find all possible numbers made by concatenating the numbers from @l,
#	whose length is exactly $X but value is less than $Y.
#
sub findall( $x, $y, @l )
{
	my @result;
	foreach my $el (@l)
	{
		next if $el =~ /^0/;
		next if $el >= $y || length($el) > $x;
		push @result, $el if $el < $y && length($el)==$x;

		# try that element as the prefix of the number..
		find_recursive( $el, $x, $y, \@l, \@result );
	}
	return @result;
}



my( $x, $y, @l ) = (2, 21, 0, 1, 2, 5);

my @result = findall( $x, $y, @l );
say join(', ',@result);
