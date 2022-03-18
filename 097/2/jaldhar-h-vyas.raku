#!/usr/bin/env raku

sub MAIN(
    Str $B = '101100101', #= a binary string
    Int $S = 4 #= size of substrings
) {
    my @substrings = $B.comb($S.Int).map({ $_.parse-base(2); });
    my $template = @substrings.shift;

    say [+] @substrings.map({ sprintf("%b", $template +^ $_) ~~ m:g/ 1 /; });
}
