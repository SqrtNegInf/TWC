#!/usr/bin/env perl
use strict;
use feature qw( say );



my @L = (19,11,9,7,20,3,17,16,2,14,1); #List of number inputs

# Initially I was going to solve with a nested loop
# Which is definitely how my mind defaults
# e.g. my $count increments whenever it finds a number greater than $i
# going to next in loop whenever it gets a count > $num
# and output $num whenever == count
# This works great but then I started brainstorming a more fun solution...

# If the number list is sorted then instead of checking how a number is equal to another number
# we can simply count how many numbers are ahead of it in the list

# Assumption: The same number won't be in the list more than once
#             Though I suppose I could splice out dupes if that assumption isn't true

@L = sort { $a <=> $b } @L; #Sort numerically
# If assumption was untrue, splice dupes here?
my $length = scalar @L;
for (my $pos = 0; $pos < $length; $pos++) {
    #found a noble integer if it's value is equal to the amount of numbers after it
    say "Noble integer found: $L[$pos]" if $L[$pos] == $length - $pos - 1;
}
