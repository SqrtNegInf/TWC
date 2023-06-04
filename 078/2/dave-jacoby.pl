#!/usr/bin/env perl
use v5.36;

my $o1 = left_rotation( [ 10, 20, 30, 40, 50 ], [ 3, 4 ] );
my $o2 = left_rotation( [ 7, 4, 2, 6, 3 ], [ 1, 3, 4 ] );

for my $o ( $o1, $o2 ) {
    for my $r ( $o->@* ) {
        print '[';
        print join ' ', $r->@*;
        say ']';
    }
    say '';
}

sub left_rotation ( $nums, $indices ) {
    my @output;
    for my $i ( $indices->@* ) {
        my @new = $nums->@*;
        for ( 1 .. $i ) {
            push @new, shift @new;
        }
        push @output, [@new];
    }

    push @output, 0 unless scalar @output;
    return wantarray ? @output : \@output;
}
