#!/usr/bin/env perl

use strict;
use warnings;

#use Data::Dumper;

use feature 'say';

my $string = 'Markmið lífs okkar er að vera hamingjusöm';

die "Please enter a string with alteast three words.\n" unless $string;

my @whole_string = split ' ', $string;

die "String should have atleast three words.\n" unless (scalar @whole_string >= 3);

##Remove first and last words from string with space
$string =~ s/^\S+\s*//;
$string =~ s/\s*\S+$//;

my @taken = split ' ', $string;

say "Taken words:\n@taken\n";

my $count = 0;

foreach my $w ( @taken ) {
    my @n = split //, $w;
    $count += @n; 
}

say "Count : $count";
