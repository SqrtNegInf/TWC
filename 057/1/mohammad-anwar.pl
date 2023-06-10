#!/usr/bin/env perl
use v5.36;
use Data::Dump qw(dump);

my $tree = {
     1 => [ [ 2, [ [ 4 ],
                   [ 5 ],
                 ],
            ],
            [ 3, [ [ 6 ],
                   [ 7 ],
                 ],
            ],
          ],
};

print sprintf("Before: %s\n", dump($tree));
mirror($tree->{1});
print sprintf("After : %s\n", dump($tree));

sub mirror {
    my ($branch) = @_;

    ($branch->[0], $branch->[1]) = ($branch->[1], $branch->[0]);
    mirror($branch->[0][1]) if defined $branch->[0][1];
    mirror($branch->[1][1]) if defined $branch->[1][1];

    return $branch;
}
