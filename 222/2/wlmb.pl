#!/usr/bin/env perl
use v5.36;

use List::Util qw(first all);

my @A = (2, 7, 4, 1, 8, 1);

my @list = sort {$b <=> $a} @A;
while(@list>1){
    my ($x, $y)=splice @list, 0, 2; # Remove largest two elements.
    next unless $x-=$y;             # Were they equal?
    my $i=(first {$list[$_]<=$x} 0..@list - 1) // @list + 1; # No. Fin where to insert difference
    splice @list, $i, 0, $x;
}
say "@A->", $list[0]//0; # Print single remaining element or 0 if none.
