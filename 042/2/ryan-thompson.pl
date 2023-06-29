#!/usr/bin/env perl
use v5.36;

no warnings 'uninitialized';

srand 1;

use List::Util 'shuffle';

# To have any hope of being balanced, the string must be of even length,
# and must contain the same number of ( and ) brackets, so that's what we do.
sub gen_str { join '', shuffle map { ($_) x $_[0] } qw<( )> }

# This type of balance checking is trivial with a regex
sub balanced_tiny { $_[0] =~ /^(\((?1)*\))*$/ }

# Same sub, less line noise
sub balanced { 
    $_[0] =~ /^         # Start of string
        (               # Match group 1
            \(          # Opening bracket
                (?1)*   # Recurse to start of group 1
            \)          # Closing bracket
        )*              # Group 1, zero or more times
    $/x                 # End of string
}

# And now we'll check a few
for my $n (0..5) {
    say "$_ - " . (balanced ? 'OK' : 'NOT OK') for map { gen_str($n) } 1..5;
}

