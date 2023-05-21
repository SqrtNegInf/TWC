#!/usr/bin/env perl
use v5.36;

sub middle_three
{
     my $num = $_[0];
     $num =~ tr/-//ds;
     return "Even number of digits!" if length($num) % 2 == 0;
     return "Too short!" if length($num) < 3;
     return $num if length($num) == 3;

     my $middle = length($num) / 2;
     return substr($num, int($middle) - 1, 3);
}


print middle_three(1234567), $/;
print middle_three(-123), $/;
print middle_three(1), $/;
print middle_three(10), $/;
print middle_three(1415926535897), $/;
