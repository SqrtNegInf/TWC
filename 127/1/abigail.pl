#!/usr/bin/env perl
use v5.36;

#
# The two sets given each contain unique integers. So, the sets
# are disjoint if and only if their union doesn't contain duplicates.
# An array of integers doesn't contain duplicates if we create a hash
# out of the array (values don't matter), then check whether the number
# of keys of the hash is the same as the number of elements in the array.
# We'll use the hash %_ and the array @_. A hash in scalar context
# gives the number of keys in the hash.
#
# We assume each line of input contains two sets of integers, the
# integers separated by white space, and the sets with semi-colons.
# For each line of input, we print either a 1 or a 0 to the output.
#

while (<DATA>) {
    %_ = map {$_ => $_} @_ = /[-+]?[0-9]+/g; say %_ == @_ ? 1 : 0;
}

__END__
1 2 5 3 4 : 4 6 7 8 9
1 2 5 3 4 : 6 7 8 9
