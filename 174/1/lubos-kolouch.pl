#!/usr/bin/env perl
use v5.36;

sub is_disarium {
    my $what = shift;

    my $pos = 0;
    my $sum = 0;

    for my $i ( split //, $what ) {
        $pos++;
        $sum += $i**$pos;
    }

    return 1 if $sum == $what;

    return 0;
}

sub generate_numbers {
    my $count = shift;

    my $pos = 0;
    my @result;

    while ( scalar @result < $count ) {
        push @result, $pos if is_disarium($pos);
        $pos++;
    }

    return \@result;
}

use Test::More;

is( is_disarium(518), 1, 'Test 518' );
is( is_disarium(519), 0, 'Test 519' );
is_deeply(
    generate_numbers(18),
    [   0,    1, 2, 3, 4, 5, 6, 7, 8, 9, 89, 135, 175, 518, 598, 1306, 1676,
        2427
    ],
    'Test 18 nums'
);
done_testing;

1;
