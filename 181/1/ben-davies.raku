#!/usr/bin/env raku

unit sub MAIN(IO:D(Str:D) $input = 'paragraph.txt');
my $paragraph = $input.slurp;
put gather while $paragraph -> $_ is raw {
    s/ ^ <:Z+:C>+ //;
    push state @sentence, $/ when s/ ^ <:!Z+:!C+:!Sentence_Terminal>+ //;
    take @sentence.splice.sort(*.lc leg *.lc) ~ $/ when s/ ^ <:Sentence_Terminal>+ //;
}
