#!/usr/bin/env perl
use v5.36;

use Getopt::Long;

my %mapping = qw(a a b b c c d d e e f f o 0 l 1 i 1 s 5 t 7);

sub hexword {
	my( $word ) = @_;
	my $result = "";
	foreach my $let (split(//, $word))
	{
		return "" unless $mapping{$let};
		$result .= $mapping{$let};
	}
	return $result;;
}

my $debug=0;
my $minlen=2;
my $maxlen=8;
die "Usage: form-hex-word [--debug] [--minlen min] [--maxlen max]\n"
	unless GetOptions( "debug"=>\$debug,
			   "minlen=i"=>\$minlen,
			   "maxlen=i"=>\$maxlen ) && @ARGV==0;

my $longest = "";
open( my $in, '<', "dictionary.txt" ) || die;
while( <$in> ) {
	chomp;
	my $len = length($_);
	next unless $len >= $minlen && $len <= $maxlen;
	$_ = lc($_);
	my $hw = hexword( $_ );
	next unless $hw;
	$longest = $hw if length($hw) > length($longest);
	say "$_ == $hw";
}
close( $in );

say "longest: $longest";
