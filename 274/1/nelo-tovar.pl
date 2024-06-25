#!/usr/bin/env perl
use v5.36;

my @examples = ('I love Perl', 'Perl and Raku are friends', 'The Weekly Challenge');

sub goat_latin {
    my $sentence = shift;
    my @words = split ' ', $sentence;
    my $len = scalar @words;
    my $gl;

    for (my $i = 0; $i < $len; $i++) {
        if ($words[$i] =~ /^[AEIOUaeiou]/) {
            $gl .= ${words[$i]}
        }else {
            $gl .= substr($words[$i], 1) . substr($words[$i], 0, 1)
        }
        $gl .= 'ma' . 'a' x ($i+1) . ' ';
    }

    return $gl;
}

for my $element (@examples) {
    my $gl = goat_latin $element;

    printf "Input : sentence ='%s'\n" , $element;
    printf "Output : '%s'\n\n", $gl;
}
