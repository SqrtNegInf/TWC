#!/usr/bin/env perl
use v5.36;

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
