#!/usr/bin/env perl
use v5.36;

my @eqpoints  = ([32, 0], [212, 100]);
my $intersect = get_intersect (@eqpoints);
print "Intersection at $intersect\n";

sub get_intersect {
    my ($p1, $p2) = @_;
    my $dx  = $p2->[0] - $p1->[0];
    my $dy  = $p2->[1] - $p1->[1];
    my $grad = $dy / $dx;
    my $off  = $p2->[1] - $grad * $p2->[0];

    # Solve against y = x
    die "No solution\n" if $grad == 1;
    my $x = $off / (1 - $grad);
    return $x;
}
