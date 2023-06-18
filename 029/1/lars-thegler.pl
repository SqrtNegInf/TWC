#!/usr/bin/env perl
use v5.36;

my $input = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge';

# identify the braces in the input string
my ($brace) = $input =~ m/\{(.+?)\}/;

unless ($brace) {
    say $input;
    exit;
}

# split brace content into its expansions
my @expansions = split ',', $brace;

# replace the brace with the expansion
for my $expansion (@expansions) {
    ( my $output = $input ) =~ s/(\{.+?\})/$expansion/;
    say $output;
}
