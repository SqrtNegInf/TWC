#!/usr/bin/env perl
use v5.36;

sub counting_numbers
{
     my $num = $_[0];
     my $count = 0;
     for my $cand ( 2 .. $num )
     {
          $count++ unless $cand =~ /1/;
     }
     return $count;
}


my $N = shift // 200;
print counting_numbers($N), $/;
