#!/usr/bin/env perl
use v5.36;

simWords ("aba", "aabb", "abcd", "bac", "aabc");        # 2
simWords ("aabb", "ab", "ba");                          # 3
simWords ("nba", "cba", "dba");                         # 0

sub simWords(@array)
{
    # splitting the string, sorting it, re-joining it, 
    # squashing via the translate operator with modifier -s, returning the changed string -r
    @array = map{  ( join("" , sort split(//, $_))) =~ tr/a-z/a-z/sr} @array;

    my $sum = 0;
    
    foreach my $elem (@array)
    {
        foreach my $elemInner (@array)
        {
            $sum++      if( $elem eq $elemInner);
        }
        $sum--;     # since it counted itself
    }
    say $sum / 2 ;  # since it counted twice

}
