#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

sub hash_counting_string
{
     my $length = $_[0];
     my $string = '#' x $length;

     return $string  if $length == 1;
     return '2#'     if $length == 2;

     my $offset = $length - 1;
     
     while ( $offset > 1 )
     {
          my $hash_sign_idx = rindex($string, '#', $offset);
          my $idx_1_based = $hash_sign_idx + 1;
          my $idx_width = length($idx_1_based);
          my $begin = $hash_sign_idx - $idx_width;

          substr($string, $begin, $idx_width, $idx_1_based);
          $offset = $begin;
     }


     return $string;
}


for my $length ( 2,20,120 )
{
     print join(" ", $length, hash_counting_string($length)), $/;
}
