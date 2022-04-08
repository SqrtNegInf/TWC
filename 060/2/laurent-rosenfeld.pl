#!/usr/bin/env perl
use strict;
use warnings;
use feature qw /say/;

my $length = 2;
my $max_val = 21;
my @L = (0, 1, 2, 5);

sub permute {
    my ($seed, @list) = @_;
    return if length $seed > $length;
    for my $val (@list) {
        next if $seed eq "" and $val == 0;
        my $new_seed = 0 + ($seed . $val);
        say $new_seed if length $new_seed == $length
            and $new_seed < $max_val;
        permute($new_seed, @list);
    }
}

permute "", @L;
