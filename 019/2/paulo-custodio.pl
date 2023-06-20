#!/usr/bin/env perl
use v5.36;

my $text = "That's what painting is all about. It should make you feel good when you paint. The least little bit can do so much. All you have to do is let your imagination go wild. Painting should do one thing. It should put happiness in your heart. Talent is a pursued interest. That is to say, anything you practice you can do. Everybody needs a friend.";
print wrap($text, 72);


sub wrap {
    my($text, $column) = @_;
    $column ||= 72;

    my $output = "";
    my $sep = "";
    my $pos = 0;
    for my $word (split(' ', $text)) {
        if ($pos + length($sep) + length($word) >= $column) {
            $output .= "\n";
            $sep = "";
            $pos = 0;
        }
        $output .= $sep . $word;
        $pos += length($sep) + length($word);
        $sep = " ";
    }
    $output .= "\n";
    return $output;
}
