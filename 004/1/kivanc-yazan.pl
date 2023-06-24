#!/usr/bin/env perl
use v5.36;

use Math::Prime::Util qw/Pi/;

open(my $fh, "<", $0);
my $chars;
$chars += length($_) for <$fh>;
close $fh;
print Pi($chars)."\n";
