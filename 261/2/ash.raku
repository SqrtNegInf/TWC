#!/usr/bin/env raku

my @tests = 
    ((5,3,6,1,12), 3),
    ((1,2,4,3), 1),
    ((5,6,7), 2);

for @tests -> (@ints, $start is copy) {
    my $ints = @ints.Bag;

    $start *= 2 while $ints{$start};
    say $start;
}
