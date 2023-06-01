#!/usr/bin/env perl
use v5.36;

my $N = 1122234;
while ($N ne '') {
    $N =~ s/^((\d)\2*)// or die;
    print length($1), $2;
}
print "\n";
