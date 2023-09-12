#!/usr/bin/env raku

my @tests = ["aba", "aabb", "abcd", "bac", "aabc"],
            ["aabb", "ab", "ba"],
            ["nba", "cba", "dba"];

for @tests -> @words {
    say "Test case: ", @words;

    my %classification = @words.classify(*.comb.unique.sort.join).grep(*.value.elems > 1);

    my $pairs = 0;
    for %classification.kv -> $k, $v {
        my @pairs = $v.combinations(2);
        $pairs += @pairs.elems;

        say "$k: ", @pairs;
    }
    say "Answer: $pairs pair{$pairs == 1 ?? '' !! 's'}.\n";
}
