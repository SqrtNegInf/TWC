#!/usr/bin/env raku # do-not-check

BEGIN die 'not ok - disabled: does not work with release 2022.12';

multi MAIN(Str:D $s, Str:D $t)
{
    say levenshtein-distance($s, $t)
}

multi MAIN 
{
    use Test;
    plan 4;

    is levenshtein-distance("kitten",   "sitting"),3, "kitten   -> sitting = 3";
    is levenshtein-distance("sunday",   "monday"), 2, "sunday   -> monday  = 2";
    is levenshtein-distance("saturday", "sunday"), 3, "saturday -> sunday  = 3";
    is levenshtein-distance("abxcd",    "abcd"),   1, "abxcd    -> abcd    = 1";
}

sub levenshtein-distance(Str:D $s, Str:D $t --> Int:D) 
{
    my ($m, $n) = $s.chars+1, $t.chars+1;

    my @d = [0 xx $m] xx $n;

    @d.head = [^$m];

    @d.map: { .head = $++ }         # not with v2022.12-781-g665375bab
   #@d[$_].head = $_ for ^@d.elems; # fails same way
#`{
  @d = [
    [0, 1, 2, 3, 4, 5, 6], 
    [1, 0, 0, 0, 0, 0, 0], 
    [2, 0, 0, 0, 0, 0, 0], 
    [3, 0, 0, 0, 0, 0, 0], 
    [4, 0, 0, 0, 0, 0, 0], 
    [5, 0, 0, 0, 0, 0, 0], 
    [6, 0, 0, 0, 0, 0, 0], 
    [7, 0, 0, 0, 0, 0, 0]]
}

    for 1..^$m X 1..^$n -> ($i, $j)  
    {
        @d[$j;$i] = min @d[$j-1;$i  ] + 1,
                        @d[$j  ;$i-1] + 1,
                        @d[$j-1;$i-1] + +(($s.substr: $i-1, 1)  
                                      ne  ($t.substr: $j-1, 1)) 
    }    

    @d[$n-1;$m-1]
}
