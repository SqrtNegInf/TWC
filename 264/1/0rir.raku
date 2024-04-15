#!/usr/bin/env raku

use Test;

my @Test =
    '',                                 Str,
    'PeRlwEeKLy',                       'L',
    'ChaLlenge',                        'L',
    'The',                              Str,
#    'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstyvwxy'
#            .split( '').pick( *).join,  'Y',
;
plan @Test ÷ 2;

# Return the greatest letter else a Str type object.
sub greatest-letter( Str $a --> Str) {
    my Str @a = $a.comb;

    my Str @u                              # ucase candi's in greatest order
        = @a.grep( * ~~ / <:Lu> / ).sort.squish.reverse;
    return Str if @u ~~ Empty;

    my Str @l = @a.grep( * ~~ / <:Ll> / )».uc;  # lcase validators ucased
    return Str if @l ~~ Empty;

    @u.first( * ~~ @l.any) // Str;         # get 1st valid candi
}

for @Test -> $in, $exp {
    is greatest-letter($in), $exp, "$exp.raku() <- $in";
}

done-testing;

#my $str = 'ABCDEFGHIJK=LMNPQRS-TUV1@WX0123:56789yzabcdefghijklmnopqrstyvwxyz'
#        .split( '').pick( *).join;
#say "\nInput: \$str = $str\nOutput: '", greatest-letter( $str) // '', "'";
