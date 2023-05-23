#!/usr/bin/env perl
use v5.36;

use Test::More;

my @TESTS = (
  [ 15, 8 ],
  [ 25, 13 ],
  [ 100, 80 ],
  [ 1000, 728 ],
  [ 1100, 728 ],
  [ 1200, 728 ],
  [ 1300, 728 ],
  [ 2000, 729 ],
  [ 2100, 809 ],
  [ 2200, 810 ],
  [ 3000, 1458 ],
  [ 4000, 2187 ],
  [ 5000, 2916 ],
  [ 10000, 6560 ],
  [ 20000, 6561 ],
  [ 25000, 6561+2916 ],
  [ 100000, 59048 ],
);

# warn "@{$_} -> ", get_no_one_count_9($_->[0]), "\n" foreach @TESTS;

is( get_no_one_count_9($_->[0]), $_->[1] ) foreach @TESTS;
is( get_no_one_count($_->[0]), $_->[1] ) foreach @TESTS;
done_testing();

sub get_no_one_count {
  my $n = shift;
  return scalar grep { ! m{1} } 2..$n;
}

## Optimized version.... seems to work ... and far better than scan...
sub get_no_one_count_9 {
  my ( $n, $count, $pow_9 ) = ( shift, 0, 1 );
  while($n) {
    my $t   = $n % 10; ## get last digit
    $count  = 0 if $t==1; ## Throw everything away we've found a 1
    $count += !$t ? 0 : $t == 1 ? ($pow_9-1) : ($t-1)*$pow_9;
                          ## 0 it contributes nothing
                          ## 1 contributes 9^X-1
                          ## 2-9 contributes (n-1)9^X
    $pow_9 *= 9;  ## update power of nine
    $n      = ( $n - $t )/10; ## drop last digit
  }
  return $count;
}
