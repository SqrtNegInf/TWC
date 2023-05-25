#!/usr/bin/env perl
use v5.36;

use List::Util qw{ sum };

for my $file ( 'example.txt') {
    next unless -f $file;
    my $row = missing_row($file);
    say join "\t", $row, $file;
}

sub missing_row( $file ) {
    if ( -f $file && open my $fh, '<', $file ) {
        my @targets = map { $_ } 0 .. 15;
        my @x       = map { chomp $_; $_ } <$fh>;
        close $fh;
        for my $l (@x) { my ($d) = split /,/, $l; $targets[$d] = 0; }
        return sum @targets;
    }
    return 'none';
}
