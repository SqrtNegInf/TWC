#!/usr/bin/env perl
use v5.36;

use constant CHARACTER_GAP => '000';
use constant WORD_GAP => '000000';

my %to_morse = (
    'A' => '10111',
    'B' => '111010101',
    'C' => '11101011101',
    'D' => '1110101',
    'E' => '1',
    'F' => '101011101',
    'G' => '111011101',
    'H' => '1010101',
    'I' => '101',
    'J' => '1011101110111',
    'K' => '111010111',
    'L' => '101110101',
    'M' => '1110111',
    'N' => '11101',
    'O' => '11101110111',
    'P' => '10111011101',
    'Q' => '1110111010111',
    'R' => '1011101',
    'S' => '10101',
    'T' => '111',
    'U' => '1010111',
    'V' => '101010111',
    'W' => '101110111',
    'X' => '11101010111',
    'Y' => '1110101110111',
    'Z' => '11101110101',
    '1' => '10111011101110111',
    '2' => '101011101110111',
    '3' => '1010101110111',
    '4' => '10101010111',
    '5' => '101010101',
    '6' => '11101010101',
    '7' => '1110111010101',
    '8' => '111011101110101',
    '9' => '11101110111011101',
    '0' => '1110111011101110111',
);

sub morse_encode {
    my ($message) = @_;

    my @words = split /\W/, $message;

    for my $word (@words) {
        my @chars = split q{}, $word;
        for my $c (@chars) {
            if (exists $to_morse{uc $c}) {
                $c = $to_morse{uc $c};
            }
        }
        $word = join CHARACTER_GAP, @chars;
    }

    return join WORD_GAP, @words;
}

say morse_encode('SOS');
