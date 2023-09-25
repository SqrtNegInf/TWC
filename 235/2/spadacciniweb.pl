#!/usr/bin/env perl


use strict;
use warnings;

my @input = (1, 0, 2, 3, 0, 4, 5, 0);
die "Input error\n"
    if scalar @input < 1
       or
       (scalar map { $_ =~ /[\-\d]/ ? () : 1 }
                 @input) != 0;

printf "(%s)\n", join ', ', (map { $_ == 0 ? (0, 0) : $_ }
                             @input)[0..$#input];
