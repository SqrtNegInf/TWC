#!/usr/bin/env perl
use v5.36;

sub get_rare_numbers {
    my $what = shift;

    my $pos = 1 . '0'x($what-1);

    my @output;
    while (1) {
        $pos++;
        last unless (length($pos) == $what);
        my $rev_num = reverse $pos;

        next unless $pos - $rev_num > 0;
        next unless sqrt($pos - $rev_num) == int(sqrt($pos - $rev_num));
        next unless sqrt($pos + $rev_num) == int(sqrt($pos + $rev_num));
        print "$pos \n";

        push @output, $pos;
    }
    
    return \@output;
}

use Test::More;

is_deeply(get_rare_numbers(2), [65]);
is_deeply(get_rare_numbers(6), [621770]);
#is_deeply(get_rare_numbers(9), [281089082]);
done_testing();

