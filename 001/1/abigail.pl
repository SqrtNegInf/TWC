#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    my $changes = y/e/E/;
    say $_, $changes
}

__END__
Perl Weekly Challenge
