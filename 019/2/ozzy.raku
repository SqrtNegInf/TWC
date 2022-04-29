#!/usr/bin/env raku
#
# Wrap paragraph provided on stdin using greedy algorithm
#

    my @words       = <That's what painting is all about. It should make you feel good when you paint. The least little bit can do so much. All you have to do is let your imagination go wild. Painting should do one thing. It should put happiness in your heart. Talent is a pursued interest. That is to say, anything you practice you can do. Everybody needs a friend>.words;
    my $word_width  = 0;

    my $line_width  = 60;
    my $space_left  = $line_width;
    my $space_width = 1;


for @words -> $w {

    $word_width = $w.chars;
    if ( ($space_left < $line_width)  &&  ($space_width + $word_width <= $space_left) )
    {
        printf " $w";
        $space_left -= ( $space_width + $word_width );
    }
    else
    {
        printf "{ $space_left == $line_width ?? "" !! "\n" }$w";
        $space_left = $line_width - $word_width;
    };
}

printf "\n";
