#!/usr/bin/env raku

# Do not accept a lossy loop.  All is best DRY.

("dictionary.txt".IO.lines(:chomp).grep({ .comb.sort.join eq $_ })).sort( { $^b.chars <=> $^a.chars }).join( "\n").say;
