#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my $territories = 0;

my $states = "al|ak|az|ar|ca|co|ct|de|fl|ga|hi|id|il|in|ia|ks|ky|la".
              "|me|md|ma|mi|mn|ms|mo|mt|ne|nv|nh|nj|nm|ny|nc|nd|oh|ok".
	      "|or|pa|ri|sc|sd|tn|tx|ut|vt|va|wa|wv|wi|wy";
$states .= "|as|dc|fm|gu|mh|mp|pw|pr|vi" if $territories;


#
# my %dict = readdict( $filename );
#	Read a dictionary, build a set of all words.
#	ONLY THOSE OF EVEN LENGTH.
#
sub readdict( $filename )
{
	open( my $in, '<', $filename ) || die;
	my %dict;
	while( <$in> )
	{
		chomp;
		next unless length($_) % 2 == 0;
		$dict{lc($_)}++;
	}
	close( $in );
	return %dict;
}

my %dict = readdict( "/usr/share/dict/words" );

my @result = grep { m|^($states)+$| } sort keys %dict;

#print Dumper( \@result );

my $longestw = "";
my $maxlen = 0;

foreach my $w (@result)
{
	my $l = length($w);
	if( $l > $maxlen )
	{
		$maxlen = $l;
		$longestw = $w;
	}
}

print "$maxlen letters long\n";

print "longest words made up only of US state abbreviations ";
print "and territories " if $territories;
print "are:\n";
foreach my $w (@result)
{
	print "$w\n" if length($w) == $maxlen;
}

