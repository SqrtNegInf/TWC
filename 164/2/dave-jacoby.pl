#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum0 };

my @happy;
while ( scalar @happy < 8 ) {
    state $c = 0;
    $c++;
    push @happy, $c if is_happy($c);
}
say join ", ", @happy;

sub is_happy( $n ) {
    my $m = $n;
    my %done;
    while ( !$done{$m} ) {
        $done{$m}++;
        $m = sum0 map { $_**2 } split //, $m;
    }
    return $m == 1 ? 1 : 0;
}
