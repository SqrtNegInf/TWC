#!/usr/bin/env raku

sub rt(Str $s, Int $n where * > 0) {
    $s.substr(($n % $s.chars)) ~ $s.substr(0..^($n % $s.chars))
}

my $word  = 'xyxx';
say (1..*).first({ rt($word, ($_*($_+1)/2).Int) eq $word }, :k)+1
