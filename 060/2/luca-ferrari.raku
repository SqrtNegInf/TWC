#!/usr/bin/env raku


sub MAIN ( ){
    my @L = (0, 1, 2, 5);
    my $x = 2;
    my $y = 21;
    my @LL;

    # start from the very beginning of the list limiting
    # the numbers in the range of $y
    for ( 1 x $x ) - 1 ..^ $y {

        # see if the numbers "grep" the list
        my $found = 0;
        $found++ if $_ == any( @L ) for $_.comb;
        @LL.push: $_ if $_.comb.elems == $found;
    }

    say @LL.join( ', ' );
}
