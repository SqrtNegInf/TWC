#!/usr/bin/env raku

for 'words.txt'.IO.lines
{
    next unless .chars ~~ 2..8;

    my \word = .lc;

    if word ~~ /^ <[a..filost]>+ $/ 
    {
        say word.trans('ilost' => '11057') 
    }
}
