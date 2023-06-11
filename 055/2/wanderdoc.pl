#!/usr/bin/env perl
use v5.36;

my $counter = 1;

sub find_waved # Permutation code: BrowserUk.
{
     my ($aref, $result) = ( @_, [] );
     return unless is_waved($result);
     print $counter++, ': ', join (" ", @$result), $/ unless @$aref;
     for my $i (0 .. $#$aref)
     {
          find_waved( [ @{ $aref }[ 0 .. $i - 1, $i + 1 .. $#$aref ] ],
                   [ @$result, $aref->[ $i ] ]); 

     }
}

find_waved( [1..4] );

sub is_waved
{
     my $aref = $_[0];
     my $max_idx = $#$aref;

     for (my $i= 0; $i <= ($max_idx - 1); $i++ )
     {


          if ( 0 == $i % 2 and $aref->[$i] < $aref->[$i+1] )
          {
               return 0;
          }
          elsif ( 1 == $i % 2 and $aref->[$i] > $aref->[$i+1])
          {
               return 0;
          }

     }
     return 1;
}
