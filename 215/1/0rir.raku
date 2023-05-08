#!/usr/bin/env raku

# Return count of words in @a whose chars are not in alphabetic order.
sub disorderly-char( @a -->Int) {
    die 'Void' if @a == [];

    my $bad = 0; 
    for @a -> $w {
        ++$bad if $w !~~ $w.comb.sort.join;
    }
    $bad;
}

# Return count of words in @a which are not in alphabetic order.
sub disorderly-list( @a -->Int) {
    die 'Void' if @a == [];

    return 0 if @a.elems == 1;
    return @a.end if @a[0] gt @a[1];

    quietly @a.end - (@a,(@a[*-1]~'a')).flat.first: { $_ gt @a[ ++$ ]}, :k;
}

my @Test =
    # data       char-exp   list-exp
    <x y z>,            0,  0,
    <abc xyz tsu>,      1,  1,
    <rat cab dad>,      3,  2,
    ('a',),             0,  0,
    ('b','a'),          0,  1,
    <b b>,              0,  0,
    ('abc',),           0,  0,
    ('cba',),           1,  0,
    <za za ab az xa>,   3,  3,
    <az za>,            1,  0,
    <a a b b b >,       0,  0,
    <uv wx yz aa>,      0,  1,
    <uv wx yz aa cb>,   1,  2,
    <uv wx aa>,         0,  1,
    <uv wx aa cb>,      1,  2,
;

my @Dead = [(),];

use Test;
plan 2 × @Test/3 + 2 × @Dead;

for @Dead -> @in {
    dies-ok { disorderly-char(@in)}, "@in.raku.Str() by chars dies";
    dies-ok { disorderly-list(@in)}, "@in.raku.Str() by words dies";
}
for @Test -> @in, $char, $word {
    is disorderly-char(@in), $char, "by chars: $char <= @in[]";
    is disorderly-list(@in), $word, "by words: $word <= @in[]";
}

done-testing;

my @word =('xyz', 'abc', 'tsu');
say "\nInput: @word = @word[]\nOutput: ", disorderly-char(@word),
            "                   # by chars";
say "\nInput: @word = @word[]\nOutput: ", disorderly-list(@word),
            "                   # by words";
exit;

