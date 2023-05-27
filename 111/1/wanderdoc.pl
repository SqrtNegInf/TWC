#!/usr/bin/env perl
use v5.36;

my @mtr = ([  1,  2,  3,  5,  7 ],
          [  9, 11, 15, 19, 20 ],
          [ 23, 24, 25, 29, 31 ],
          [ 32, 33, 39, 40, 42 ],
          [ 45, 47, 48, 49, 50 ]);

sub search
{
     my ($aoa, $num) = @_;


     my $row = 0; 
     my $col = 0;

     return 1 if $aoa->[$row][$col] == $num;
     return 0 if $aoa->[$row][$col] >  $num;

     while ($aoa->[$row][$col] < $num ) 
     {
          $row++; 
          $row-- and last if $row > $#$aoa;
          return 1 if $aoa->[$row][$col] == $num;
     }

     if ( $aoa->[$row][$col] > $num )
     {
          while ( $aoa->[$row-1][$col] < $num )
          {

               $col++; 
               return 0 if $col > $#{$aoa->[$row-1]};
          }
          return 1 if $aoa->[$row-1][$col] == $num;
     }

     else
     {

          while ( $aoa->[$row][$col] < $num )
          {
               $col++; 
               return 0 if $col > $#{$aoa->[$row-1]};
          }

          return 1 if $aoa->[$row][$col] == $num;
     }

     return 0;
}

for my $i ( 35, 39 ) 
{
     print join(" => ", $i, search([@mtr], $i)), $/; 
}
