#!/usr/bin/env perl

use strict;
use warnings;
use feature qw(state);

use Test::More;

my $cases = [
    [3, 1, 5, 8],
    [1, 5],
];

sub box_coins
{
    state $sum = 0;
    sub box_coins_2
    {
        my $l = shift;
        my $s = shift;

        for(my $i=0; $i<@$l; ++$i) {
            my @l = @$l;
            my $v = $s + (($i == 0 ? 1 : $l[$i-1]) * $l[$i] * ($i == $#l ? 1 : $l[$i+1]));
            splice(@l, $i, 1);
            box_coins_2(\@l, $v);
        }
        #print "called with: @$l -- $s\n";
        $sum = $s if $s > $sum;
        return $sum;
    }
    $sum = 0;
    box_coins_2(@_);
}

is(box_coins($cases->[0], 0), 167, '[3, 1, 5, 8]');
is(box_coins($cases->[1], 0), 10,  '[1, 5]');
done_testing();

exit 0;
