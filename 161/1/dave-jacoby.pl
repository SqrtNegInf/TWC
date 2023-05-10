#!/usr/bin/env perl
use v5.36;

my @dict = get_dict();
say join "\n", sort { length $b <=> length $a }
    grep { is_abecedarian($_) } @dict;

sub is_abecedarian ( $word ) {
    my $dorw = join '', sort { lc $a cmp lc $b } split //, $word;
    return $dorw eq $word ? 1 : 0;
}

sub get_dict() {
    if ( open my $fh, '<', 'dictionary.txt' ) {
        my @output;
        while ( my $word = <$fh> ) {
            chomp $word;
            push @output, $word;
        }
        return @output;
    }
    exit;
}

