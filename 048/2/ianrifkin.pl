#!/usr/bin/env perl
use v5.36;

use Date::Simple;

my $check_date = Date::Simple->new('2000-01-01');
my $end_date = Date::Simple->new('2999-12-31');

print "\nThe following dates from $check_date to $end_date are palindromes assuming the format mmddyyy:\n";
while ($check_date <= $end_date) {
    my $forwards = $check_date->format('%m%d%Y');
    my $backwards = reverse $forwards;
    print "$forwards (" . $check_date->format('%m-%d-%Y') . ")\n" if $forwards == $backwards;
    $check_date++
}
