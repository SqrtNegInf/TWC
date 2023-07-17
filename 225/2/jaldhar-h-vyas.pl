#!/usr/bin/env perl
use v5.36;

sub Zminusabs {
    my @a = @{ $_[0] };
    my @b = @{ $_[1] };

    my @result;
    for my $i (0 .. scalar @b - 1) {
        push @result, abs($a[$i] - $b[$i]);
    }
    return @result;
}

sub sum {
    my ($arr) = @_;
    my $total = 0;

    for my $elem (@{$arr}) {
        $total += $elem;
    }

    return $total;
}

my @ints = (10, 4, 8, 3);
my $end = scalar @ints - 1;

my @left = (0);
for my $i (0 .. $end - 1) {
    push @left, sum([@ints[0 .. $i]]);
} 

my @right = (0);
for my $i (reverse 1 .. $end) {
    unshift @right, sum([@ints[$i .. $end]]);
} 

say q{(}, (join q{, }, Zminusabs(\@left, \@right)), q{)};
