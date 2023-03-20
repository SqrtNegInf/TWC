#!/usr/bin/env perl

use v5.16;

use common::sense;

use List::MoreUtils qw(slide);

use Test::More;
use Test::Deep qw(cmp_deeply);

sub duplicateAndMissing(@) {
  @_ = sort { $a <=> $b } @_;

  my (@duplicate,@missing);
  slide { 
    if ($a == $b) { push(@duplicate,$a) if ($duplicate[-1] != $b) } 
    elsif ($b - $a > 1) { push(@missing,$a + 1 .. $b - 1) }
  } @_;

  # 'Special' rule to comply to the task:
  push(@missing,$_[-1] + 1) 
    if (scalar(@missing) == 0 && scalar(@duplicate) > 0);

  return [[@duplicate],[@missing]];
}

cmp_deeply(duplicateAndMissing(1,2,2,4),[[2],[3]]);
cmp_deeply(duplicateAndMissing(1,2,3,4),[[],[]]);
cmp_deeply(duplicateAndMissing(1,2,3,3),[[3],[4]]);
cmp_deeply(duplicateAndMissing(1,1,1,3,3,5,6,8,8,9),[[1,3,8],[2,4,7]]);

done_testing;
