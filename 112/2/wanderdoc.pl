#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use List::Util qw(sum);
my $n = shift // 5;
my $opt = 1;
for my $m ( $n/2 .. $n )
{
     my @steps = 
          grep { sum(@$_) == $n }
          map { [split(//,$_)] }
          glob q[{1,2}] x $m;


     for my $step ( @steps )
     {
          @$step = map {$_ == 1 ? $_ . ' step' : $_ . ' steps'} @$step;

          print "Option ${opt}: ", join(' + ', @$step), $/;
          $opt++;
     }
}
