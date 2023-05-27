#!/usr/bin/env perl
use v5.36;

use English qw/ -no_match_vars /;

my $filename = shift // 'example.csv';

open my $file, '<' , $filename or die "$OS_ERROR\n";
local $RS = undef;
my @input = split "\n", <$file>;
close $file;

my @table;

for my $line (@input) {
    push @table, [ split /,/, $line ];
}

my @transposed;

for my $j (0 .. scalar @{$table[0]} - 1) {
    for my $i (0 .. scalar @table - 1) {
        push @{$transposed[$j]}, $table[$i]->[$j]; 
    }
}

for my $i (0 .. scalar @transposed - 1) {
    say join q{,}, @{$transposed[$i]};
}
