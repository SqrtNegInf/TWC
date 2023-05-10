#!/usr/bin/env perl
use v5.36;

my @abc;
open(my $fh, '<', 'dictionary.txt') or die "dictionary.txt not found\n";
while(my $w = <$fh>) {
    chomp $w;
    my $sorted = join '', sort split //, $w;
    push @abc, $w if $w eq $sorted;
}
close $fh;
say join "\n", reverse sort {length($a) <=> length($b)} @abc;
