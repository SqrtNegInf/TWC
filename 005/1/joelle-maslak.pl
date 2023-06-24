#!/usr/bin/env perl
use v5.36;

my $match = 'animal';
my %dedupe;

my $filename = $ARGV[1] // 'words';
open my $fh, '<', $filename;
while (my $word = <$fh>) {
    chomp($word);
    $word = fc($word);

    my $wordmatch = join '', sort split('', $word);

    if (fullmatch($match, $wordmatch)) {
        next if exists $dedupe{$word};
        $dedupe{$word} = 1;
        say $word;
    }
}
close $fh;

sub fullmatch($chars, $word) {
    $chars = join '', sort split '', $chars;
    $word  = join '', sort split '', $word;

    return ($chars eq $word);
}

