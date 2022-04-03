#!/usr/bin/env raku

sub gray-code-sequence($n) {
    if ($n == 1) {
        return [0, 1];
    }
    my $seq1 = gray-code-sequence($n - 1);
    my $seq2 = [2**($n - 1) + $_ for $seq1.reverse];
    return [|($seq1), |($seq2)];
}

gray-code-sequence(1).say;
gray-code-sequence(2).say;
gray-code-sequence(3).say;
gray-code-sequence(4).say;
gray-code-sequence(5).say;
