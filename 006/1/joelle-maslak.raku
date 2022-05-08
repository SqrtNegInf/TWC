#!/usr/bin/env raku

my Pair $run;
my @runs;

#for $*ARGS.sort( { $^a <=> $^b } ) -> Int() $num {
for <1 2 3 4 9 10 14 15 16>.sort -> Int() $num {
    if ! defined $run {
        $run = Pair.new($num, $num);
    } else {
        if $run.value == $num - 1 {
            $run = Pair.new($run.key, $num);
        } else {
            @runs.append($run);
            $run = Pair.new($num, $num);
        }
    }
    $run.freeze;
}
@runs.append($run) if defined $run;

say join(",", @runs.map( { (.key ≠ .value) ?? "{.key}-{.values}" !! .key } ) );
