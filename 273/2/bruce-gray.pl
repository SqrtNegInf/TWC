#!/usr/bin/env perl
use v5.36;

#use experimental qw(for_list);
#no warnings "experimental";

use builtin qw/true false/; 
no warnings "experimental::builtin";

sub task2 ($str) {
    return $str =~ / ^ [^b]* b [^a]* $ /msx;
}


my @tests = (
    'aabb' , true  ,
    'abab' , false ,
    'aaa'  , false ,
    'bbb'  , true  ,
);
use Test2::V0 -no_srand; 
plan @tests/2;
for my ( $str, $expected ) (@tests) {
    is task2($str), $expected;
}
