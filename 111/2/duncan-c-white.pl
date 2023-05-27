#!/usr/bin/env perl
use v5.36;

use Text::CSV;

my $wordfile = "/usr/share/dict/words";
die "Usage: longest-sort-letters [wordfile]\n" if @ARGV>1;
$wordfile = shift if @ARGV==1;

my $longest = "NO SUCH WORD";
my $longlen = -1;

open( my $infh, '<', $wordfile ) || die "can't open $wordfile\n";
while( <$infh> )
{
	chomp;
	my $sig = join( '', sort split(//,$_) );
	next unless $sig eq $_;
	my $l = length($sig);
	if( $l > $longlen )
	{
		$longlen = $l;
		$longest = $_;
	}
}
close( $infh );

print "longest word same as it's signature: $longest\n";
