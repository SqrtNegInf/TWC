#!/usr/bin/env perl
use v5.36;

my @aoa=([qw<I L O V E Y O U>], [qw<2 4 0 3 2 0 1 9>], [qw<! ? £ $ % ^ & * >]);
my @indexes=@ARGV==0?(1,2,3,4):@ARGV;

print "$_\n" for map {my $i=$_; join " ", map {$aoa[$_]->[$i]} 0..$#aoa} @indexes; 
