#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/ say /;

my ($stones, $jewels) = ('chancellor', 'chocolate');

my %alphabet = map { $_ => 0 } split //, $stones;

my $count = grep { exists $alphabet{$_} } split //, $jewels;

say $count;
