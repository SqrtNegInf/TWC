#!/usr/bin/env perl
use v5.36;

#
# Just a one-liner....
#
# Find sequences of identical numbers. Replace them with the length
# of the sequence, and the repeated number. Do this globally. Print result.
#
print s/([0-9])\g{-1}*/length ($&) . $1/egr for <DATA>;

__END__
1122234
2333445
12345
