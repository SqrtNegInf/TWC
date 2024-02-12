#!/usr/bin/env perl

use strict;
use warnings;

my $paragraph = "Joe hit a ball, the hit ball flew far after it was hit.";
my $banned = "hit";
banned_word($paragraph, $banned);


$paragraph = "Perl and Raku belong to the same family. Perl is the most popular language in the weekly challenge.";
$banned = "the";
banned_word($paragraph, $banned);

exit 0;

sub banned_word {
    my $paragraph = shift;
    my $banned = shift;

    $paragraph =~ s/[^[:word:] ]//g;

    my %freq;
    foreach my $word (split / /, $paragraph) {
        $freq{$word}++
            unless $word eq $banned;
    }

    printf "%s | %s -> %s\n",
        $paragraph, $banned, [ sort { $freq{$b} <=> $freq{$a} }
                               keys %freq
                             ]->[0];
    return undef;
}
