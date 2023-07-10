#!/usr/bin/env perl
use v5.36;

use utf8;

sub is_special_note ($source, $target) {
    my %count_for;
    for my $char (split //, $source) {
        $count_for{$char}++;
    }
    for my $char (split //, $target) {
        return 0 if !exists $count_for{$char} || $count_for{$char}-- < 1;
    }
    return 1;
}

say is_special_note('abc',               'xyz');
say is_special_note('scriptinglanguage', 'perl');
say is_special_note('aabbcc',            'abc');
