#!/usr/bin/env perl
use v5.36;

use Data::PowerSet qw/ powerset /;

my $max_weight      = 15;
my @colours         = qw/ R B G Y P /;
my @weights         = qw/ 1 1 2 12 4 /;
my @amount          = qw/ 1 2 2 4 10 /;
my @number_of_boxes = qw/ 2 3 4 5 /;

for my $number_of_boxes (@number_of_boxes) {
    my $max_sets = get_max_sets( $number_of_boxes, $max_weight );
    for my $set (@$max_sets) {
        my $amount = 0;
        print "With $number_of_boxes boxes: ";
        for my $position (@$set) {
            print "$colours[$position] ($weights[$position] kg) ";
            $amount += $amount[$position];
        }
        print "(GBP $amount) should be choosen.\n";
    }
}

sub get_max_sets {
    my $max_boxes  = shift;
    my $max_weight = shift;
    my $powerset   = powerset( { max => $max_boxes }, 0 .. ( @amount - 1 ) );
    my $max_seen_amount = 0;
    my $max_seen_weight = 0;
    my @max_seen_set;
    SET: for my $set (@$powerset) {
        my $weight = 0;
        my $amount = 0;
        for my $position (@$set) {
            $weight += $weights[$position];
            $amount += $amount[$position];
            if ( $weight > $max_weight ) {
                next SET;
            }
        }
        if ( $amount > $max_seen_amount ) {
            $max_seen_amount = $amount;
            $max_seen_weight = $weight;
            @max_seen_set    = ();
            push @max_seen_set, $set;
        }
        elsif ( $amount == $max_seen_amount && $weight < $max_seen_weight ) {
            $max_seen_weight = $weight;
            @max_seen_set    = ();
            push @max_seen_set, $set;
        }
        elsif ( $amount == $max_seen_amount && $weight == $max_seen_weight ) {
            push @max_seen_set, $set;
        }
    }
    return \@max_seen_set;
}
