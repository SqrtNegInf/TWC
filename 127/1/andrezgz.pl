#!/usr/bin/env perl
use v5.36;

my @S1 = split /,/, '1,2,3,4';
my @S2 = split /,/, '4, 6,7,8,9';

my (%union,%inter);
for (@S1,@S2) {
    $union{$_}++ && $inter{$_}++
}

say keys %inter ? 0 : 1;
