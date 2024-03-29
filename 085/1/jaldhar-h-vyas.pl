#!/usr/bin/env perl
use v5.36;

sub combinations {
    my @list = @{$_[0]};
    my $length = $_[1];

    if ($length <= 1) {
        return map [$_], @list;
    }

    my @combos;

    for (my $i = 0; $i + $length <= scalar @list; $i++) {
        my $val  = $list[$i];
        my @rest = @list[$i + 1 .. $#list];
        for my $c (combinations(\@rest, $length - 1)) {
            push @combos, [$val, @{$c}] ;
        }
    }

    return @combos;
}

my $results = 0;

for my $combo (combinations([1.2, 0.4, 0.1, 2.5], 3)) {
    my $total = 0;
    for my $elem (@{$combo}) {
        $total += $elem;
    }
    if ($total > 1.0 && $total < 2.0) {
        $results++;
    }
}

say $results ? 1 : 0;
