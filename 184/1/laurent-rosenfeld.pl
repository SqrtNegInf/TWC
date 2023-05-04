#!/usr/bin/env perl
use v5.36;

for my $test ([<ab1234 cd5678 ef1342>], [<pq1122 rs3334>]) {
    my $i = 0;
    my @out = @$test;
    for (@out) {
        my $count = sprintf("%02d", $i);
        s/^[a-z]{2}/$count/;
        $i++;
    }
    say "@$test  =>  @out";
}
