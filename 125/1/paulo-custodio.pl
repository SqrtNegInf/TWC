#!/usr/bin/env perl
use v5.36;

use ntheory 'gcd';
use constant MAX_GEN => 100;

sub gen_pythagorean_triples {
    my @out;
    my %seen;
    for my $m (2 .. MAX_GEN) {
        for my $n (1 .. $m-1) {
            if (gcd($m, $n)==1) {
                my $a = $m*$m-$n*$n;
                my $b = 2*$m*$n;
                my $c = $m*$m+$n*$n;
                if ($m%2==1 && $n%2==1) {
                    $a = $a/2;
                    $b = $b/2;
                    $c = $c/2;
                }
                if ($a > $b) {
                    ($a, $b) = ($b, $a);
                }
                if (!$seen{$a}{$b}) {
                    push @out, [$a, $b, $c];
                    $seen{$a}{$b} = 1;
                }
            }
        }
    }
    return @out;
}

my @pythagorean_triples = gen_pythagorean_triples();
my $N = shift||13;
my @found = grep {$_->[0]==$N || $_->[1]==$N || $_->[2]==$N} @pythagorean_triples;
if (!@found) {
    say -1;
}
else {
    for (@found) {
        say "(", join(", ", @$_), ")";
    }
}
