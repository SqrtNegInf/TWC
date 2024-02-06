#!/usr/bin/env raku

use Test;

my @Test = [
    "",         "",
    "' '",      "' '",
    "Url",      "Url",
    "url",      "url",
    "Raku",     "Ruka",
    "RAku",     "RUka",
    "RAkU",     "RUkA",
    "RakU",     "RukA",
    "Perl",     "Perl",
    "Julia",    "Jaliu",
    "Uiua",     "Auiu",  
    "Juniper tea", "Janeper tiu"
];

plan @Test ÷ 2;

sub vowel-reverse( Str $a --> Str) {
    my @word   = $a.comb;
    my @vowel  = @word.grep( / <[aAeEiIoOuU]>/)».lc;    
    return $a if +@vowel.chars <= 1;

    my @uc-pos = @word.grep( /<[AEIOU]>/, :k);
    my @v-pos  = @word.grep: / <[aAeEiIoOuU]>/, :k ;
    @word[@v-pos] = @vowel.reverse;
    @word[@uc-pos]».=uc;
    return @word.join;
}

for @Test -> $in, $exp {
    is vowel-reverse($in), $exp, "$in -> $exp";
}
done-testing;

my $s = qq{Et's nit POERL at's Paarl, but that wes tikan se ot's Pirl.};

say "\nInput: \$s = $s\nOutput: &vowel-reverse( $s)";

my $r = qq{It's not PEARL it's Pearl, but that was taken so it's Perl.};
die unless vowel-reverse($s) eq $r;
exit;

