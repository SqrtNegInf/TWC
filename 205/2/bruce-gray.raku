#!/usr/bin/env raku

# In Raku, we can solve the task in one line:
sub task2_short { @_.unique.combinations(2).map({ [+^] .list }).max }

# But with a bit of analysis, we can go *much* faster!
# See blog post for explanation of the algorithm.
# https://blogs.perl.org/users/bruce_gray/2023/02/twc-205-exclusive-third-or-first.html
sub task2_fast ( @ns ) {
    sub hi-bit ( UInt $n ) { $n.log2.floor }

    my %grouped = @ns.unique.classify(&hi-bit);

    my ($top_group, @lesser_groups) = %grouped.sort(-*.key).map(*.value);

    if !@lesser_groups {
        my $removes_hi-bit = 1 +< hi-bit($top_group[0]);
        return task2_fast( $top_group.list »-» $removes_hi-bit );
    }
    else {
        return [max] @lesser_groups.map: {
            ($top_group.list X+^ .list).max;
        }
    }
}

my &tasks = &task2_short;
my &taskf = &task2_fast;
my @tests =
    ( (  1, 2, 3,  4, 5, 6, 7 ),    7 ),    #  1 xor 6 =  7
    ( (  2, 4, 1,  3          ),    7 ),    #  4 xor 3 =  7
    ( ( 10, 5, 7, 12, 8       ),   15 ),    # 10 xor 5 = 15

    #( [ flat(1 .. 4095)       ], 4095 ),    # short=113sec, fast=5sec !!! DH: works, but slow to test, skip
;

use Test;
plan +2*@tests;
is tasks(.[0]), .[1] for @tests;
is taskf(.[0]), .[1] for @tests;
