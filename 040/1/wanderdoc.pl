#!/usr/bin/env perl
use v5.36;

my @arr_1 = qw(I L O V E Y O U);
my @arr_2 = qw(2 4 0 3 2 0 1 9);
my @arr_3 = qw(! ? £ $ % ^ & *);


print "@$_$/" for my_zip6(\@arr_1, \@arr_2, \@arr_3);


print "Now cheating with module: $/";


use List::MoreUtils qw(zip6);
print "@$_$/" for zip6 @arr_1, @arr_2, @arr_3;


sub my_zip6
{
     my @arefs = @_;

     my @result;
     my $imax = $#{$arefs[0]};

     for my $i ( 0 .. $imax )
     {
          my @row;
          for my $ar ( @arefs )
          {
               push @row, $ar->[$i];

          }
          push @result, [@row];

     }
     return @result;
}
