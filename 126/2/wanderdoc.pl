#!/usr/bin/env perl
use v5.36;

my %ways =     ('n' => [-1, 0], 'ne' => [-1,  1], 'e' => [0,  1], 'se' =>  [1, 1],
                's' => [ 1, 0], 'sw' => [ 1, -1], 'w' => [0, -1], 'nw' => [-1, -1]);

sub count_mines
{
     my $aref = $_[0];
     my $output;
     for my $row ( 0 .. $#$aref )
     {


          for my $col ( 0 .. $#{$aref->[$row]} )
          {
               if ( $aref->[$row][$col] eq 'x' )
               {
                    $output->[$row][$col] = $aref->[$row][$col];
               }
               else
               {

                    my @coords = 
                         grep {$_->[0] >= 0 and $_->[1] >= 0 and
                              $_->[0] <= $#$aref and $_->[1] <= $#{$aref->[$row]}}
                         map  {[$ways{$_}[0] + $row, $ways{$_}[1] + $col]} keys %ways;
                    my $count = 0;
                    for my $pair ( @coords )
                    {
                         $count++ if ( $aref->[$pair->[0]][$pair->[1]] eq 'x' );

                    }
                    $output->[$row][$col] = $count;
               }
          }
     }

     return $output;
}


sub print_aref
{
     my $aref = $_[0];
     print join(" ", @{$aref->[$_]}), $/ for 0 .. $#$aref;
}



my $rectangle = [
     [qw (x * * * x * x x x x)],
     [qw (* * * * * * * * * x) ],
     [qw (* * * * x * x * x *) ],
     [qw (* * * x x * * * * *) ],
     [qw (x * * * x * * * * x) ] ];



print_aref($rectangle);
print $/;
print_aref(count_mines($rectangle));
