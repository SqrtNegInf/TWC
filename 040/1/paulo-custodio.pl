#!/usr/bin/env perl

use Modern::Perl;

show_multiple([qw( I L O V E Y O U )],
              [qw( 2 4 0 3 2 0 1 9 )],
              [qw( ! ? @ $ % ^ & * )]);

sub show_multiple {
    my(@data) = @_;
    for my $i (0 .. $#{$data[0]}) {
        for (@data) {
            print $_->[$i]," ";
        }
        print "\n";
    }
}
