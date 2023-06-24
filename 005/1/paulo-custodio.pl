#!/usr/bin/env perl
use v5.36;

# get input
my($word) = 'animal';
my $word_key = word_key($word);

# read dictionary and print words that match key set
open(my $fh, "<", "words") or die "open words.txt: $!\n";
while (<$fh>) {
    chomp;
    next if /\W/;
    say lc($_) if $word_key eq word_key($_);
}

sub word_key {
    my($word) = @_;
    $word =~ s/\W//g;
    my @letters = sort split //, lc($word);
    return join '', @letters;
}
