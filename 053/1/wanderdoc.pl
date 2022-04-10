#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

sub rotate
{
     my ($aref, $angle) = @_;
     my $rotated;
     for my $row_idx ( 0 .. $#$aref )
     {

          for my $col_idx ( 0 .. $#{$aref->[$row_idx]} )
          {
               if ( 90 == $angle )
               {
                    $rotated->[$col_idx][$#$aref - $row_idx] = 
                         $aref->[$row_idx][$col_idx];
               }
               elsif ( 180 == $angle )
               {
                    $rotated->[$#$aref - $row_idx][$#{$aref->[$row_idx]} - $col_idx] = 
                         $aref->[$row_idx][$col_idx];
               }


               elsif ( 270 == $angle )
               {
                    $rotated->[$#{$aref->[$row_idx]} - $col_idx][$row_idx] = $aref->[$row_idx][$col_idx];
               }
               else
               {
                    die "Can only rotate a matrix by 90/180/270 degrees clockwise!$/";
               }

          }
     }
     return $rotated;
}

sub print_matrix
{
     my $aref = $_[0];

     for my $row ( @$aref )
     {
          print '[ ', join(', ', @$row), ' ]', $/;
     }
     print $/;
}




my @matrix = ([ 1, 2, 3 ],
              [ 4, 5, 6 ],
              [ 7, 8, 9 ]);

my @rotated = map { rotate(\@matrix, $_) } (90, 180, 270);



print_matrix(\@matrix);
print_matrix($_) for @rotated;
