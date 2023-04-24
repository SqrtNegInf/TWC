#!/usr/bin/env perl

use v5.36;

use common::sense;

use Paths::Graph;
use List::MoreUtils qw(slide);

use Test::More;
use Test::Deep qw(cmp_deeply);

sub shortestRoute ($$\@) {
  my ($o,$d,$ar) = @_;
  my %g;

  for (@$ar) {
    slide { 
      ($g{$a}{$b},$g{$b}{$a}) = (1,1);
    } @$_;
  }

  my @p = Paths::Graph->new(-origin => $o, -destiny => $d, -graph => \%g)->shortest_path;

  return (scalar @p == 1 and defined $p[0][1] ? $p[0] : undef);
}

cmp_deeply(shortestRoute(1,7,@{[[1,2,6],[5,6,7]]}),
           [1,2,6,7]);
cmp_deeply(shortestRoute(2,5,@{[[1,2,3],[4,5,6]]}),
           undef);
cmp_deeply(shortestRoute(1,7,@{[[1,2,3],[4,5,6],[3,8,9],[7,8]]}),
           [1,2,3,8,7]);

done_testing;
