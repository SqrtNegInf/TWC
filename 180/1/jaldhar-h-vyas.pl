#!/usr/bin/env perl
use v5.36;

my $s = "need a string in quotation marks";
my %chars;

my $pos = 0;
for my $c (split //, $s) {
    if (exists $chars{$c}) {
        $chars{$c} = "Inf";
    } else {
        $chars{$c} = $pos;
    }
    $pos++;
}

say $chars{ (sort { $chars{$a} <=> $chars{$b}} keys %chars)[0] };
