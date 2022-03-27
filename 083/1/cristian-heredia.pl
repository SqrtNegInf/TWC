#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

#Variables
my $S = "Markmið lífs okkar er að vera hamingjusöm";
my $count = 0;
my @array;

convert2Array();

sub convert2Array {
    @array = split / /, $S;
    removeFirstLast();
}

sub  removeFirstLast {
    
    shift @array;
    pop @array;
    lengthString();
}

sub lengthString {
        
        foreach (my $i=0; $i<@array; $i++) {
            $count = $count + length $array[$i];
        }
        print "Outout: $count \n";
    
}

