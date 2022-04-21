#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/ say /;

my $data = { apple => 3, cherry => 2, banana => 1 };

generate_bar_graph( $data, 'v' );

sub generate_bar_graph {
    my $bar_graph_data_ref = shift;
    my %bar_graph_data     = %{$bar_graph_data_ref};
    my $max_length_key     = get_max_length_keys($bar_graph_data_ref);
    my $sort_by            = ( defined $_[0] and $_[0] eq 'v' ) ? 'v' : 'l';
    my @sorted_keys        = get_sorted_keys( $bar_graph_data_ref, $sort_by );
    for my $key (@sorted_keys) {
        say sprintf '%*3$s | %s',
            $key, '#' x $bar_graph_data{$key}, $max_length_key;
    }
}

sub get_sorted_keys {
    my $bar_graph_data_ref = shift;
    my %bar_graph_data     = %{$bar_graph_data_ref};
    my $sort_by            = shift;
    my @sorted_keys;
    if ( $sort_by eq 'l' ) {
        @sorted_keys = sort keys %bar_graph_data;
    }
    else {
        @sorted_keys
            = reverse sort { $bar_graph_data{$a} <=> $bar_graph_data{$b} }
            keys %bar_graph_data;
    }
    return @sorted_keys;
}

sub get_max_length_keys {
    my $bar_graph_data_ref = shift;
    my %bar_graph_data     = %{$bar_graph_data_ref};
    my $max_length_key     = 0;
    for my $key ( keys %bar_graph_data ) {
        $max_length_key = length $key if length $key > $max_length_key;
    }
    return $max_length_key;
}
