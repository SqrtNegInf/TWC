#!/usr/bin/env perl
use v5.36;

my $code  = shift || "The quick brown fox jumps over the lazy dog";  
my $block = shift || 8; 

$code =~ s/ //g;
my @code = split(//,$code);

my @out;
my $m = 0;
$out[$m++ % $block] .= shift(@code) while (@code);
print "$_ " foreach (@out);
print "\n";
