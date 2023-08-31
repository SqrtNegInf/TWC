#!/usr/bin/env perl
use v5.36;

my @lists = (["7868190130M7522","5303914400F9211","9273338290F4010"],["1313579440F2036","2921522980M5644"]);
my $cnt;

for my $list (@lists) {
    $cnt = 0;
    say "Input: \@list = (@$list)";
    for my $info (@$list) {
        my $age = substr($info,11,2);
        if ($age >= 60) {
            $cnt++;
        }
    }
    say "Output: $cnt\n";
}
