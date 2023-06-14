#!/usr/bin/env perl
use v5.36;

my $GOAL = 200;
my $START = $GOAL;

my @steps;

while ( $START >= 1 )
{
     push @steps, [$START, $GOAL];
     if ( $START % 2 == 0 )
     {
          $START /= 2;
     }
     else
     {
          $START -= 1;
     }
}

print join("\t", qw(Step Start Goal)), $/;

my $counter = 0;
for my $step ( reverse @steps )
{
     print join("\t", $counter, @$step[0,1] ), $/;
     $counter++;
}
