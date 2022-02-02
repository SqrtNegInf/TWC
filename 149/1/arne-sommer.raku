#!/usr/bin/env raku


subset PositiveInt of Int where * >= 1;

unit sub MAIN (PositiveInt $N = 20, :v(:$verbose));

my $fibonacci := (0, 1, * + * ... *);

my $fds := (0 .. Inf).grep( *.&is-fibonacci-sum );

say my $result = "f($N)=["~ $fds[^$N].join(", ")~ "]";

sub is-fibonacci-sum (Int $number)
{
  state %is-fibonacci;
  state $limit = 0;
  state $index = 0;

  my $sum = $number.comb.sum;

  say ": Considering number $number with sum $sum" if $verbose;

  return True if %is-fibonacci{$sum};
  
  while $sum >= $limit
  {
    $limit = $fibonacci[$index++];
    say ": Caching Fibonacci number $limit" if $verbose;
    %is-fibonacci{$limit} = True;
  }

  return %is-fibonacci{$sum};
}

use Test;
is $result, 'f(20)=[0, 1, 2, 3, 5, 8, 10, 11, 12, 14, 17, 20, 21, 23, 26, 30, 32, 35, 41, 44]';
