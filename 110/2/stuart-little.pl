#!/usr/bin/env perl
use v5.36;

use List::AllUtils qw(zip_by);

open  my $fh, '<', 'example.csv';;
#(scalar @ARGV) ? (open($fh, '<', $ARGV[0])) : ($fh = *DATA);

my @data = ();
while (<$fh>) {
    chomp;
    my @line = split(/,\s*/,$_);
    push @data, \@line;
}

my @transData = map {join(",",@{$_})} zip_by { [ @_ ] } @data;
for (@transData) {
    say;
}

__DATA__
name,age,sex
Mohammad,45,m
Joe,20,m
Julie,35,f
Cristina,10,f
