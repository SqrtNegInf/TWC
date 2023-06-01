#!/usr/bin/env perl
use v5.36;

my $input = 1122234;
if (!defined($input) || $input !~ m/^[1-9]\d*$/) {
    print "Usage: ch-1.pl <positive integer>\n";
    exit 1;
}

foreach my $digit (0..9) {
    my @numbers = ($input =~ /$digit/g);
    print scalar(@numbers) . $digit if scalar(@numbers) > 0;
}

exit 0;
