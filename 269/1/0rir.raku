#!/usr/bin/env raku

use Test;

my @Test =
    (),                         False,
    (1,),                       False,
    (2,),                       False,
    (2,10),                     True,
    (2,1),                      False,
    (2, 4, 8, 16, 32),          True,
    (1, 3, 7, 16, 32),          True,
    (1, 2, 3, 4, 5),            True,
    (2, 3, 8, 16),              True,
    (1, 2, 5, 7, 9),            False,
    flat(    (1,3,5,7...4999),   4999, (* + 2) ...9_999),      False,    # 1
    flat(2,  (1,3,5,7...4999),   4999, (* + 2) ...9_997),      False,    # 1
;
plan +@Test;

sub func-first2( @a -->Bool) {
    my $first = @a.first(   * %% 2, :k ) // return False;
    @a[$first^..^@a].first( * %% 2, :k ) // return False;
    True; 
}

sub func-grep( @a -->Bool) {
    return True if  @a.grep( so * %% 2) > 1;
    False;
}
sub summary( @a -->Str) {
    @a.gist.chars < 26 ??  @a.gist
                       !!  @a.gist.substr(0,25).trim ~ '…'
}
for @Test -> @in, $exp {
    is func-first2(@in), $exp, "$exp <- &summary(@in)";
    is func-grep(  @in), $exp, "$exp <- &summary(@in)";
}
done-testing;

my @int = (1, 2, 5, 7, 9, 11, 13, 15, 2000000);

say "\nInput: @int = @int[]\nOutput: &func-grep( @int)";

