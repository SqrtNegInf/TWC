#!/usr/bin/env perl

my %dispatch_table = (
    hello => sub { print "Hello!\n"; }, 
    goodbye => sub { print "Goodbye!\n"; } 
);
$dispatch_table{hello}();   
$dispatch_table{goodbye}();   
