#!/usr/bin/env raku

sub MAIN(UInt:D $col where * > 0 = 72) {
    my $words = <That's what painting is all about. It should make you feel good when you paint. The least little bit can do so much. All you have to do is let your imagination go wild. Painting should do one thing. It should put happiness in your heart. Talent is a pursued interest. That is to say, anything you practice you can do. Everybody needs a friend.>;

    my $line = '';
    for @$words -> $word {
        if $line.chars + $word.chars + 1 > $col {
            say $line;
            $line = "";

            if $word.chars > $col {
                die("Words must be ≤ $col columns long to be wrapped at column $col");
            }
        }
        $line ~= " " unless $line.chars == 0;
        $line ~= $word;
    }
    say $line unless $line.chars == 0;
}


