#!/usr/bin/env perl
use v5.36;

my @wds = (["pay", "attention", "practice", "attend"],["janet", "julia", "java", "javascript"]);
my @prefix = ("at", "ja");

my $cnt = 0;
my $seen = 0;
for my $w (@wds) {
    say "Input:  \@words = [@$w]";
    say "\t\$prefix = \"$prefix[$cnt]\"";
    for my $elem (@$w) {
        if ($elem =~ m/^$prefix[$cnt]/) {
            $seen++;
        }
    }
    say "Output: $seen\n";
    $seen = 0;
    $cnt++;
}
