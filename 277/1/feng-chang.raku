#!/usr/bin/env raku

#unit sub MAIN(Str:D \s1, Str:D \s2);
my \s1 = 'my red dog';
my \s2 = 'red flag warning';

put +[(&)] (s1, s2).map({ .words.Bag.grep(*.value==1)».key });
