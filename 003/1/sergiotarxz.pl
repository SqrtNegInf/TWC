#!/usr/bin/env perl
use v5.36;

my @a = (2,3,5);
for (my $i=1; $i<50; $i++) {
    my $a = $i;
    for (@a) {
        $a/=$_ until $a%$_;
    }
    $a==1 and say $i;
}
