#!/usr/bin/env raku
srand 1;;

sub pks(@a) {
    @a.[@a.keys.grep({ (-Inf, |@a).[$_+1] > (-Inf, |@a).[$_,$_+2].max })]
}

my @a=(1..50).pick(10);
say("Initial array: ", @a);
say("Peaks: ", pks(@a));

# run as <script> <size>
