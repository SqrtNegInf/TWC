#!/usr/bin/env perl
use v5.36;

my $pie                  = 360;
my $current_guest        = 1;
my $guest_with_max_share = 1;
my @share_of_pie;

while ( $pie != 0 ) {
    my $current_share = $pie * ( $current_guest / 100 );
    $pie -= $current_share;
    $share_of_pie[$current_guest] = $current_share;
    if ( $share_of_pie[$guest_with_max_share] < $current_share ) {
        $guest_with_max_share = $current_guest;
    }
    $current_guest++;
}

say "Guest $guest_with_max_share gets the largest piece of the pie.";
