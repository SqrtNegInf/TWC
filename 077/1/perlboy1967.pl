#!/usr/bin/env perl
use v5.36;

# Unbuffered STDOUT
$|++;

use Algorithm::Combinatorics qw(combinations);
use List::Util qw(sum);
use Memoize;

# Prototypes
sub fibonacci :prototype($);
sub getFibonacciNumbersSmallerN :prototype($);
sub findFibonacciSumSolutions :prototype($\@\@);

memoize('fibonacci');

my ($N) = 377;

die "Input must be integer value and >= 2"
  unless (defined $N and $N =~ m#^[1-9][0-9]*$# and $N >= 2);

my @solutions;

my @fib = getFibonacciNumbersSmallerN($N);
findFibonacciSumSolutions($N, @solutions, @fib);

print "Input:\n";
printf "\t%s = %d\n\n", '$N', $N;

print "Output:\n";
if (scalar @solutions) {
  printf "\t%d as the sum of Fibonacci numbers (%s) is same as input number.\n",
          scalar(@solutions), 
          join(', ', map { '['.join(',',@$_).']' } @solutions);
} else {
  print "\tNo solution can be found.\n";
}


sub fibonacci :prototype($) {
  my ($n) = @_;

  return 1 if ($n == 1 or $n == 2);

  return fibonacci($n - 1) + fibonacci($n - 2);
}


sub getFibonacciNumbersSmallerN :prototype($) {
  my ($n) = @_;

  my @fib;

  my $i = 2;
  my $f;

  while ($f = fibonacci($i++) and $f < $n) {
    push(@fib, $f);
  }

  return @fib;
}


sub findFibonacciSumSolutions :prototype($\@\@) {
   my ($n, $arSol, $arFib) = @_;

   foreach my $level (1 .. scalar @$arFib) {
     my $iter = combinations($arFib, $level);
     while (my $arCombi = $iter->next) {
       push(@$arSol, $arCombi) 
        if (sum(@$arCombi) == $n);
     }
  }
}
