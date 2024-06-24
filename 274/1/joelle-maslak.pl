#!/usr/bin/env perl

#use JTM::Boilerplate 'script';
use v5.36;

MAIN: {
    my $sentence = join ' ', ("Perl and Raku are friends");
    $sentence =~ s/(?<!\S)([aeiou])([^\s]*)/${1}${2}ma/igs;
    $sentence =~ s/(?<!\S)([^aeiou])([^\s]*)/${2}${1}ma/igs;

    my (@words) = split /\s+/, $sentence;
    my $append = "a";
    for (@words) {
        $_ .= $append;
        $append .= "a";
    }
    $sentence = join " ", @words;
    say $sentence;
}
