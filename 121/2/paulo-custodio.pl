#!/usr/bin/env perl
use v5.36;

my @dist = #read_dist();
([0, 5, 2, 7],
[5, 0, 5, 3],
[3, 1, 0, 6],
[4, 5, 4, 0]);
my($length, @path) = shortest_tour(\@dist);
say "length = $length";
say "tour = (@path)";

sub read_dist {
    my @dist;
    while (<>) {
        my @row = split(' ', $_);
        push @dist, \@row;
    }
    return @dist;
}

sub shortest_tour {
    my($dist) = @_;
    my @shortest = (100000);    # first solution
    tour($dist, \@shortest, 0, 0);
    return @shortest;
}

sub tour {
    my($dist, $shortest, $length, @path) = @_;
    my %cities;
    for (0..$#$dist) { $cities{$_}=1; }
    for (@path) { delete $cities{$_}; }
    my @pending_cities = sort {$a<=>$b} keys %cities;

    # no more cities to visit?
    if (@pending_cities == 0) {     # found solution
        $length += $dist->[$path[-1]][$path[0]];
        push @path, $path[0];
        if ($length < $shortest->[0]) {
            @$shortest = ($length, @path);
        }
    }
    else { # try each city
        for my $city (@pending_cities) {
            tour($dist, $shortest,
                 $length+$dist->[$path[-1]][$city],
                 @path, $city);
        }
    }
}
