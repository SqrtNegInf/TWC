#!/usr/bin/env raku

sub SOLUTION($_) {
    my @reversed-vowels = .lc.flip.comb.grep: /<[aeiou]>/;
    .lc.comb.map({ /<[aeiou]>/ ?? @reversed-vowels.shift !! $_ }).join.samecase($_)
}

#multi MAIN (Bool :$test!) {
    use Testo;

    my @tests =
        %{ input => "Raku", output => "Ruka" },
        %{ input => "Perl", output => "Perl" },
        %{ input => "Julia", output => "Jaliu" },
        %{ input => "Uiua", output => "Auiu" },
    ;

    .<input>.&SOLUTION.&is-eqv: .<output>, .<text> for @tests;
#} # end of multi MAIN (Bool :$test!)

exit;
