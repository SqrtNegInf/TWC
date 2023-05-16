#!/usr/bin/env perl
use v5.36;

# Eban is just a funny 20 base number system with 
# some odd encoding of each 20 numbers :-)

my @e = (0,2,4,6,30,32,34,36,40,42,44,46,50,52,54,56,60,62,64,66);

my %en = map { (substr('00'.$e[$_],-3,3), $_) } (0 .. scalar(@e)-1);
 
my @eban = @e[1..scalar(@e)-1];

my $len = 19;

while (scalar(@eban) < $len) {
  my @f = map {$en{$_}} reverse unpack('(A3)*','0'x(3-length($eban[-1])%3).$eban[-1]);

  $f[0]++;
  $f[0] %= scalar(@e);
  my  $carry = ($f[0] == 0 ? 1 : 0);
  foreach my $i (1 .. scalar(@f)-1) {
    $f[$i] += $carry;
    $f[$i] %= scalar(@e);
    $carry = ($f[$i] == 0 ? 1 : 0);
  }
  push(@f,1) if ($carry);

  push(@eban,0+join('',reverse map{substr('00'.$e[$_],-3,3)} @f));
}

say join',',@eban[0..$len-1];

