#!/usr/bin/env perl
use v5.36;

my $program = $ARGV[0] // 'Calc.pm';

open(SCRIPT, $program) or die "Fail to read $program\n";

while (my $line = <SCRIPT>) {
    while ( $line =~ /sub(\s+)(\&|\w)(\w*)/g ) {
        print $2.$3."\n";
    } 
}

#ref: https://stackoverflow.com/questions/9156149/perl-match-one-pattern-multiple-times-in-the-same-line-delimited-by-unknown-cha
