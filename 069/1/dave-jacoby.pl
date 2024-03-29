#!/usr/bin/env perl
use v5.36;

use Carp;
use List::Util qw{ min max };

# we want positive integers, and will block anything but

my $min = int min 1;
my $max = int max 200;

# zero not allowed. googol not allowed.
croak 'Min too small' if $min < 1;
croak 'Max too large' if $max > 10**15;

for my $n ( $min .. $max ) {
    say $n if is_strobo($n);
}

exit;

# there are digits that will not be part of a strobogrammatic 
# number, and we nope those away immeditately.
# then we use the transliteration operator, tr, to swap sixes with
# nines and vice versa, reverse the order of the numbers -- scratch 
# those operations, reverse them -- and compare with the original 
# number.  

# I thought this would be difficult, and was very prepared to not
# turn this one in, until I remembered the magic that is tr///
sub is_strobo ( $n ) {
    return 0 if $n =~ /2|3|4|5|7/;
    my $alt = join '' , reverse split //, $n;
    $alt =~ tr/69/96/;
    return 0 unless $n == $alt;
    return 1;
}
