#!/usr/bin/env raku

use Test;

# freq -- Take a str return true if one char can be deleted leaving
#   all remaining letter-values occurring equally.
#
#   There are two versions; the default is that more than one
#   letter-value must remain, i.e. 'ab'.
#
#   If the SINGLE flag is raised, a single letter value suffices, i.e.
#   'a'.
proto freq( Str $s, | ) {

    return False if $s.chars ≤ 1;

    my %*h = Bag.new( Bag.new( $s.comb).values);    # size => set-ct

    when %*h.elems > 2 { return False }

    if %*h.elems ==  1 {
        my ( $size, $set-ct ) = %*h.keys[0], %*h.values[0];
        return True if $size == 1 and $set-ct > 2;      # abc
        return False if $size > 1 and $set-ct > 1;      # aabb
    }

    if %*h.elems == 2 {
        if %*h<1>:exists and %*h<1> == 1 and %*h.keys.max == 2
                and %*h{%*h.keys.max} == 1
            { return True }
    }
    {*}
}

multi freq( Str $s --> Bool) {

    if %*h.elems == 2 {
        if %*h<1>:exists and %*h<1> == 1 and %*h{%*h.keys.max} == 1
            { return False }
        if %*h<1>:exists and %*h<1> == 1
            { return True; }

        my $max-size = %*h.keys.max;
        if $max-size - 1 ≠ %*h.keys.min { return False }
        if $max-size - 1 == %*h.keys.min and %*h{$max-size} ≠ 1 { return False}
        if %*h{$max-size} == 1 and $max-size -1 == %*h.keys.min { return True }
    }

    if %*h.elems ==  1 {
        my ( $size, $set-ct ) = %*h.keys[0], %*h.values[0];

        return False if $size == 1 and $set-ct == 2;    # ab
        return False if $set-ct == 1;     # a … aaaa
    }
}

multi freq( Str $s, Bool :$SINGLE! --> Bool) {

    if %*h.elems == 2 {
        if %*h<1>:exists and %*h<1> == 1 { return True; }
        my $max-size = %*h.keys.max;
        if $max-size - 1 == %*h.keys.min and %*h{$max-size} ≠ 1 { return  False}
        if %*h{$max-size} == 1 and $max-size -1 == %*h.keys.min { return True }
        if $max-size  - 1 ≠ %*h.keys.min { return False }
    }

    if %*h.elems ==  1 {
        my ( $size, $set-ct ) = %*h.keys[0], %*h.values[0];

        return True if $size == 1 and $set-ct > 1;      # reduce ab… 
        return True if $size > 1 and $set-ct == 1;      # reduce aa…
    }
}

sub justify( $s --> Str) {
    my $ret = '';
    my $prev = Str;
    my @a = $s.comb.sort;
    while @a { 
        my $c = @a.shift;
        $ret ~=  $c ~~ $prev ?? $c !! " $c";
        $prev = $c; 
    }
    $ret;
}

#multi MAIN( 'test') {
    my @Test =
        { in => 'a',        exp => False, single => False },
        { in => 'aa',       exp => False, single => True },
        { in => 'ab',       exp => False, single => True },
        { in => 'abc',      exp => True, single => True },
        { in => 'aaabbc',   exp => False, single => False },
        { in => 'aabb',     exp => False, single => False },
        { in => 'abbb',     exp => False, single => True },
        { in => 'aabbcd',   exp => False, single => False },
        { in => 'aabbbb',   exp => False, single => False },
        { in => 'abbcccd',  exp => False, single => False },
        { in => 'aabbc',    exp => True, single => True },
        { in => 'abbc',     exp => True, single => True },
        { in => 'aabbbcc',  exp => True, single => True },
        { in => 'abcdeff',  exp => True, single => True },
        { in => 'aabbccddeefff',  exp => True, single => True },
        { in => 'abb',      exp => True, single => True },
        { in => 'aaabbbcccdddeeeff',  exp => False, single => False },
    ;
    plan 2 × @Test;
    for @Test -> %t {
        is freq(%t<in>), %t<exp>, "%t<exp>\t<- %t<in>";
    }
    for @Test -> %t {
        is freq(%t<in>, :SINGLE), %t<single>, " SINGLE %t<single>\t<- %t<in>";
    }
    done-testing;
#}

#multi MAIN( Str $str = 'aaicocciaoouiacio') {
#    say "Input: \$s = $str\n"
#      ~ "Output: ", freq($str).Int(), '   because: ', justify($str);
#}
