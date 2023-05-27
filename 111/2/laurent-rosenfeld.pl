#!/usr/bin/env perl
use v5.36;

my @long_words;
my $max_length = 0;

my $word_list = "/usr/share/dict/words";
open my $IN, "<", $word_list or die "Cannot open $word_list $!";
while (my $word = <$IN>) {
    chomp $word;
    next unless $word eq join '', sort split //, $word;
    my $length = length $word;
    if  ($length > $max_length) {
        @long_words = ($word);
        $max_length = $length;
    } elsif ($length == $max_length) {
        push @long_words, $word;
    }
}
say "@long_words";
