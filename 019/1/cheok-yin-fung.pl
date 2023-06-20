#!/usr/bin/env perl
use v5.36;

use Time::Piece;

my @months = (1, 3, 5, 7, 8, 10, 12);

sub isFridayStart {
    my $year = $_[0];
    my $month = $_[1];
    return
      Time::Piece->strptime($year."-".$month."-01", "%Y-%m-%d")
        ->day_of_week == 5;
}

for my $i (1900..2019) {
    for my $j (@months) {
        if (isFridayStart($i, $j)) {
            print Time::Piece->strptime($i."-".$j."-01", "%Y-%m-%d")
                ->strftime("%Y %B"), 
                 "\n";
        }
        # printf("%4d %2d\n", $i, $j) if isFridayStart($i, $j);
    }
}

