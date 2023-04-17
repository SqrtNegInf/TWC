#!/usr/bin/env perl

use v5.36;
sub tr_letter {
    my $ord = ord shift;
    return ($ord >= 97)
        ? chr ( ( $ord - 97 + shift ) % 26 + 97 )
        : chr ( ( $ord - 65 + shift ) % 26 + 65 );
}

sub tr_word {
    my $word = shift;
    my $jump = shift;
    return join '',
        map { tr_letter [split '', $word]->[$_], $jump->[$_] }
            0..(length $word)-1;
}

my $word = 'Perl';
my @jump = (2,22,19,9);

say tr_word($word, \@jump);

$word = 'Raku';
@jump = (24,4,7,17);
say tr_word($word, \@jump);
