#!/usr/bin/env perl
use v5.36;

use Graph::Directed;
use List::Util qw/sum/;

my $g = Graph::Directed->new;

$g->add_edge(5,4);
$g->add_edge(4,11);
$g->add_edge(11,7);
$g->add_edge(11,2);
$g->add_edge(5,8);
$g->add_edge(8,13);
$g->add_edge(8,9);
$g->add_edge(9,1);

my $start = 5;
my $sum = 22;

for ($g->exterior_vertices) {
    my @path = $g->SP_Dijkstra($start, $_);

    say join '->', @path if sum(@path) == $sum;
}
