#!/usr/bin/env perl
use v5.36;

sub find_conflicts
{
     my $aref = $_[0];
     my %output;


     for my $idx_1 ( 1 .. $#$aref ) # no conflict at position 0.
     {
          for my $idx_2 ( 0 .. $idx_1 - 1 )
          {

               if ( ($aref->[$idx_1][0] < $aref->[$idx_2][0] and 
                     $aref->[$idx_1][1] < $aref->[$idx_2][1] and 
                     $aref->[$idx_1][1] < $aref->[$idx_2][0]) 

                         or

                    ($aref->[$idx_1][0] > $aref->[$idx_2][0] and 
                     $aref->[$idx_1][1] > $aref->[$idx_2][1] and 
                     $aref->[$idx_1][0] > $aref->[$idx_2][1])
                    )
               {
                    next;

               }
               else
               {
                    $output{join(", ",@{$aref->[$idx_1]})} = undef;
               }
          }
     }


     return [ sort { (split(/, /, $a))[0] <=> (split(/, /, $b))[0] or
                     (split(/, /, $a))[1] <=> (split(/, /, $b))[1] } keys %output];

}

my $result = find_conflicts([ [1,4], [3,5], [6,8], [12, 13], [3,20] ]);
print join("", "(",join("), (", @$result), ")"), $/;
$result = find_conflicts([ [3,4], [5,7], [6,9], [10, 12], [13,15] ]);
print join("", "(",join("), (", @$result), ")"), $/;

