#!/usr/bin/env perl
use v5.36;

my $text = q{
Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum
};


sub wrap {
    my ($width, $text ) = @_;
    
    my $ans = "";
    my @text = split /\s+/, $text;
    while(@text) {
        my $line = shift(@text);
        while ((@text) and (length($line) + length($text[0]) <= $width -1 )) {
           $line .= ' ' . shift(@text);
        }
        $ans .= $line . "\n";
    }

    return $ans;
}

say wrap(30, $text);
