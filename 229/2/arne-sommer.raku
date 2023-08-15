#!/usr/bin/env raku

#unit sub MAIN ($one, $two, $three, :v(:$verbose));

my @array1 = [4,];
my @array2 = [2, 4];
my @array3 = [1,2,4];
   
my $bag    = (@array1.unique, @array2.unique, @array3.unique).Bag;
my $ok     = $bag.grep( *.value >= 2 );

#say ":All: { $bag.raku }" if $verbose;
#say ":Ok: { $ok.raku }"   if $verbose;

say $ok.elems;

