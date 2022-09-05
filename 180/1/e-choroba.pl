#!/usr/bin/env perl
use warnings;
use strict;
use experimental 'signatures';

sub first_unique_character_regex ($s) {
    local $_ = $s;
    s/\Q$1//g while /(.).*\1/g;

    return length ? index $s, substr $_, 0, 1 : -1;
}

use List::Util qw{ min };
sub first_unique_character_hash ($s) {
    my %pos;
    my $i = 0;
    my %is_unique;
    for my $ch (split //, $s) {
        $is_unique{$ch} = ! exists $pos{$ch};
        $pos{$ch} = $i++;
    }
    return min(@pos{ grep $is_unique{$_}, keys %pos }) // -1
}

use Hash::Ordered;
sub first_unique_character_ho ($s) {
    my $unique = 'Hash::Ordered'->new;
    my %seen;
    my @chars = split //, $s;
    for my $i (0 .. $#chars) {
        my $ch = $chars[$i];
        if ($seen{$ch}++) {
            $unique->delete($ch);
        } else {
            $unique->set($ch, $i);
        }
    }
    return $unique->shift // -1
}

use Tie::Hash::Indexed;
sub first_unique_character_thi ($s) {
    my $unique = 'Tie::Hash::Indexed'->new;
    my %seen;
    my @chars = split //, $s;
    for my $i (0 .. $#chars) {
        my $ch = $chars[$i];
        if ($seen{$ch}++) {
            $unique->delete($ch);
        } else {
            $unique->set($ch, $i);
        }
    }
    return $unique->shift // -1
}

use Test::More tests => 12;

my @EXPECT = (
    ['Perl Weekly Challenge', 0, 'Example 1'],
    ['Long Live Perl',        1, 'Example 2'],
    ['ABCDDCBA',             -1, 'Everything repeats'],
);

for my $e (@EXPECT) {
    my ($input, $output, $name) = @$e;
    is first_unique_character_hash($input), $output, $name;
    is first_unique_character_regex($input), $output, $name;
    is first_unique_character_ho($input), $output, $name;
    is first_unique_character_thi($input), $output, $name;
}
