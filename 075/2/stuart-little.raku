#!/usr/bin/env raku

sub rect(@a) {
    @a
    .keys
    .combinations(2)
    .map({ @a[$_.[0]..$_.[1]].min*($_.[1]-$_.[0]+1) })
    .max
}

sub hist(@a) {
    (1..@a.max)
    .map( -> $val { @a.keys.map({
($val <= @a.[$_]) ?? ('#') !! (' ') })
		  })
    .reverse
    .join("\n")
}

# hmm, why @*ARGS OK in some places, not others?

my @ARGS = <2 1 4 5 3 7>;
say hist(@ARGS.map(*.Int)),
"\n" ~ ('- ' x @*ARGS) ~ "\n",
max(rect(@ARGS.map(*.Int)), @*ARGS.map(*.Int).max);
