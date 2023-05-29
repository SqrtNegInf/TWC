#!/usr/bin/env perl
use v5.36;


sub generate_fusc
{
     my $max = $_[0];
     my @arr;
     my $i = - 1; 

     return sub
     {
          $i++; 

          if     ( $i < 2 ) { $arr[$i] = $i; }
          elsif  ( $i % 2 ) { $arr[$i] = $arr[($i-1)/2] + $arr[($i+1)/2]; }
          else              { $arr[$i] = $arr[$i / 2]; }
          return undef if $i > $max;
          return [$i, $arr[$i]];
     }
}

my $next = generate_fusc(50);
while ( my $item = $next->() ) { print join(": ", @$item), $/; }
