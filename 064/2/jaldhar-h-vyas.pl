#!/usr/bin/env perl
use v5.36;

sub search {
    my ($S, @W) = @_;
    my @results;

    push @results, grep { $S =~ /$_/ } @W; 

    return (scalar @results) ? join ', ', @results : 0;
}

say search("perlweeklychallenge", ("weekly", "challenge", "perl"));
say search("perlandraku", ("python", "ruby", "haskell"));
