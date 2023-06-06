#!/usr/bin/env perl
use v5.36;

my ($file, $A, $B) = ('input.txt', 3, 6);

open TEXT, $file or die "No files named $file";

my $eye = 1;

if ($A > 1) {
    while (<TEXT>) {
        chomp $_;
        $eye++;
        last if $eye >= $A;
    }
}

while (<TEXT>) {
    chomp $_;
    print $_;
    print "\n";
    $eye++;
    last if $eye > $B;
}

close TEXT;



