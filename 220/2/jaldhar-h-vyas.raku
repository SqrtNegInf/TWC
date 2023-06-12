#!/usr/bin/env raku

sub MAIN(
    @ints = (3,6,10,15)
) {
    my @results;

    for @ints.permutations -> $perm {
        my $squareful = True;

        for 1 .. @$perm.end -> $n {
            if sqrt(@$perm[$n - 1] + @$perm[$n]) % 1 != 0 {
                $squareful = False;
                last;
            }
        }

        if $squareful {
            @results.push(q{(} ~ @$perm.join(q{, }) ~ q{)});
        }
    }

    @results.unique.join(q{, }).say;
}
