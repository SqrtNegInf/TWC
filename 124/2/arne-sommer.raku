#!/usr/bin/env raku

my @n = 10, -15, 20, 30, -25, 0, 5, 40, -5;
my $half-sum = @n.sum / 2;
(say "0"; exit ) unless $half-sum == $half-sum.Int;
say + so @n.combinations(@n.elems / 2).map({ @$_.sum}).any == $half-sum;


   @n = 10, 20, 30, 40, 50, 60, 70, 80, 90, 100;
   $half-sum = @n.sum / 2;
(say "0"; exit ) unless $half-sum == $half-sum.Int;
say + so @n.combinations(@n.elems / 2).map({ @$_.sum}).any == $half-sum;

