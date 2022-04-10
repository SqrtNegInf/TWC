#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(max min);
use Time::HiRes qw(time);

my %collatz_mem;

%collatz_mem = ( 4 => 2, 2 => 1); # ( 5 => 16, 16 => 8, 8 => 4, 4 => 2, 2 => 1, );



sub collatz
{
     my $n = $_[0];
     my @seq;
     while ( $n != 1 )
     {
          if ( exists $collatz_mem{$n})
          {
               my $key = $n;
               while ( $key > 1)
               {
                    push @seq, $key;


                    $key = $collatz_mem{$key};
               }
               push @seq, 1;

               return @seq;
          }
          else
          {

               my $old_n = $n;
               push @seq, $n;
               
               if ( 0 == $n % 2 )
               {
                    $n = $n / 2;
               }
               else

               {
                    $n = 3 * $n + 1;
               }
               $collatz_mem{$old_n} = $n;
          }
     }
}



my $EDGE = 5;
my %longest;
my $PRINT_SEQUENCE = 0;

for my $N ( 1 .. 10_000)
{
     my @sequence = collatz($N);

     my $length = scalar @sequence;

     my $max = max keys %longest || 1;

     if ( $length > $max )
     {
          $longest{$length} = [@sequence];
     }

     my $how_many = scalar keys %longest;

     if ( $how_many > $EDGE )
     {
          my $min = min keys %longest;
          delete $longest{ $min };
     }
}



for my $n ( sort {$b <=> $a} keys %longest )
{
     print ${$longest{$n}}[0], ': ', scalar @{$longest{$n}}, $/;
     print join(' -> ', @{$longest{$n}}), $/ if 1 == $PRINT_SEQUENCE;
}

