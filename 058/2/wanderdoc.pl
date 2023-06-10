#!/usr/bin/env perl
use v5.36;


use Struct::Dumb qw(readonly_struct);
use Test::More;

readonly_struct Person => [qw(h t)], named_constructor => 1;

my %DATA =
(
     1 => [
               [2, 6, 4, 5, 1, 3], [1, 0, 2, 0, 1, 2], [5, 1, 2, 6, 3, 4]
          ],


     2 => [
               [27, 21, 37,  4, 19, 52, 23, 64,  1,  7, 51, 17, 24, 50,  3,  2, 34, 40, 47, 20,  8, 56, 14, 16, 42, 38, 62, 53, 31, 41, 55, 59, 48, 12, 32, 61,  9, 60, 46, 26, 58, 25, 15, 36, 11, 44, 63, 28, 5, 54, 10, 49, 57, 30, 29, 22, 35, 39, 45, 43, 18,  6, 13, 33], 
               [6, 41,  1, 49, 38, 12,  1,  0, 58, 47,  4, 17, 26,  1, 61, 12, 29,  3,  4, 11, 45,  1, 32,  5,  9, 19,  1,  4, 28, 12,  2,  2, 13, 18, 19,  3,  4,  1, 10, 16,  4,  3, 29,  5, 49,  1,  1, 24, 2,  1, 38,  7,  7, 14, 35, 25,  0,  5,  4, 19, 10, 13,  4, 12], 
               [35, 23,  5, 64, 37,  9, 13, 25, 16, 44, 50, 40,  2, 27, 36,  6, 18, 54, 20, 39, 56, 45, 12, 47, 17, 33, 55, 30, 26, 51, 42, 53, 49, 41, 32, 15, 22, 60, 14, 46, 24, 59, 10, 28, 62, 38, 58, 63, 8, 48,  4,  7, 31, 19, 61, 43, 57, 11,  1, 34, 21, 52, 29,  3]
          ]
);

for my $set ( sort keys %DATA )
{
     my @H = @{$DATA{$set}[0]};

     my @T = @{$DATA{$set}[1]};
     my @A = @{$DATA{$set}[2]};
     
     my @PEOPLE;

     for my $idx ( 0 .. $#H )
     {
          my $person = Person(h => $H[$idx], t => $T[$idx]);
          $PEOPLE[$idx] = $person;
     }
     # Pre-sorting.
     @PEOPLE = sort { $a->t <=> $b->t or $a->h <=> $b->h } @PEOPLE;


     # Now bubble sort.
     my $not_sorted = 1;
     while ( $not_sorted )
     {
          $not_sorted = 0;
          for my $i ( 1 .. $#PEOPLE )
          {
               my $per_b = $PEOPLE[$i];

               my $per_a = $PEOPLE[$i - 1];
               my $heights_ahead = grep $_->h > $per_b->h, @PEOPLE[0 .. $i - 1];
               if ( $heights_ahead > $per_b->t )
               {
                    ( $PEOPLE[$i], $PEOPLE[$i-1] ) = ( $PEOPLE[$i-1], $PEOPLE[$i] );
                    $not_sorted = 1;
               }
          }

     }
     my @MY_A = map $_->h, @PEOPLE; # print "@MY_A$/";
     is_deeply (\@MY_A, \@A, "Set ${set} ordered correctly.");
}
done_testing( scalar keys %DATA );
