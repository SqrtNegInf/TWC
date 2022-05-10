#!/usr/bin/env perl
use strict;
use warnings; 

my $challenge_string="Perl Weekly Challenge";
my $number=do{
    $challenge_string=~tr/e/E/
};
print "$number $challenge_string\n"; 
