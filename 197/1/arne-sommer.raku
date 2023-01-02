#!/usr/bin/env raku

#unit sub MAIN (*@list where @list.elems > 0 && all(@list) ~~ /^<[0..9]>*$/);
my @list = (1, 0, 3, 0, 0, 5);

my @non-zero = @list.grep: * != 0;
my @zero     = @list.grep: * == 0;

my @wiggly   = (@non-zero, @zero).flat;

say "(", @wiggly.join(", "), ")";
