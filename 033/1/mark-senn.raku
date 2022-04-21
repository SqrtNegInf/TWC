#!/usr/bin/env raku

# Tally the number of letters in all files specified on the command line.
my %count;
'../00-blogs'.IO.lines.lc.comb(/<[a..z]>/).map({%count{$_}++});

# Print the tally.
%count.keys.sort.map({"$_: %count{$_}".say});
