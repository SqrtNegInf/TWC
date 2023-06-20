#!/usr/bin/env perl
use v5.36;

my $string = 'bookkeeper';
my @letters = split(//, $string);
my $letter;
my $letter_previous = shift @letters;
do{ 
    $letter = shift @letters;
    print $letter_previous if($letter eq $letter_previous); 
    print "$letter_previous\n" if($letter ne $letter_previous); 
    $letter_previous = $letter; 
}while(@letters);
print $letter_previous if($letter eq $letter_previous); 
print "$letter_previous\n" if($letter ne $letter_previous);
print "\n";  
