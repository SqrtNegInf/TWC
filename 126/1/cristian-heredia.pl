#!/usr/bin/env perl

use strict;
use warnings;
#use Data::Dumper;

my $N = 200;
my $counter = 0;

for my $iter (1 .. $N) {
    if ( $iter !~ /1+/) {
        $counter++;
    }
}
print("Output: $counter\n");
