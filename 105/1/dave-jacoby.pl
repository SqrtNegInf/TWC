#!/usr/bin/env perl
use v5.36;

use Carp;
use Getopt::Long;

my $k = 34;
my $n = 5;

GetOptions(
    'n=i' => \$n,
    'k=i' => \$k,
);

$n = abs int $n;
$k = abs int $k;

croak 'Zero in input' unless ( $n * $k ) > 0;

my $v = nth_root( $n, $k );
say qq{${n}th root of $k = $v};

# Logarithmic calculation
# r = b ** ( 1/n logb k )
sub nth_root ( $n, $k ) {
    return 10**( ( 1 / $n ) * log10($k) );
}

# https://perldoc.perl.org/functions/log
sub log10 {
    my $n = shift;
    return log($n) / log(10);
}
