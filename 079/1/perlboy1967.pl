#!/usr/bin/env perl
use v5.36;

use constant SOME_VALUE => 1000000007;

my ($N) = 4;

die "N must be positive integer value"
  unless (defined $N and $N =~ m#^[1-9][0-9]*$#);

my $bits = countBits($N);

printf "Input: %d\n", $N;
printf "Output: %d %% %d = %d\n", 
       $bits, 
       SOME_VALUE(), 
       $bits % SOME_VALUE();

sub countBits {
  my ($n) = @_;

  my $b = 0;

  map {
    # Some 'unpack/pack' black magic
    $b += unpack('%32b*', pack('I', $_));
  } (1 .. $n);

  return $b;
}
