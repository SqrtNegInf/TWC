#!/usr/bin/env perl
use v5.36;

#
# It's not clear what actually needs to be outputted here.
# The challenges asks to generate a multiplication table, but to
# display a count. But the output of the examples shows a table,
# a list of distinct numbers, and a count of said list.
#
# It's often that the challenge it totally unclear where the 
# boundary is between "this is output we expect", and "this is us
# explaining how to get that output".
#
# So, we will just display a count, as that is what is asked for us.
# Wnat more? Spend a few more seconds on writing the challenge.
#

#
# We'll just multiply all the numbers 1 <= $x <= $n with all the numbers
# 1 <= $y <= $m, stick them in a hash, and display the number of different
# keys in the resulting hash.
#

while (<DATA>) {
    ($~, $=) = split;
     %~ = map {$; = $_; map {$; * $_ => 1} 1 .. $~} 1 .. $=;
    say ~~%~;
}

__END__
5 5
