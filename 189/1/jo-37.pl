#!/usr/bin/env perl
# mangled for brevity

use v5.36;
use List::Util 'reduce';
use Test::More;

# Example 5 contradicts the task's description as 'v' is not contained in the given array.

# Select a new candidate if it is larger than the target and smaller
# than an existing previous candidate.  Initializing $a with the
# target gives the target as result if there is no matching
# character in the array.
sub smallest_char ($t, @list) { reduce {$b gt $t && ($b lt $a || $a eq $t) ? $b : $a} $t, @list }

is smallest_char(qw(b e m u g)), 'e', 'Example 1';
is smallest_char(qw(a d c e f)), 'c', 'Example 2';
is smallest_char(qw(o j a r)),   'r', 'Example 3';
is smallest_char(qw(a d c a f)), 'c', 'Example 4';
is smallest_char(qw(v t g a l)), 'v', 'Example 5';
done_testing;
