#!/usr/bin/env perl
use v5.36;

sub gcd{              #Euclidean Algorithm
    my $a = $_[0];
    my $b = $_[1];

    my $c = $a % $b;

    if ($c == 0) {
        return $b;
    } 
    else {
        gcd($b,$c);
    }
}

my @ARGV = (100, 500);
#all common factors of $a, $b are factors of its greatest common factor
print join " ", grep { gcd($ARGV[0],$ARGV[1]) % $_ == 0} 1..$ARGV[0];
print "\n";
