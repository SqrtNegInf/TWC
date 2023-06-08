#!/usr/bin/env perl
use v5.36;

my $N = 64;
print sprintf("%d = %s\n", $N, join(", ", @{get_power_integers($N)}));

sub get_power_integers {
    my ($n) = @_;

    my $power_integers = [];

    my $i = 2;
    while ( $i <= sqrt($n) ) {
        my $j = 2;
        while ( $j <= $n ) {
            if (($i ** $j) == $n) {
                push @$power_integers, sprintf("%d ^ %d", $i, $j);
            }
            $j++;
        }
        $i++;
    }

    $power_integers = [0] unless scalar(@$power_integers);

    return $power_integers;
}
