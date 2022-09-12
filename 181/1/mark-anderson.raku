#!/usr/bin/env raku

# what's wrong ???
#use Text::Wrap;

say 'paragraph.txt'.IO.slurp
                                .trans(/\n/ => ' ')
                                .split('.')
                                .map({ .words.sort(*.lc) })
                                .join('. '), :width(60);
