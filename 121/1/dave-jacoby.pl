#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Carp;

my $m = 12;
my $n = 3;
GetOptions(
    'm=i' => \$m,
    'n=i' => \$n,
);
croak q{M out of range} if $m > 255 || $m < 0;
croak q{N out of range} if $n > 8   || $n < 1;

my $o = invert_bit( $m, $n );
print <<"END";
    m $m    n $n    o $o
END

sub invert_bit ( $m = 0, $n = 1 ) {
    my $bin = sprintf '%08b', $m;
    my $nn  = 8 - $n;
    substr( $bin, $nn, 1 ) = 1 - substr( $bin, $nn, 1 );
    return oct( '0b' . $bin );
}
