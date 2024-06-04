#!/usr/bin/env raku

#sub MAIN( *@nums where { @nums.elems == @nums.grep( * ~~ Int ).elems } ) {
my @nums = [1024, 512, 256, 128, 64];
    my %bits;
    # convert numbers into an hash keyed by the binary representation
    %bits{ $_.base( 2 ).comb.grep( * ~~ 1 ).elems }.push: $_ for @nums;

    my @output;
    @output.push: |%bits{ $_ }.sort for %bits.keys.sort;
    @output.say;
#}
