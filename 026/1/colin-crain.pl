#!/usr/bin/env perl
use v5.36;

my ($stone, $jewel) = ('chancellor', 'chocolate');
my $jewels = { map { $_, 1 } (split //, $jewel) };
my @gravel = split //, $stone;
my $result = scalar (grep { $jewels->{$_} } @gravel);
say $result;

## this could alternately be done in just two lines:

# my $jewels = { map { $_, 1 } (split //, $ARGV[1]) };
# say scalar (grep { $jewels->{$_} } (split //, $ARGV[0]));


