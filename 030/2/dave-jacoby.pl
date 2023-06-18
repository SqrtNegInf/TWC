#!/usr/bin/env perl
use v5.36;

my %done ;

for my $m ( 1 .. 10 ) {
    for my $n ( 1 .. 10 ) {
        for my $o ( 1 .. 10 ) {
            my $i = join ' ' , sort $m,$n,$o;
            next if $done{$i}++;;
            my $p = $m + $n + $o;
            next unless $p == 12;
            say qq{    $m + $n + $o = $p};
        }
    }
}

# but the trick to avoid duplicates is for $n to start with $m+1
# and $o to start with $n+1.
