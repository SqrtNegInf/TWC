#!/usr/bin/env raku
use experimental :cached;
use Test;

is rank('cat'),                                                                    3, 'cat';
is rank('secret'),                                                               255, 'secret';
is rank('google'),                                                                88, 'google';
is rank('mississippi'),                                                        13737, 'mississippi';
#is rank('1100010001100001111100000010101010001101111111111100101'), 2640733527075696, '55 bits';  # 2.640733527075696e+15

sub postfix:<!>($n) is cached { [*] 1..$n }

sub rank($word)
{
    my @w = $word.comb;
    my @ranks = @w.sort.squish.antipairs.Map{@w}; 
    my $bag = @ranks.BagHash;

    my @n = gather for @ranks -> $r
    {
        my @less-than = $bag.keys.grep(* < $r);
        take ([+] $bag{@less-than}) / ([*] $bag.values>>!);
        $bag{$r}--
    }
        
    1 + [+] @n Z* (@ranks.end...0)>>!
}
