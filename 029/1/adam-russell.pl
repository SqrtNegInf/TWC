#!/usr/bin/env perl
use strict;
use warnings;
##
# Write a script to demonstrate brace expansion.
##
my $statement = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';
$statement =~ m/(.*)\{(.*)\}(.*)/;
for my $brace (split(/,/, $2)){
    print "$1$brace$3\n";
}
