#!/usr/bin/env perl
use v5.36;

use Modern::Perl;
use ntheory qw( moebius );

my $n = shift || 10;
say moebius($n);
