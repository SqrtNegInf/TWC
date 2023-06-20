#!/usr/bin/env perl
use v5.36;

my $line_break  = $/;
my $space_width = 1;
my $line_width  = 72;
my @text = split /\s+/, 'Thats what painting is all about. It should make you feel good when you paint. The least little bit can do so much. All you have to do is let your imagination go wild. Painting should do one thing. It should put happiness in your heart. Talent is a pursued interest. That is to say, anything you practice you can do. Everybody needs a friend.';
my $space_left  = $line_width;

foreach my $word (@text) {
    if((length $word) + $space_width > $space_left) {
        $word = $line_break . $word;
        $space_left = $line_width - (length $word);
    }

    else {
        $space_left -= (length $word) + $space_width;
    }
}

say "@text";
