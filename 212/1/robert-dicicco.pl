#!/usr/bin/env perl

use v5.36;
use List::MoreUtils qw(first_index);

my $word = 'Perl';
my @jump = (2,22,19,9);

#my $word = 'Raku';
#my @jump = (24,4,7,17);


my @alphabet = qw(a b c d e f g h i j k l m n o p q r s t u v w x y z);

say "Input: \$word = $word and \@jump = (@jump)";

print "Output: ";

for my $n (0..length($word) - 1) {
    my $ch = lc(substr($word,$n,1));
    my $ndx = first_index { $_ eq $ch } @alphabet;
    $ndx += $jump[$n];
    $n == 0 ? print uc(@alphabet[$ndx % 26]) : print @alphabet[$ndx % 26];
}
