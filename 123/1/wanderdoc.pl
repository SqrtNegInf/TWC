#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);


use List::Util qw(min);

my $N = shift //150;
my $idx2 = my $idx3 = my $idx5 = 1;
my @num;

my $i = 1;

$num[$i] = 1;

while ( $i < $N )
{
     my $last = $num[$i];
     $idx2++ while $num[$idx2] * 2 <= $last;
     $idx3++ while $num[$idx3] * 3 <= $last;
     $idx5++ while $num[$idx5] * 5 <= $last;
     $i++;
     $num[$i] = min($num[$idx2] * 2, $num[$idx3] * 3, $num[$idx5] * 5);
    
}


print $num[$i], $/;
