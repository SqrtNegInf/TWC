#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
my @nums = (1,2,3,3,3,3,4,2);
    my %pct;
    %pct{ $_ } += 1 / @nums.elems for @nums;

    my @good_ones = %pct.kv.grep( -> $k, $v { $v >= 33 / 100 ?? True !! False } );
    exit if ! @good_ones;

    @good_ones.map( { $_[ 0 ] } ).sort.head.say;

#}
