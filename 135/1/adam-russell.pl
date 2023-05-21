#!/usr/bin/env perl
use v5.36;

use POSIX;
sub middle_3{
    my($i) = @_;
    $i = abs($i);
    my $length = length($i);
    return "even number of digits" if $length % 2 == 0;
    return "too short" if $length < 3;
    my $middle = ceil($length / 2);
    return substr($i, $middle - 2, 3);
}

MAIN:{
    print middle_3(1234567) . "\n";
    print middle_3(-123) . "\n";
    print middle_3(1) . "\n";
    print middle_3(10) . "\n";
}
