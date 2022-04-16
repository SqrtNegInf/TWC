#!/usr/bin/env raku

my %*SUB-MAIN-OPTS = :named-anywhere;

#| Given a list of values and a list of sorting indicies
#| Return the list with the requests indicies sorted

#sub MAIN (:$verbose, :$list######### = "10 4 1 8 12 3", :$sort = "0 2 5")

sub MAIN (
    Str() $list = "10 4 1 8 12 3", #= Seperated list
    Str() $indices = "0 2 5", #= List of indicies
    Str() :s(:$sep) where
            {
                $list ~~ m/^(<[0..9]>+) + % $sep $/ &&
                $indices ~~ m/^(<[0..9]>+) + % $sep $/
            } = ' ', #= Optional seperator. Defaults to ','
) {
    my @list = $list.split($sep).map(*.Int);
    my @indices = $indices.split($sep).map(*.Int);
    @list[@indices] = @list[@indices].sort;
    say @list.join($sep);
}
