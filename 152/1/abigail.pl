#!/usr/bin/env perl
use v5.36;

# We expect the entire triangle to be given as whitespace separated
# numbers, all on one line. Give it's a triangle, we don't need to
# know where the next row starts.
# Each new line is considered a different triangle.
#

#
# At first, I thought "path" was used in the traditional sense:
# we were to view the triangle as a graph, each node having two
# edges downwards to the nearest nodes on the next row.
# But it looks like we can just take any node on each row, and 
# they will all connect. Which makes the exercise trivial: we
# just sum the minimum value from each row.
#

use List::Util qw [min];

while (<DATA>) {
    my ($n, $min_sum, @numbers) = (1, 0, split);
    $min_sum += min splice @numbers, 0, $n ++ while @numbers;
    say $min_sum;
}
__END__
1 5 3 2 3 4 7 1 0 2 6 4 5 2 8
5 2 3 4 1 5 0 1 2 3 7 2 4 1 9
