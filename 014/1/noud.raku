#!/usr/bin/env raku

my @van_eck = 0, {@_.reverse.grep(@_[*-1], :k)[1] || 0} ... *;

# Print the first 100 numbers for the Van Eck series.
say @van_eck[^100];
