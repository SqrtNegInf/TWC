#!/usr/bin/env perl
use v5.36;

# return a list with the values of the magic square
sub square {
    my($a, $b, $c) = @_;
    my @sq;
    push @sq, [ $c - $b,        $c - ($a - $b), $c + $a        ];
    push @sq, [ $c + ($a + $b), $c,             $c - ($a + $b) ];
    push @sq, [ $c - $a,        $c + ($a - $b), $c + $b        ];
    return @sq;
}

# find a and b for a given c
sub find_ab {
    my($c) = @_;
    for my $a (1 .. 3*$c-1) {
        for my $b ($a+1 .. 3*$c) {
            if ($b < $c-$a && $b != 2*$a) {
                return ($a, $b);
            }
        }
    }
}

my $magic_constant = 15;
my $c = $magic_constant / 3;
my($a, $b) = find_ab($c);
my @sq = square($a,$b,$c);
for (@sq) {
    print "[ ", join(" ", @$_), " ]\n";
}
