#!/usr/bin/env perl

use strict;
use warnings;
use feature qw{ say };

# all the arguments are in ARGV, except we've removed the -csv flag with
# GetOptions, we just do a file test to make sure we can open them before
# opening them. We COULD test for repeated files, but we don't.

# and we use the hash to keep a count, rather than store as an array
# and count later.

my %lines;
    for my $arg ('example.txt') {
        if ( -f $arg && open my $fh, '<', $arg ) {
            while (<$fh>) {
                chomp;
                $lines{$_}++;
            }
        }
    }

my $separator = "\t";
for my $k ( sort { $lines{$b} <=> $lines{$a} } keys %lines ) {
    my $v = $lines{$k};
    say join $separator, $k, $v;
}
