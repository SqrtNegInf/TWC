#!/usr/bin/env perl
use v5.36;

use Test::More;

sub to_base35 {
    my ($num) = @_;

    die if ($num < 0);

    return $num if ($num == 0);

    my @chars = (0..9, 'a'..'y');
    my $base = scalar @chars;
    my $result;
    while ($num) {
        my $remainder = $num % $base;
        $num = int($num / $base);
        $result .= $chars[$remainder];
    }
    return scalar reverse($result);
}

my %test_numbers = (
    0 => 0,
    10 => 'a',
    100 => '2u',
    1000 => 'sk',
    10000 => '85p',
    100000 => '2bm5',
);

for my $from (sort keys %test_numbers) {
    my $to = $test_numbers{$from};
    is(to_base35($from, 35), $to, qq|expect base 10: $from to base 35: $to match|);
}
done_testing;
