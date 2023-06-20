#!/usr/bin/env perl
use v5.36;

my $str = 'bookkeeper';
my ($groups, $i, $prev) = ([], 0, substr$str, 0, 1);
foreach my $char (split //, $str) {
    $i++ if ($char ne $prev);
    $groups->[$i] .= $char;
    $prev = $char;
}

say join q|,|, ( map { sprintf '"%s"', $_ } @{$groups} );

