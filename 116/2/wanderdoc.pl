#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::Util qw(sum);

sub is_perfect_square
{
     my $num = $_[0];
     my $square_root = sqrt($num);
     return $square_root == int($square_root) ? 1 : 0;
}


sub sum_of_squares
{
     my $int = $_[0];
     my @digits = split(//,$int);
     my $sum_of_squares = sum(map $_ * $_, @digits);
     return $sum_of_squares;
}

for my $num ( 34, 50, 52, 679, 5311 )
{
     print $num, ': ', is_perfect_square(sum_of_squares($num)), $/;
}
