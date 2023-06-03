#!/usr/bin/env perl
use v5.36;

use Array::Utils 'intersect';

my $A = 'abcdabcd'; my $B = 'abcdabcdabcdabcd';
my @base_a = base_strings($A);
my @base_b = base_strings($B);
my @result = intersect(@base_a, @base_b);
say "(", join(", ", map {'"'.$_.'"'} @result), ")";


sub base_strings {
    my($str) = @_;
    my @base;

    my $len = length($str);
    for my $i (1 .. $len) {
        if ($len % $i == 0) {   # $i is a divisor of total length
            my $base = substr($str, 0, $i);
            if (($base x ($len / $i)) eq $str) {
                push @base, $base;
            }
        }
    }
    return @base;
}
