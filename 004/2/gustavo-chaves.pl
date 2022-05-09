#!/usr/bin/env perl

use 5.026;
use strict;
use autodie;
use warnings;

my $file    = 'words';
my $letters = 'crate';

# Construct a hash mapping each letter to its count number
my %letters;
++$letters{$_} foreach split //, lc $letters;

# Return true if $word matches %letters
sub match {
    my ($word) = @_;
    my %letters = %letters;
    foreach my $char (split //, lc $word) {
        return 0 unless exists $letters{$char} && $letters{$char}-- > 0;
    }
    return 1;
}

open my $fh, '<', $file;
while (<$fh>) {
    chomp;
    say $_ if match($_);
}
close $fh;
