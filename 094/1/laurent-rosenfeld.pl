#!/usr/bin/env perl
use v5.36;

my @test = @ARGV > 0 ? @ARGV : qw < tops opt bat pots saw tab pot top stop opts was x>;

my %words;
for my $w (@test) {
    my $normalized = join "", sort split //, $w;
    push @{$words{$normalized}}, $w;
}
for my $k (sort keys %words) {
    say '[' . "@{$words{$k}}" . ']';
}
