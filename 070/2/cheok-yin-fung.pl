#!/usr/bin/env perl
use v5.36;

my @a = (0,1);
my $N = 4;
if ($ARGV[0]) {$N = $ARGV[0];}

sub printa {
    print join " ", @a;
    print "\n";
}

for my $i (2..$N) {
    push @a, reverse (map {$_ + 2**($i-1)} @a);
}

printa;
