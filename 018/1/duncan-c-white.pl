#!/usr/bin/env perl
use v5.36;


#
# my $is = substr_of_all( $s, @str );
#	Calculate whether or not $s is a substr of every string in @str.
#	Return true iff it is; false otherwise.
#
sub substr_of_all( $s, @str )
{
	foreach my $str (@str)
	{
		return 0 unless $str =~ /$s/i;
	}
	return 1;
}


#
# my $longestsubstr = find_longest_substr( @str );
#	Find and return the longest substring of an array of strings @str.
#
sub find_longest_substr( @str )
{
	# find the shortest string
	my $shortest;
	my $shortlen = length($str[0])+1;
	foreach my $str (@str)
	{
		my $l = length($str);
		if( $l < $shortlen )
		{
			$shortlen = $l;
			$shortest = $str;
		}
	}
	#print "found shortest string: $shortest\n";
	return $shortest if substr_of_all( $shortest, @str );

	# otherwise try, in order of length, each substring of $shortest
	for( my $l=$shortlen-1; $l>0; $l-- )
	{
		#print "trying length $l substrings of $shortest\n";
		for( my $pos=$shortlen-$l; $pos>=0; $pos-- )
		{
			my $sub = substr($shortest,$pos,$l);
			#print " checking whether $sub is a substring of all\n";
			my $is = substr_of_all( $sub, @str );
			return $sub if $is;
		}
	}

	return "";
}


my @str = <zabc xabcy abcd>;
my $longestsubstr = find_longest_substr( @str );
print "longest sub string of strings is $longestsubstr\n";
