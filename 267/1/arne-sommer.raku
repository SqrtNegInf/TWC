#!/usr/bin/env raku

#unit sub MAIN (*@ints where all(@ints) ~~ Int && @ints.elems > 0, :v(:$verbose));
my @ints = (-1, -2, -3, -4,  3,  2,  1);


my $product = [*] @ints;

#say ": Product: $product" if $verbose;

# say $product ?? ( $product / $product.abs ) !! 0;

say + ($product <=> 0);
