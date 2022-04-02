#!/usr/bin/env perl
use strict;
use warnings;
use feature qw(:5.32);
use experimental qw(signatures);

my $s = 'ababcabd';
my @c = split //, $s;
my %seen;
my @nr;
my $out;

for my $c (@c) {
    # have we seen $c before?
    unless (defined $seen{$c}) {
        # add $c to @nr
        $seen{$c} = 1;
        push @nr, $c;
    } else {
        # remove $c from @nr
        if ($seen{$c}) {
            for my $i (0..$#nr) {
                if ($nr[$i] eq $c) {
                    splice @nr, $i, 1;
                    last;
                }
            }
            $seen{$c} = 0;
        }
    }

    # now the FNR is either the last element of @nr, or #
    $out .= @nr ? $nr[-1] : '#';
}

say $out;
