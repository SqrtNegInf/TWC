#!/usr/bin/env raku

#unit sub MAIN(Str:D $sent1, Str:D $sent2);
my ($sent1,$sent2) = 'Mango is sweet', 'Mango is sour';

put ($sent1, $sent2)».words.Slip.Bag.grep(*.value == 1)».key.sort;
