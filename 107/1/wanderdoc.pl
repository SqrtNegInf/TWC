#!/usr/bin/env perl
use v5.36;

use List::Util qw(first sum reduce);

my $i = 1000;
NUM: while ($i < 1e9)
{

     if ( $i % 10 ) 
     { 
          $i = (1 + int($i/10)) * 10; 
     }
     my $length = length($i);
     $length == 6 and $i = 1_000_000 and next NUM;
     if ( $length > 5 and $i % 1000 ) 
     { 
          $i = (1 + int($i/1000)) * 1000; 
     }
     my @num_arr = split(//, $i);


     while ( defined first { $_ >= $length  } @num_arr )
     {
          for my $idx ( reverse 1 .. $#num_arr )
          {
               if ( $num_arr[$idx] >= $length )
               {
                    $num_arr[$idx] = 0;
                    $num_arr[$idx-1]++;

               }
          }

          if ( $num_arr[0] >= $length )
          {
               $_ = 0 for @num_arr;
               unshift @num_arr, 1;
          }

          $i = join('', @num_arr);
     }

     if (sum(@num_arr) > $length)
     {
          $i++;
          next NUM;
     }

     my $descr = description(@num_arr);
     print $descr, $/ if $descr == $i;
     $i++;
}

sub description
{
     my @num_arr = @_;

     my %freq;
     $freq{$_}++ for @num_arr;
     for my $i ( 0 .. $#num_arr )
     {
          if ( not exists $freq{$i} )
          {
               $freq{$i} = 0;
          }

     }
     my $description = reduce { $a . $b } 
          map { $freq{$_} }
          sort {$a <=> $b} keys %freq;

     return $description;
}
