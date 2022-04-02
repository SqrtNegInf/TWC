#!/usr/bin/env raku

unit sub MAIN (@A  = (7, 8, 3, 12, 10), :v(:$verbose));

if $verbose
{
  say ": index 0 (@A[0]) -> () -> 0";
  (1 .. @A.end).map({ say ": index $_ (@A[$_]) -> (" ~ @A[0 .. $_ -1].join(", ") ~ ") -> "
  ~ (@A[0 .. $_ -1].min < @A[$_] ?? @A[0 .. $_ -1].min !! 0 ) })
}

say "(0, ", (1 .. @A.end).map({ my $c = @A[0 .. $_ -1].min; $c < @A[$_] ?? $c !! 0 }).join(", "), ")";
