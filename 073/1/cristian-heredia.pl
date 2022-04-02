#!/usr/bin/env perl

use strict;
use warnings;
#use Data::Dumper;
use List::Util qw(min);

#Input
my @A = (1, 5, 0, 2, 9, 3, 7, 6, 4, 8);
my $S = 3; #SlidingWindow

#variables
my @window;
my @outout;
my $counter = 0;
my $next = 0;
my $lenght = @A;
my $max = $lenght - $S + 1;

slidingWindow();

sub slidingWindow {
   
    if ($next != $max) {
       
        if ($counter == $S ) {
            $counter = 0;
            $next++;
            $S++;
            @window = ();
            slidingWindow();
        }
        else {
            foreach (my $i = $next; $i<$S; $i++) {
                push @window, $A[$i];
            }
            $counter = $S;
            push @outout, min(@window);
            slidingWindow();
        }
    }
    else {
        print "@outout\n";
    }
}
