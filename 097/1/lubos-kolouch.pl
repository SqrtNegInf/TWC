#!/usr/bin/env perl
use v5.36;

sub caesar_cipher {
    my $what = shift;

    my $inp = $what->[0];
    my $shift = $what->[1];

    my $result = '';

    for (split '', $inp) {
        
        if (((ord($_) < ord('A')) or (ord($_) > ord('Z')))) {
                    $result .= $_;
                    next;
        }

        my $translated = ord($_) - $shift;

        $translated = ord('Z') - ord('A') + $translated + 1 if $translated < ord('A');

        $result .= chr($translated);
    }

    return $result;
}

use Test::More;

is(caesar_cipher(['THE QUICK BROWN FOX JUMPS OVER THE LAZY DOG',3]),'QEB NRFZH YOLTK CLU GRJMP LSBO QEB IXWV ALD');
is(caesar_cipher(['ABCDEFGHIJKLMNOPQRSTUVWXYZ', 3]), 'XYZABCDEFGHIJKLMNOPQRSTUVW');

done_testing;
