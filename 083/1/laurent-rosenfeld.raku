#!/usr/bin/env raku

my $str = @*ARGS[0] // "Markmið lífs okkar er að vera hamingjusöm";
my $trimmed = join "", $str.words[1..*-2];
say $trimmed.chars;
