#!/usr/bin/env perl
use v5.36;
#
#       palindrome.pl
#
#       TASK #1 › Palindrome Number
#         Submitted by: Mohammad S Anwar
#
#         You are given a number $N.
#
#         Write a script to figure out if the given number is Palindrome. Print 1
#         if true otherwise 0.
#
#         Example 1:
#
#             Input: 1221
#             Output: 1
#
#         Example 2:
#
#             Input: -101
#             Output: 0, since -101 and 101- are not the same.
#
#         Example 3:
#
#             Input: 90
#             Output: 0
#
#       © 2021 colin crain
#
## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ## ##

## ## ## ## ## MAIN:
my @ARGV = 2002;
exit unless scalar @ARGV;
my $num = shift @ARGV;
$num += 0;

say 1 and exit if $num =~  m/^(.*).?(??{reverse($1)})$/;
say 0;





