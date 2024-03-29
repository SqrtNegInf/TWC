#!/usr/bin/env perl
use v5.36;

sub rotations {
    my ($original) = @_;
    my $word = $original;
    my $word_length = length $original;
    my $rotation = 0;

    do {
        $rotation++;
        $word .= substr $word, 0, $rotation % $word_length, q{};
    } until ($word eq $original);

    return $rotation;
}

say rotations('xyxxy');
