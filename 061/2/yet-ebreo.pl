#!/usr/bin/env perl
use v5.36;

for my $partition (glob "{1,2,3}" x 3) {
    my ($input,$ip) = ($ARGV[0] || '25525511135');
    for my $x ($partition=~/./g) {
        my $num = substr $input,0,$x;
        last if $num > 255 or $num=~/^0./;
        $input = substr $input,$x;
        $ip.="$num.";
    }
    if ($input ne '' && $input < 256 && $input!~/^0./) {
        say "$ip$input";
    }
}
