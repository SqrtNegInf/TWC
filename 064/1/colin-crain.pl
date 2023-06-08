#!/usr/bin/env perl
use v5.36;

my $graph = [   [  1,  16,  12,  43,  48,  19 ],
                [ 13,   7,   9,  16,  26,  8  ],
                [ 23,  18,   6,  11,  15,  17 ],
                [ 22,  33,  28,   5,  36,  32 ],
                [ 38,  43,   9,  46,   3,  42 ],
                [ 56,   4,  66,  76,  25,   2 ],
                [ 27,  10,  58,  14,  68,  52 ]   ];

my $endpoint = [$graph->@* - 1, $graph->[0]->@* - 1];

## determine the paths through the grid
my @paths;
my $startpoint = [0,0];
my $path = [$startpoint];
find_nodes( $path, $startpoint );

## sum totals to find the smallest
my $minsum = "+Inf";
my $minpath;
for $path (@paths) {
    my $sum = 0;
    $sum += $graph->[@$_[0]][@$_[1]] for @$path;
    if ($sum < $minsum) {
        $minsum  = $sum;
        $minpath = $path;
    }
}

## output
say "minimum sum path:";
print join ' -> ', map { $graph->[@$_[0]][@$_[1]] } @$minpath;
say "\nsum is $minsum";

## ## ## ## ## SUBS:

sub find_nodes {
    my ( $path, $point ) = @_;
    if ( $point->[0] == $endpoint->[0] &&
         $point->[1] == $endpoint->[1]    ) {
        push @paths, $path;
        return;
    }
    unless ($point->[0] + 1 > $endpoint->[0]) {
        my $next_point = [$point->[0] + 1, $point->[1]];
        my $new_path = [$path->@*, $next_point];
        find_nodes( $new_path, $next_point)
    }
    unless ($point->[1] + 1 > $endpoint->[1]) {
        my $next_point = [$point->[0], $point->[1] + 1];
        my $new_path = [$path->@*, $next_point];
        find_nodes( $new_path, $next_point)
    }
}
## refactoring rejected for clarity: (works fine, though)
#
# sub find_nodes {
#     my ( $path, $point ) = @_;
#     if ( $point->[0] == $endpoint->[0] &&
#          $point->[1] == $endpoint->[1]    ) {
#         push @paths, $path;
#         return;
#     }
#     for ([$point->[0] + 1, $point->[1]], [$point->[0], $point->[1] + 1]) {
#         next if ($_->[0] > $endpoint->[0] || $_->[1] > $endpoint->[1]);
#         my $new_path = [$path->@*, $_];
#         find_nodes( $new_path, $_)
#     }
# }
