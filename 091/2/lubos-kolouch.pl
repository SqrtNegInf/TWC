#!/usr/bin/env perl
use v5.36;

sub jump {
    my $in_arr = shift;

    # test if each zero can be overjumped
    
    my $pos = 0;
    for my $num (@$in_arr) {
        if ($in_arr->[$pos] == 0) {
            my $offset = 1;
            # work backwards and stop if we can jump over or at the beginning
            while ($pos - $offset  >= 0) {
                my $test_pos = $pos - $offset;

                my $elem_at_pos = $in_arr->[$pos - $offset];

                last if ($elem_at_pos + $pos - $offset > $pos);
                $offset++;
            } 

            return 0 unless $pos - $offset > 0;
        }
        $pos++;
    }

    return 1;

}

use Test::More;

is(jump([1, 2, 1, 2]), 1);
is(jump([2, 1, 1, 0, 2]), 0);
is(jump([2, 1, 2, 0, 2]), 1);
done_testing;
