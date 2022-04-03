#!/usr/bin/env perl
srand 1;;
use strict;
use warnings FATAL => qw(all);

use List::Util qw(shuffle);

my $N = shift || 20;
my @array = 1 .. 50;
my @selection = (shuffle @array)[0 .. $N - 1];
print join(" ", @selection), $/;
print join(" ", find_peaks(@selection)), $/;

sub find_peaks
{
     my @arr = @_;
     my $i = 0;
     my @peaks;

     while ( $i < scalar @arr )
     {
          push @peaks, $arr[$i] if ( 
               (0 == $i and $arr[$i] > $arr[$i+1]) or 
               ($#arr == $i and $arr[$i] > $arr[$i-1]) or 
               ( $i > 0 and $i < $#arr and $arr[$i] > $arr[$i+1] and $arr[$i] > $arr[$i-1]) );


          $i++; 
     }
     return @peaks;

}
