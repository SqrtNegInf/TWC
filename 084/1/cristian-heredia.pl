#!/usr/bin/env perl

use warnings;
use strict;
use Data::Dumper;

my $N =  '-1700';
my $number;
my @array;
my @result;
my $reverse = '';
my $flagNegative = 'N';

checkInteger($N);
reverseNumber();

sub checkInteger {
    
    $number = shift;
    if ($number <= -2147483648 or  $number >= 2147483647) {
        print "Output: 0\n";
        exit;
    }
    if ($reverse  ne '') {
            print"Output: $reverse\n";
    }
}

sub reverseNumber {
    
    @array = split //, $N;
    foreach (my $i =0; $i < @array; $i++) {
        if ($array[$i] eq '-') {
            $flagNegative = 'S';
        }
        else {
            unshift(@result, $array[$i]);
        }
    }
    if ($flagNegative eq 'S') {
        unshift(@result, '-'); 
    }
    $reverse = join( '', @result );
    checkInteger($reverse);
}

