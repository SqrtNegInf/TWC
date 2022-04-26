#!/usr/bin/env raku
unit sub MAIN (@file = <sample.txt sample1.txt sample2.txt>);

my %index;

for @file.map(*.?IO).grep({.?f && .?r}) -> $file {
  %index.push:
    $file.comb(/\w+/, :match).map({ .Str.fc => $($file.path => .pos,) });
    #$file.comb(/\w+/, :match).hyper.map({ .Str.fc => $($file.path => .pos,) });
}

say("$_:{ %index{$_}.keys.join(",") }") for %index.keys.sort;

#while my $word = prompt 'Find? ' {
#  %index{$word.fc}».say;
#}
