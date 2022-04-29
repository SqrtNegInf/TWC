#!/usr/bin/env raku

sub wordWrap(Str $paragraph, Int $lineWidth) {
    my $spaceLeft = $lineWidth + 1;

    for $paragraph.words -> $word {
        my $wordWidth = $word.chars;
        if $wordWidth + 1 > $spaceLeft {
            print "\n";
            $spaceLeft = $lineWidth - $wordWidth;
        } else {
            $spaceLeft -= ($wordWidth + 1);
        }
        print "$word ";
    }
    print "\n";
}

wordWrap(q|That's what painting is all about. It should make you feel good when you paint. The least little bit can do so much. All you have to do is let your imagination go wild. Painting should do one thing. It should put happiness in your heart. Talent is a pursued interest. That is to say, anything you practice you can do. Everybody needs a friend.|,80);
