#!/usr/bin/env perl
use v5.36;

use Path::Tiny;

my $file = path('input.txt')->slurp;

$file =~ s/(--|'s)/ /g;
$file =~ s/[."(),]+/ /g;
$file =~ s/  / /g;
$file =~ s/\n/ /g;

my %words;
foreach my $word (split / /, $file) {
    $words{$word}++;
}

my %out;
foreach my $word (sort keys %words) {
    my $freq = $words{$word};
    push @{$out{$freq}}, $word;
}

foreach my $freq (sort { $a <=> $b} keys %out) {
    print "$freq ", join(' ', @{$out{$freq}}, "\n");
}
