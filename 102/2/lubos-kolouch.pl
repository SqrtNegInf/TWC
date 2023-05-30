#!/usr/bin/env perl
use v5.36;

sub get_hash {
    my $what = shift;
    
    # we know the last position has length
    # of the input. So we can just backtrack
   
    my $output = '';

    my $pos = $what;
    while ($pos > 0) {
        my $append_str = $pos.'#';

        if ($pos > 1) {
            $output = $pos.'#'.$output;
        } else {
            $output = '#'.$output;
        }

        $pos -= length($append_str);
    }

    return $output;
}

use Test::More;

is_deeply(get_hash(1), '#');
is_deeply(get_hash(2), '2#');
is_deeply(get_hash(3), '#3#');
is_deeply(get_hash(10), '#3#5#7#10#');
is_deeply(get_hash(14), '2#4#6#8#11#14#');

done_testing;
