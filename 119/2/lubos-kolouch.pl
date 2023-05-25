#!/usr/bin/env perl
use v5.36;

sub get_nth_number {
    my $what = shift;

    my $pos = 0;
    my $target = 0;

    while ($target < $what) {
        $pos++;

        next if $pos =~ /[04-9]|11/;
        $target++;
    }

    return $pos;


}
use Test::More;

is(get_nth_number(5), 13);
is(get_nth_number(10), 32);
is(get_nth_number(60), 2223);
done_testing;

