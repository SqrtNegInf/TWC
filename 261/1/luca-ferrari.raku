#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
my @nums = (1, 2, 3, 45);
    my $result = @nums.sum -  @nums.map( *.comb ).flat.sort.sum;
    ( $result < 0 ?? $result * -1 !! $result ).say;
#}
