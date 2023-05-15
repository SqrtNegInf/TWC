#!/usr/bin/env perl
use v5.36;

use List::Util qw(all reduce sum0);

run() unless caller();

sub run() {
    #my @valuables = @ARGV;
    my @valuables = (4, 2, 3, 6, 5, 3);
    die "Invalid input\n" unless all { m/^-?\d+$/ } @valuables;

    rob_house(@valuables);

}

sub rob_house (@valuables) {
    my @tours = plan_tour($#valuables);

    my $best_tour = reduce sub {
        my @tour       = @$b;
        my $tour_value = sum0 map { $valuables[$_] } @tour;
        if ( $tour_value > $a->{value} ) {
            return {
                value => $tour_value,
                tour  => [@tour],
            };
        }
        if ( $tour_value == $a->{value} && @tour < @{ $a->{tour} } ) {
            return {
                value => $tour_value,
                tour  => [@tour],
            };
        }

        return $a;

    }, { value => 0, tour => [] }, @tours;

    #print Dumper $best_tour;
    say $$best_tour{value};
    #say "@{$$best_tour{tour}}\n";
    say join ' ', %$best_tour{tour}->@*;
    say '';
}

sub plan_tour ( $max, $cur = 0 ) {
    return [] if $cur > $max;
    my @paths = (
        ( map { [ $cur, @$_ ] } plan_tour( $max, $cur + 2 ) ),
        plan_tour( $max, $cur + 1 )
    );

    return @paths;
}
