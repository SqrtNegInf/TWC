#!/usr/bin/env perl
use v5.36;
use List::Util qw/sum pairmap first/;

say valid('978-0-306-40615-7') ? "Correct check digit." 
                               : "Incorrect check digit.";

sub lookup {
    my $partial_code = $_[0];
    return first {valid($partial_code.$_)} (0..9);
}

sub valid {
    my $code = $_[0];
    my @d = grep { /\d/ } split "", $code;
    die "Invalid ISBN-13 code!\n" if scalar @d != 13;
    return !( ($d[12] + sum pairmap {$a + 3*$b} @d[0..11]) % 10);
}



use Test::More tests => 9;
ok valid("978-0-306-40615-7"), "task example";
ok valid("978-1-492-04503-8"), "Think Julia";
ok valid("978-1-59327-666-9"), "How Software Works";
ok valid("978-1-260-08450-4"), "Database System Concepts";
ok !valid("123-4-567-89123-4"), "random strings of digits";
ok 7==lookup("978-0-306-40615-?"), "(check digit) task example";
ok 8==lookup("978-1-492-04503-?"), "(check digit) Think Julia";
ok 9==lookup("978-1-59327-666-?"), "(check digit) How Software Works";
ok 4==lookup("978-1-260-08450-?"), "(check digit) Database System Concepts";
