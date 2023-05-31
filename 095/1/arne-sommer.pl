#!/usr/bin/env perl
use v5.36;

use Scalar::Util qw(looks_like_number);

my $N = $ARGV[0] // 2002;

die "Not a number" unless looks_like_number($N);

say 0 + ($N eq reverse($N)); 
