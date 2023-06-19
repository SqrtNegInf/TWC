#!/usr/bin/env perl
use v5.36;

my $nterms = shift // 30;

my $e = 0;
my $nfact = 1;
foreach my $n (1..$nterms)
{
	$e += 1/$nfact;
	$nfact *= $n;
}
print "e=$e\n";
