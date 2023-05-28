#!/usr/bin/env perl
use v5.36;

my $scalar;
say addr(\$scalar);

my @array;
say addr(\@array);

my %hash;
say addr(\%hash);

use constant C => 'c';
say addr(\C);

say addr(\'a string');


# Stringify the given ref and extract the address.
sub addr ($ref) {
    "$ref" =~ /^\w+\((.+)\)/;

    $1;
}
