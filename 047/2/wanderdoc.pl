#!/usr/bin/env perl
use v5.36;

my $number = 100;
my $counter = 0;

while ( $counter < 20 )
{
     gapful($number) and print join(' ', ++$counter,$number), $/;
     $number++;
}

sub gapful
{
     my $num = $_[0];
     my $div = join('',(split(//,$num))[0, -1]);
     return 0 == $num % $div;
}
