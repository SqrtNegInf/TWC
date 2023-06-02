#!/usr/bin/env perl
use v5.36;

for my $string (
    "the weekly challenge",
    "the purpose of our lives is to be happy",
    "the life of the land is perpetuated in righteousness",
    "there's more than one way to do it",
    " this is a test ",
    " Markmið lífs okkar er að vera hamingjusöm "
    )
{
    words_length($string);
}

sub words_length ( $string ) {
    $string =~ s/^\s|\s$//gmix;
    my @string = split /\s+/, $string;
    pop @string; shift @string;
    my $newstring = join '', @string;
    say $string;
    say length $newstring;
    say '';
}
