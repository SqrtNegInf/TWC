#!/usr/bin/env perl

use v5.36;

use List::Util qw(max min);
use List::MoreUtils qw(frequency firstidx);

use Test::More;
use Test::Deep qw(cmp_deeply);

sub arrayDegree {

  # Find maximum frequency
  my %freq = frequency @_;
  my $medianFreq = max(values %freq);

  # Get median(s)
  my @medians = sort { $a <=> $b } grep { $freq{$_} == $medianFreq } keys %freq;

  my $candidates;

  # get candidates
  for my $median (@medians) {

    my $minIdx = firstidx { $_ == $median} @_;
    my $maxIdx = @_ - (firstidx { $_ == $median } reverse @_) - 1;

    push(@$candidates,[@_[$minIdx .. $maxIdx]]);

  }

  # Find mimimum length of candidates which may qualify
  my $minLength = min(map scalar @{$_}, @$candidates);

  # Select and sort sub lists
  @$candidates = sort {$a->[0] <=> $b->[0]} grep { scalar @$_ == $minLength } @$candidates;

  return $candidates;
}

cmp_deeply(arrayDegree(1,3,3,2),[[3,3]], 'Example 1');
cmp_deeply(arrayDegree(1,2,1,3),[[1,2,1]], 'Example 2');
cmp_deeply(arrayDegree(1,3,2,1,2),[[2,1,2]], 'Example 3');
cmp_deeply(arrayDegree(1,1,2,3,2),[[1,1]], 'Example 4');
cmp_deeply(arrayDegree(2,1,2,1,1),[[1,2,1,1]], 'Example 5');

cmp_deeply(arrayDegree(2,2,1,3,2,1,1,3,3),[[1,3,2,1,1],[2,2,1,3,2]], 'Example 6');

done_testing;
