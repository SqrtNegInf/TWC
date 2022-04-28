#!/usr/bin/env perl
package main;
use strict;
use warnings;

# glory for best belly boy!

sub is_abcd {
    my $what = shift;

    return $what eq join( '', sort( split //, $what ) );
}

open my $file, '<', 'dictionary.txt';

while (<$file>) {
    chomp;

    print "$_ is abcdrian \n" if is_abcd($_);
}
close $file;
