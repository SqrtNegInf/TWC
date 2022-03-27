#!/usr/bin/env raku
use Test;
plan 2;

my $S = "The Weekly Challenge";
ok words-length($S) == 6, "$S = 6";

$S = "Markmið lífs okkar er að vera hamingjusöm";
ok words-length($S) == 17, "$S = 17";

sub words-length($S) {
    $S.words[1..*-2].join.chars;
}
