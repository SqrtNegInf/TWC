#!/usr/bin/env perl
use v5.36;

sub as_we_read {
    my $what = shift;

    my $solution = '';

    my $pos = 1;
    my $count = 1;
    my $last_char = substr($what, 0, 1);

    while ($pos <= length($what)) {
        if (($pos == length($what)) or (substr($what, $pos, 1) != $last_char)) {
            $solution .= $count.$last_char;
            $count = 1;
            $last_char = substr($what, $pos, 1);
        } else {
            $count++;
        }


        $pos += 1;
    }

    return $solution;

}

use Test::More;

is(as_we_read(1122234), 21321314);
is(as_we_read(2333445), 12332415);
is(as_we_read(12345), 1112131415);

done_testing;
