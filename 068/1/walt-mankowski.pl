#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my @m1 = ([1,0,1],
          [1,1,1],
          [1,1,1]);

my @m2 = ([1,0,1],
          [1,1,1],
          [1,0,1]);

print_mat(\@m1);
print_mat(\@m2);

zero_mat(\@m1);
zero_mat(\@m2);

print_mat(\@m1);
print_mat(\@m2);

sub print_mat($ar) {
    for my $row ($ar->@*) {
        printf "[%s]\n", join(", ", $row->@*);
    }
    print "\n";
}

sub zero_mat($ar) {
    my @row_flag;
    my @col_flag;

    # make a first pass to find where the 0s are
    for my $r (0..$#$ar) {
        my $row = $ar->[$r];
        for my $c (0..$#$row) {
            if ($ar->[$r][$c] == 0) {
                $row_flag[$r] = $col_flag[$c] = 1;
            } else {
                $row_flag[$r] //= 0;
                $col_flag[$c] //= 0;
            }
        }
    }

    # now set the cells to 0 if there was a 0 in its row or column
    for my $r (0..$#$ar) {
        my $row = $ar->[$r];
        for my $c (0..$#$row) {
            if ($row_flag[$r] || $col_flag[$c]) {
                $ar->[$r][$c] = 0;
            }
        }
    }
}
