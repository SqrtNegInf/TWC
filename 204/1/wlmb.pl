#!/usr/bin/env perl
use v5.36;

my @orig= (1,2,3,4,5,6,7,8,9,10,11,11,11,1,12,13,14,15,15,15,15,16,17,19);
my $current=shift;
my ($increasing, $decreasing);
for(@ARGV){
    $_>$current and $increasing=1;
    $_<$current and $decreasing=1;
    last if $increasing and $decreasing; # shortcut if non monotonic
    $current=$_;
}
my ($result, $reason)=
    $increasing && $decreasing?(0, "Non-monotonic"):
    $increasing               ?(1, "Non-decreasing"):
    $decreasing               ?(1, "Non-increasing"):
    (1, "Constant");
say join " ", @orig, "->", $result, $reason;
