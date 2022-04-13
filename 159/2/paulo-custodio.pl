#!/usr/bin/env perl

use Modern::Perl;
use ntheory qw( moebius );

my $n = shift || 10;
say moebius($n);
