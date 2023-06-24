#!/usr/bin/env perl
use v5.36;

# read dictionary, count number of keys, i.e. anagrams
my %anagrams;
my $max_anagrams = 0;
open(my $fh, "<", "words") or die "open words.txt: $!\n";
while (<$fh>) {
    chomp;
    next if /\W/;
    next if length($_) < 2;
    my $num_anagrams = ++$anagrams{word_key($_)};
    $max_anagrams = $num_anagrams if $max_anagrams < $num_anagrams;
}

# output all sequences with $max_anagrams
say "Maximum of $max_anagrams anagrams";
for (sort keys %anagrams) {
    say $_ if $anagrams{$_} == $max_anagrams;
}

sub word_key {
    my($word) = @_;
    $word =~ s/\W//g;
    my @letters = sort split //, lc($word);
    return join '', @letters;
}
