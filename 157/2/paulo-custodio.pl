#!/usr/bin/env perl
use v5.36;

use Math::BaseCnv qw( cnv );

my $n = 7;
say is_brazilian($n);

sub is_brazilian {
    my($n) = @_;
    for my $b (2 .. $n-2) {
        my $cnv = cnv($n, 10, $b);
        return 1 if $cnv =~ /^(\w)\1*$/;
    }
    return 0;
}
