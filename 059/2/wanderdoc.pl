#!/usr/bin/env perl
use v5.36;

use List::Util qw(max);

sub pairwise_difbits
{
     my ($n1, $n2) = @_;
     my $max = max(map length(sprintf("%b", $_)), ($n1, $n2));
     ($n1, $n2) =  map sprintf("%0${max}b", $_) , ($n1, $n2);

     my $count = 0;
     for my $i ( 0 .. $max - 1 )
     {
          $count++ if substr($n1, $i, 1) != substr($n2, $i, 1);
     }
     return $count;  
}

sub sumdif
{
     my @numbers = @_;
     my $sum;


     for my $i ( 0 .. $#numbers - 1 )
     {
          for my $j ( $i .. $#numbers )
          {
               next if $i == $j;
               $sum += pairwise_difbits(@numbers[$i, $j]);
          }
     }

     return $sum;
}

print sumdif ( 1, 2, 3, 4, 5 ), $/;
