#!/usr/bin/env perl
use v5.36;

use Algorithm::Combinatorics qw(combinations);
use List::Util qw(sum);

my @L = (-25, -10, -7, -3, 2, 4, 8, 10);
@L = sort {$a <=> $b} @L;
my $target = 0;
my $iter = combinations(\@L, 3);
while (my $p = $iter->next) {
    say prettyprint($p, $target) if sum(@$p) == $target;
}

sub prettyprint($p, $target) {
    my $s = $p->[0];
    for my $i (1..$#$p) {
        $s .= $p->[$i] >= 0 ? ' + ' : ' - ';
        $s .= abs($p->[$i]);
    }
    $s .= " = $target";
    return $s;
}
