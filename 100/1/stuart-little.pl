#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(any);

sub convTime ($time) {
    $time =~ m/(\d+)\:(\d+)(.*)/;
    my ($h,$m) = ($1,$2);
    my $mode = $3;
    (index(lc $mode, "am") != -1) && return qq|${\ do {sprintf("%02d", $h % 12)}}:$m|;
    (index(lc $mode, "pm") != -1) && return qq|${\ do {sprintf("%02d", ($h % 12) + 12)}}:$m|;
    my $mer = (any {$_ == $h} (0..11)) ? (" am") : (" pm");
    my $modh = (any {$_ == $h} (1..12)) ? ($h) : (($h-12) % 24);  
    return qq|${\ do {sprintf("%02d", $modh)}}:$m$mer|;    
}

say convTime(join "", '17:50');
