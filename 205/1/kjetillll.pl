#!/usr/bin/env perl
my( $a, $b, $c ) = sort {$b <=> $a} @ARGV;
print $c // $a;
print "\n";
