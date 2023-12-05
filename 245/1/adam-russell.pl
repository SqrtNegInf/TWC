#!/usr/bin/env perl
use v5.36;

use Thread;
sub sort_language{
    my @language = @{$_[0]};
    my @popularity = @{$_[1]};
    my @threads;
    do{
        push @threads, Thread->new(
            sub{sleep($popularity[$_]); say $language[$_]}
        );
    } for 0 .. @popularity - 1;
    do{$_ -> join()} for @threads;
}

MAIN:{
    sort_language [qw/perl c python/], [2, 1, 3];
}
