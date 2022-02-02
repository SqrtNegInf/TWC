#!/usr/bin/env raku
use v6;

class FibonacciSumming { ... }

sub MAIN ($N = 20) {
   my $fs = FibonacciSumming.new;
   my $result ~= $fs.next ~ ' ' for ^$N;
   say $result;
   use Test;
   is $result, '0 1 2 3 5 8 10 11 12 14 17 20 21 23 26 30 32 35 41 44 ';
}

class FibonacciSumming {
   has %!fibo = 0 => 1;
   has $!f =  0;
   has $!s = -1;
   method next () {
      while True {
         ++$!s;
         my $sum = $!s.comb(/\d/).sum;
         ($!f, %!fibo{%!fibo{$!f}}) = %!fibo{$!f}, $!f + %!fibo{$!f}
            while $!f < $sum;
         return $!s if %!fibo{$sum}:exists;
      }
   }
}
