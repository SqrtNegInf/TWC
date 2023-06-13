#!/usr/bin/env perl
use v5.36;

my @x = 1 .. 50;

# the way it works is the first person kills the second person
# and hands the sword to the third person, 

# There could be a lot of DIRE inner-array mess in this, but no. 
# There are two actions

# passing the sword -> unshifting from the array and pushing at the end
# killing the next  -> unshifting from the array

my $i = 0;
while ( scalar @x > 1 ) {
    push @x, shift @x; # move killer to the end
    shift @x; # killer gets next
}
say join ',', @x;
