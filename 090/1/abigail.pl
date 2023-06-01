#!/usr/bin/env perl
use v5.36;

#
# y/// does the required replacements, and returns the number
# of characters replaced -- which turns out to be the length
# of the sequence. So, we first print the length of the sequence,
# followed by the modified sequence.
#
print y/TAGC/ATCG/, "\n", $_ while <DATA>;

__END__
GTAAACCCCTTTTCATTTAGACAGATCGACTCCTTATCCATTCTCAGAGATGTGTTGCTGGTCGCCG
