#!/usr/bin/env raku

my %IntCount;

sub MAIN( @ints = (1,2,2,1,1,3) ){
    for @ints.sort -> $int {
        if %IntCount{$int}:!exists {              # start of a new integer
            say 0 and exit unless &uniqueSoFar(%IntCount.values);
        }
        %IntCount{"$int"}++;

        LAST { say 0 and exit unless &uniqueSoFar(%IntCount.values); }
    }

say 1;

}

sub uniqueSoFar(@counts where .all ~~ Int ){
    if @counts.unique.elems !== @counts.elems {
        False;
    } else {
        True;
    }
}
