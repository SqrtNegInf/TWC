#!/usr/bin/env perl
use v5.36;

my $n = 64;
my $exp = 1;
my $result;

# Work up to $n in powers of 2
do {
    $result = 2 ** $exp;
    $exp++;
} while ($result < $n);

# Find nth root up to $exp
my $i = 2;
while ($i <= $exp) {
    $result = $n ** (1/$i);
    if ($result !~ /\D/) {
        say "$result^$i";
        exit;
    } else {
        $i++;
    }
}

say "0";
