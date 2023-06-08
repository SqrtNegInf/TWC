#!/usr/bin/env perl
use v5.36;

my $n  = 64;

my $ans = power ($n);
print "$ans\n";
exit;

sub power {
    my $n = shift;
    return 0 if $n < 4;

    my $root = 2;
    my @ans;

    while (1) {
        # Pesky FP
        my $e = int sprintf "%.3f", ($n ** (1 / $root));
        last if $e < 2;
        if ($e ** $root == $n) {
            push @ans, "$e^$root";
        }
        $root++;
    }
    return @ans ? join ' ', @ans : 0;
}
