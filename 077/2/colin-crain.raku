#!/usr/bin/env raku



unit sub MAIN (*@input) ;

## in
@input = qw<OOXO XOOO XOOX OXOO> if @input ~~ Empty;            
our @matrix = @input.map({.comb});
my @lonely;

## work
for ^@matrix[0].elems X ^@matrix.elems -> ($x, $y) {
    if (@matrix[$y][$x] eq 'X' and is_lonely($x, $y)) {
        @lonely.push: ($x, $y);
    }
}

## out
.join(' ').say for @matrix;
say '';
for @lonely -> @point {
    my ($col, $row) = @point.map({$_+1});
    say "the X at column → $col, row down ↓ $row is lonely";
}

sub is_lonely {
    my ($x, $y) = @_;
    
    for ((-1,0,1) X (-1,0,1)).grep( * !eqv (0,0)) -> $offset {
        next if 0 > any ($x + $offset[0]) | ($y + $offset[1]);
        next if ! defined @matrix[ $y + $offset[1] ][ $x + $offset[0] ];
        return 0 if @matrix[ $y + $offset[1] ][ $x + $offset[0] ] eq 'X';  
    }
    return 1;    
}
