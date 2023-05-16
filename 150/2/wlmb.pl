#!/usr/bin/env perl5.32.1

use v5.12;
use warnings;
use PDL;
use PDL::NiceSlice;
my $N=$ARGV[0]//500;
my $square_free=ones($N+1);
$square_free(0).=0; # ignore zero
$square_free($_*$_:-1:$_*$_).=0
    for(2..sqrt($N));
say sequence($N+1)->where($square_free);
