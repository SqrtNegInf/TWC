#!/usr/bin/env perl
use v5.36;

my @words;
my $max_len = 0;
open my $dict, '<', '/usr/share/dict/words';
while (<$dict>) {
    chomp;
    my $word = lc($_);
    my $drow = join '', (sort split //, $word);
    if ($word eq $drow) {
        $max_len = length($word) if $max_len < length($word);
        push @words, $word;
    }
}
say join "\n", grep {length($_)==$max_len} @words;
