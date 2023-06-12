#!/usr/bin/env raku
use Test;

my @Test =
    < r >,          ("Perl", "Rust", "Raku"),
    < e l v >,      ("love", "live", "leave"),
    < e l v >,      ("loove", "live", "leave"),
    (),             ("happiness", "rich", "common"),
    < e s >,        ("happiness", "riches", "commonness"),
    < g o >,        <god dog dogooder dogged gold goose gooseneck
                        gosling goes vetoing gasoline gooey plodding
                        goon gong Gideon gobsmacking forgotten foundling
                        dingdong dotting encompassing openning begoggled
                        monogamy 
                    >,
    < g o >,       ( <god dog dogooder dogged gold goose gooseneck
                        gosling goes vetoing gasoline gooey plodding
                        goon gong Gideon gobsmacking forgotten foundling
                        dingdong dotting encompassing openning begoggled
                        monogamy 
                    > xx 1000).flat,
;
plan @Test ÷ 2;

sub universal-letters( @a) {
    my @w = @a».lc;
    my @ret = @w.pop.comb;
    for @w -> $word {
        @ret = $word.comb.unique.grep( * ~~ @ret.any);
        return [] if @ret ~~ Empty;
    }
    @ret.sort.Array;
}

for @Test -> $exp, $in {
    is universal-letters(@$in), @$exp, "@$exp.raku()\t<-- @$in[]";
}
done-testing;

my @word = ("happiness", "riches", "commonness");
say "\nInput: @words = @word.raku()\nOutput: ", universal-letters(@word).raku;
