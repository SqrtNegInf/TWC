#!/usr/bin/env perl
use v5.36;

sub stream_avg
{
     my $num = $_[0];
     state $sum = 0;
     state $count = 0;

     $sum += $num;
     $count++;
     return $sum / $count;
}

for my $number (map $_ * 10, 1 .. 10)
{
     print join("\t", $number, stream_avg($number)), $/;
}
