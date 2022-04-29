#!/usr/bin/env raku

sub MAIN(Int $line-width=72) {
    for 'brlipsum.txt'.IO.lines -> $paragraph {
        my $space-left = $line-width;
        for $paragraph.split(/ ' '+ /) -> $word {
            if $word.chars + 1 > $space-left {
                say "";
                $space-left = $line-width - $word.chars;
            }
            else {
                $space-left -= ($word.chars + 1);
            }
            print "$word ";
        }
    }
    say "";
}
