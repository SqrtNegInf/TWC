#!/usr/bin/env perl
use v5.36;
#use strict;
#use warnings;
#use 5.010;

my $filename = 'words';
my @letters = 'crate' =~/./g;

open(my $fh, '<', $filename) or die "Could not open file '$filename' $!";
 
while (my $row = <$fh>) {
    chomp $row;
    my $hold = $row;
    $row=~s/$_// for @letters;
    say $hold if !$row
}
