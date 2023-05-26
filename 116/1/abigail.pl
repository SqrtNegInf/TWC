#!/usr/bin/env perl
use v5.36;

#
# Given a chain and a starting number, check whether we can form a
# chain. We will return a list of parts if succes. Note:
#   1) If the start is the same as the string, we return a single
#      item list.
#   2) We return the list in reverse order. Due to Perls memory
#      management, N pushes will require O (log N) calls to
#      malloc, and O (N) memory shuffles. This is worse if we
#      use N unshifts.
#
# Note the running time is O (N), despite recursing twice. This is
# because there is no number X such that X + 1 and X - 1 are the same
# number. Hence, in at least one of the recursive make_sequence calls the
# 'start' will not match the beginning of 'string'.
#

sub make_sequence ($string, $start) {
    if ($string eq $start) {
        return [$start]
    }
    if (index ($string, $start) == 0) {
        my $tail = substr $string, length $start;
        my $rest;
        if (($rest = make_sequence ($tail, $start + 1)) ||
            ($rest = make_sequence ($tail, $start - 1))) {
            push  @$rest => $start;
            return $rest;
        }
    }
    return;
}


INPUT: while (<DATA>) {
    chomp;
    for my $i (1 .. length) {
        #
        # Try to make a chain with each possible start.
        #
        my  $result = make_sequence $_, substr $_, 0, $i;
        if ($result) {
            say join "," => reverse @$result;
            next INPUT;
        }
    }
}


__END__
91011
1234
58763
