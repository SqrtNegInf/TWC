#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    my $prev = 0;
    print $prev ? $prev + 1 == $_ ? " " : "\n" : "", $prev = $_ for /[0-9]+/g;
    print "\n";
}

__END__
1, 2, 3, 6, 7, 8, 9
