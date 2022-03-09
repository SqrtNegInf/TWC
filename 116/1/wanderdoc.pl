#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

sub find_sequence
{
     my $int = $_[0];
     my $length = length($int);
     for my $i ( 1 .. $length / 2 )
     {
          my $copy = $int;

          my @numbers;
          $numbers[0] = substr($copy, 0, $i);
          $copy = substr($copy, $i);
          for my $j ( $i .. $i + 1 )
          {
               while ( substr($copy, 0, $j) - 1 == $numbers[-1] and substr($copy, 0, 1) != 0 )
               {
                    push @numbers, substr($copy, 0, $j);
                    $copy = substr($copy, $j);
                    return join(",",@numbers) unless length($copy);
               }
          }


     }
     return $int;
}


print find_sequence($_), $/ for (12345, 91011, 10203, 100101102, 9899100102);
