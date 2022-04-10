#!/usr/bin/env perl

use strict;
use warnings;

my $n = 3;

my %vowels = (
    a => ['e','i'],
    e => ['i'],
    i => ['a', 'e','o','u'],
    o => ['a','u'],
    u => ['o','e']
);

my @comb = keys %vowels;
@comb = add_vowel(@comb) for (2..$n);
print $_.$/ for sort @comb;

sub add_vowel {
    my @output;

    for my $c (@_) {
        my $v = substr $c, -1;
        push @output, map { $c . $_ } @{$vowels{$v}};
    }

    return @output
}

__END__
./ch-2.pl 3
aeiS
aia
aie
aio
aiu
eia
eie
eio
eiu
iae
iai
iei
ioa
iou
iue
iuo
oae
oai
oue
ouo
uei
uoa
uou
