#!/usr/bin/env perl
use v5.36;

#
# A prime p in base b is a long prime if ((b^(p - 1) - 1) / p) isn't repetitive.
#

my $COUNT =  5;
my $BASE  = 10;

#
# Check whether ($BASE ** ($number - 1) - 1) / $number gives a result
# which repeats or not. We do this by performing long division,
# and check we don't repeat an intermediate result.
#
# We could have just calculated $BASE ** ($number - 1) - 1) / $number using
# big integers. We choose not to, using a method which can easily be ported
# to languages without support for big integers.
#
# Note, we never check whether $number is a prime. If it passes the test,
# it will be a prime (that is, no composite number will repeat with maximum
# period).
#
sub is_long ($number) {
    my $rest = 0;
    my %seen;
    for (2 .. $number) {
        return 0 if $seen {$rest = ($rest * $BASE + $BASE - 1) % $number} ++;
    }
    return 1;
}


my $number = 1;
while ($COUNT) {
    $number ++;
    next if $BASE % $number == 0;  # Divisors of $BASE don't repeat.
    next unless is_long $number;
    say $number;
    $COUNT --;
}
