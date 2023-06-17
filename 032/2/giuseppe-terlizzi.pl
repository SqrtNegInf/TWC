#!/usr/bin/env perl
use v5.36;

use Getopt::Long;


sub generate_bar_graph {

    my ($data, $sort_by_label) = @_;

    my $sort = ($sort_by_label)
        ? sub { $a cmp $b }
        : sub { $data->{$a} <=> $data->{$b} };

    foreach my $item (sort $sort keys %{$data}) {
        my $size = $data->{$item} * 4;
        printf "%10s | %s\n", $item, '#' x $size;
    }

}

my $data = { apple => 3, cherry => 2, banana => 1, foo => 2.5, bar => 3.6 => baz => 0.4 };


say "Sort by value:";
generate_bar_graph($data);

say "\n";

say "Sort by label:";
generate_bar_graph($data, 1);

