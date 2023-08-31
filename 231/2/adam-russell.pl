#!/usr/bin/env perl
use v5.36;

sub count_senior_citizens{
    my $count = 0;
    do{
        my @a = unpack q/A10A1A2A2/, $_; 
        $count++ if $a[2] >= 60;
    } for @_;
    return $count;
}

MAIN:{
    say count_senior_citizens qw/7868190130M7522 5303914400F9211 9273338290F4010/;
    say count_senior_citizens qw/1313579440F2036 2921522980M5644/;
}
