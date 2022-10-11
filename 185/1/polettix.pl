#!/usr/bin/env perl

sub MAC_address { join ':', shift =~ m{([a-f0-9]{2})}igmxs }

printf "%s\n", MAC_address(shift // '1ac2.34f0.b1c2');
