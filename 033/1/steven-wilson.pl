#!/usr/bin/env perl
use v5.36;

my @files = '../00-blogs';
my %letters_count;

for my $file (@files) {
    open my $fh, '<', $file or die "Can't open < $file: $!";
    while ( !eof $fh ) {
        my @letters = grep {/[[:alpha:]]/} split //, readline($fh);
        for my $letter (@letters) {
            $letters_count{ lc $letter } += 1;
        }
    }
    close $fh;
}

for my $letter ( sort keys %letters_count ) {
    say "$letter: $letters_count{$letter}";
}
