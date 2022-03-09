#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;

my $input = '34';
my @arrayA = split(//, $input);
my $suma = 0;


foreach(my $i = 0; $i < @arrayA; $i++) {
    $suma += $arrayA[$i]**2
}  

my $result = sqrt $suma;
if ($result =~ /^\d+$/) {
    print "Ouput: 1";
}
else {
    print "Ouput: 0";
}


    

