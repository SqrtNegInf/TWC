#!/usr/bin/env perl
use v5.36;

sub nth_root ($N, $k) { return $N ** $k ** -1 }

my $N_ = shift || 34;
my $k_ = shift || 5;
say nth_root($N_, $k_);
