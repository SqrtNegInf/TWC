#!/usr/bin/env perl
use v5.36;

my @people = (1..50);
my $killed = 0;

while (@people > 1) {
    # determine who will be killed within the circle
    $killed -= @people if ++$killed > $#people;
    # declare who kills who
    printf '%2d kills %-2d'.$/, $people[$killed-1], $people[$killed];
    # remove killed one from people
    splice @people, $killed, 1;
}

# The Highlander, there can be only one
printf $/.'%d is the survivor',@people;
