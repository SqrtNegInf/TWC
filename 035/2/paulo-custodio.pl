#!/usr/bin/env perl
use v5.36;

use Text::Morse;

sub decode_bin_morse {
    my($encoded) = @_;
    for ($encoded) {
        s/0+$//;                # remove trailing zeros
        s/0000000/\n/g;         # word gap
        s/000/ /g;              # character gap
        s/1110?/-/g;            # -
        s/10?/./g;              # .
    }
    my $morse = Text::Morse->new;
    my $text = $morse->Decode($encoded);
    return $text;
}

say decode_bin_morse('101010001110111011100010101');
