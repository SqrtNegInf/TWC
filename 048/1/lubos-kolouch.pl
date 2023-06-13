#!/usr/bin/env perl
use v5.36;

sub get_last_man_standing {
    my $count = shift;

    my %people;

    for ( 1 .. $count ) {
        $people{$_} = 1;
    }

    my $last   = 0;
    my $switch = 0;

    while (%people) {
        for my $key ( sort { $a <=> $b } keys %people ) {

            delete $people{$key} if $switch;

            $last   = $key;
            $switch = $switch == 0 ? 1 : 0;
        }
    }

    return $last;
}

my $people_count = 50;

say get_last_man_standing($people_count);

# TESTS

use Test::More tests => 3;

is get_last_man_standing(50),37;
is get_last_man_standing(2),1;
is get_last_man_standing(3),3;

