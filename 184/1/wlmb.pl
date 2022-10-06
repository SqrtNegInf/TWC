#!/usr/bin/env perl

use v5.36;
die unless my @ARGV = <ab1234 cd5678 ef1342>;
die "More than 100 strings" if @ARGV>100;
my $counter="00";
say join ", ",
    map {m/^[a-z]{2}\d{4}$/||die "Bad format $_\n"; s/../$counter++/e; $_}
    @ARGV;
