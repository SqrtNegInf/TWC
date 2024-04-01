#!/usr/bin/env raku

#unit sub MAIN (*@ints where all(@ints) ~~ Int && @ints.elems > 0, :v(:$verbose));
my @ints = (-3, 1, 2, -1, 3, -2, 4);

my $positive = (@ints.grep: * >  0).elems;
my $negative = (@ints.grep: * <  0).elems;
my $zero     = (@ints.grep: * == 0).elems;

#if $verbose
#{
#  say ": Count of positive integers: $positive";
#  say ": Count of negative integers: $negative";
#  say ": Count of zeroes: $zero";
#}

say max($positive, $negative);
