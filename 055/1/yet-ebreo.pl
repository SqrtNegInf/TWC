#!/usr/bin/env perl
use v5.36;

my $bin_str = $ARGV[0] || '010';
my $len = length $bin_str;
my $num = oct "b$bin_str";
my @res;


for my $L (0..$len-1) {
    for my $R ($L..$len-1) {
        my $bin = $num;
        for my $n ($L..$R) {
            $bin ^= 1 << $len-$n-1;
        }
        push @{$res[(sprintf "%b", $bin)=~y/1//]} , [$L,$R];
    }
}

say "Pair of L-R (one's = $#res):";
for my $pairs (@{$res[-1]}) {
    say "@{$pairs}";
}
