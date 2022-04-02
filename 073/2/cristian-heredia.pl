#!/usr/bin/env perl


use strict;
use warnings;
#use Data::Dumper;
use List::Util qw(min);

#Input
my @A = (7, 8, 3, 12, 10);

#variables
my $lenght = @A;
my @result;
my @checkMin;
my $minNumber;


checkArray();

sub checkArray {
   
    foreach (my $i=0; $i<$lenght;$i++) {
       
        if ($i == 0) {

            push @result, 0;
        }
        else {
            @checkMin = ();

            foreach (my $j=0;$j<$i;$j++){
                push @checkMin, $A[$j];
            }
            $minNumber = min(@checkMin);
            if ($minNumber < $A[$i]) {
                push @result, $minNumber;
            }
            else {
                push @result, 0;
            }
        }
       
    }
    #print Dumper \@result;
    print "@result\n"; }
