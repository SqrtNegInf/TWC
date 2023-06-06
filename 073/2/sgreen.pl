#!/usr/bin/env perl
use v5.36;

sub main {
    my @list        = @_;
    my $current_min = $list[0];

    my @result = (0);
    foreach my $i ( 1 .. $#list ) {
        if ( $list[$i] < $current_min ) {
            push @result, 0;
            $current_min = $list[$i];
        }
        else {
            push @result, $current_min;
        }
    }

    say join ', ', @result;
}

main((7, 8, 3, 12, 10));
