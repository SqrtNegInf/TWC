#!/usr/bin/env perl
use v5.36;

my ($n, $k) = (3,4);

my $n_max_perm = factorial($n);

my $perm_n = 0;
permute( [1..$n]);

sub permute {
    my $numbers = shift;
    my $perm = shift // '';

    if (!@$numbers){
        print $perm.$/."\n" and exit if (++$perm_n == $k); #finish on kth permutation
        return;
    }

    foreach my $i (0 .. @$numbers-1) {
        my $c = $numbers->[$i];
        my @new_n = grep { $_ != $c } @$numbers;
        permute( \@new_n  , $perm . $c);
    }
    return;
}

sub factorial {
    my $n = shift;
    return 1 if ($n == 0);
    return $n * factorial($n-1);
}
