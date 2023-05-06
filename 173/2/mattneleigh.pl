#!/usr/bin/env perl
use v5.36;
use English;

use bigint;

my $n = 10;
my $s = 2;

print("\n");
for(1 .. $n){
    print($s, "\n");
    $s = $s * ($s - 1) + 1;
}
print("\n");
