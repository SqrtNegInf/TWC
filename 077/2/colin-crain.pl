#!/usr/bin/env perl
use v5.36;

## in
my @input = @ARGV;
@input = qw(OOXO XOOO XOOX OXOO) if scalar @input == 0 ;
our $mat = [ map { [ split //, $_ ] } @input ];

## work
my @lonely;
for my $y (0..scalar @$mat-1) {
    for my $x (0..scalar @{$mat->[0]}-1) {
        if ($mat->[$y][$x] eq 'X' and is_lonely($x, $y)) {
            push @lonely, [$x, $y];
        }
    }
}

## out
say (join '  ', $_->@*) for $mat->@*;
for ( @lonely ) {
    my ($col, $row) = map { ++$_ } @$_;
    say "the X at column → $col, row down ↓ $row is lonely";
}

## ## ## ## ## SUBS:

sub is_lonely {
    my ($x, $y) = @_;
    
    for my $offset ([1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]) {
        next if ($x + $offset->[0] < 0) || ($y + $offset->[1] < 0);
        next if ! defined $mat->[ $y + $offset->[1] ][ $x + $offset->[0] ];
        return 0 if $mat->[ $y + $offset->[1] ][ $x + $offset->[0] ] eq 'X';  
    }
    return 1;    
}
