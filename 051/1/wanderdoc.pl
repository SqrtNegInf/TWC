#!/usr/bin/env perl
use v5.36;

my @L = (-25, -10, -7, -3, 2, 4, 8, 10);
my $target = 0;

my @triplets = find_triplets(\@L, $target);
print_result(@triplets);


sub find_triplets
{
     my @arr = sort { $a <=> $b } @{$_[0]};
     my $t = $_[1];
     my @result;

     for my $pt1 ( 0 .. $#arr )
     {
          next if $pt1 > 0 and $arr[$pt1] == $arr[$pt1 - 1];
          my $pt2 = $pt1 + 1;
          my $pt3 = $#arr;
          while ( $pt2 < $pt3 )
          {
               if ( $arr[$pt1] + $arr[$pt2] + $arr[$pt3] == $t )
               {
                    push @result, [$arr[$pt1], $arr[$pt2], $arr[$pt3]];
                    $pt2++; 
               }


               elsif ( $arr[$pt1] + $arr[$pt2] + $arr[$pt3] < $t )
               {
                    $pt2++;
               }
               else
               {
                    $pt3--;
               }

          }
     }
     return @result;
}

sub print_result
{
     my @arr = @_;

     if ( 0 == @arr )
     {
          print "No elements!\n";
     }

     else
     {
          print join(" ", @$_), $/ for @arr;

     }
}
