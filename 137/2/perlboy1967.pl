#!/usr/bin/env perl
use v5.36;

use constant MAX_ITER => 500;
use constant MAX_VALUE => 10_000_000;

use Test::More;

my $N = shift // 89;

isLychrelNumber($N,MAX_ITER,MAX_VALUE,1);

my %tests = qw(56 0 57 0 59 0 89 -1);
foreach my $n (keys %tests) {
  is(isLychrelNumber($n,MAX_ITER,MAX_VALUE),$tests{$n});
}
done_testing();


sub isLychrelNumber {
  my ($n, $maxIter, $maxVal, $print) = @_;
  $print //= 0;

  my $return = -1;

  while (1) {
    my $nRev = reverse $n;
    print "$n + $nRev = " if $print;
    $n += $nRev;
    print "$n\n" if $print;

    # Max value exceeded?
    last if ($n > $maxVal);

    # Palindrome (using a recursive regular expression)?
    if ($n =~ /^((.)(?1)\2|.?)$/) {
      $return = 0;
      last;
    }

    # Max iterations exceeded?
    $maxIter--;
    last if ($maxIter < 0);
  }

  printf "%d => %d\n", $n, $return if $print;

  $return;
}
