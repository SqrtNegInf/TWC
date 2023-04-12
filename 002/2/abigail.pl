#!/usr/bin/env perl

use v5.36;

#use 5.032;
#use strict;
#use warnings;
#no  warnings 'syntax';
#use experimental 'signatures';
#use experimental 'lexical_subs';

#
# See https://theweeklychallenge.org/blog/perl-weekly-challenge-002
#

#
# Run as: perl ch-2.pl < input-file
#

#use Getopt::Long;
#GetOptions ('t'  =>  \my $to_base,
#            'f'  =>  \my $from_base);

my $to_base = 0;
my $from_base = 1;
#die "Need exactly one of -t or -f" unless $to_base xor $from_base;

my $BASE = 35;

my %digits;
$digits {$_} = $_ for 0 .. 9;
foreach my $n (10 .. $BASE - 1) {
    my $ch = chr (65 + $n - 10);
    $digits {$ch} = $n;
    $digits {$n}  = $ch;
}

sub to_base ($number) {
    my $out = "";
    while ($number) {
        $out    = $digits {$number % $BASE} . $out;
        $number = int     ($number / $BASE);
    }
    $out || "0";
}

sub from_base ($number) {
    my $out = 0;
    while (length $number) {
        my $digit = substr $number, 0, 1, "";
        $out *= $BASE;
        $out += $digits {$digit};
    }
    $out;
}

while (my $number = <DATA>) {
    chomp $number;
    say $to_base ? to_base $number : from_base $number
}

__END__
RAKU
