#!/usr/bin/env raku

sub modcount($str) {
    return $str.split(/\s+/).[1..*-2].map(*.chars).sum;
}

say modcount('Markmið lífs okkar er að vera hamingjusöm');
