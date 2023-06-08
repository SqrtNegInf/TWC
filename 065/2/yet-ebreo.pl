#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(partitions);

my $string = "abbaba";
my @arr    = $string =~/./g;
my %hash   = ();

for my $arr ( partitions(\@arr) ) {
    for my $elem (@{$arr}) {
        my $w = join "", @{$elem};
        if ($w =~ /^((.)(?1)\2|.?)$/ && $string =~/$w/) {
            (length $w > 1) && !$hash{$w} && say $w;
            
        } 
        $hash{$w}++;
    }
}


