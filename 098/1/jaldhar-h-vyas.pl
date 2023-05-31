#!/usr/bin/env perl
use v5.36;

use English qw / -no_match_vars /;

sub readN {
    my ($filename, $number) = @_;
    my $buffer;
    state $fh = undef;

    if (!defined $fh) {
        open $fh, '<', $filename or die "$OS_ERROR\n";
    }

    read $fh, $buffer, $number or die "$OS_ERROR\n";

    return $buffer;
}

say readN('input.txt', 4);
say readN('input.txt', 4);
say readN('input.txt', 4);
