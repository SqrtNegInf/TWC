#!/usr/bin/env raku

my @files = '../00-blogs';
    #Task 1 - a Test of Bag and Bag addition
    my Bag $counts = bag { 'a' .. 'z' => 0 };

    # Create a bag for each file and add counts using Bag addition ⊎ or (+)
    $counts ⊎= $_.IO.slurp.lc.comb.Bag for @files;

    say "$_: $counts{$_}"              for 'a' .. 'z';
