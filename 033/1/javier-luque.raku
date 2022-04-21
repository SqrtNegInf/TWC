#!/usr/bin/env raku

my @filenames  = '../00-blogs';
    my %counts;

    # Loop through each file
    for @filenames -> $filename {
        my $fh = $filename.IO.open orelse .die;

        # Increment count for each word char
        while (my $char = $fh.getc) {
            %counts{$char.lc}++ if ($char.lc ~~ /\w/);
        }
    }

    # Print each char and count
    for %counts.keys.sort -> $item {
        "%2s %5i\n".printf($item, %counts{$item});
    }
