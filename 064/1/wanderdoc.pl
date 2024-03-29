#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);

my $matrix = [ [ 1, 2, 3 ], [ 4, 5, 6 ], [ 7, 8, 9 ] ];
my $M = $#$matrix;
my $N = $#{$matrix->[0]};

my %PATHS;
my $path;
my $MIN = 1e9;

traverse($matrix, $path, 0, 0);

my @candidates = sort { $PATHS{$a} <=> $PATHS{$b}} keys %PATHS;
print "The path with minimal sum of $PATHS{$candidates[0]} is $candidates[0].$/";


sub traverse
{
     my ($matrix, $path, $row, $col) = @_; 

     my $end = $matrix->[$M][$N];
     
     return if ( sum(@$path, $end) > $MIN );


     if ( $row == $M and $col == $N )
     {
          $MIN = sum(@$path, $end);
          $PATHS{ join('->', @$path, $end) } = $MIN; 
          return;
     }

     push @$path, $matrix->[$row][$col];

     if ( is_possible($row, $col + 1) )
     {
          traverse($matrix, $path, $row, $col + 1);
     }
     if ( is_possible($row + 1, $col))
     {
          traverse($matrix, $path, $row + 1, $col);
     }

     pop @$path;
}

sub is_possible
{
     my ($row, $col) = @_;
     return ( $row >= 0 and $col >= 0 and $row <= $M and $col <= $N );
}
