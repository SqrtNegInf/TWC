#!/usr/bin/env raku

my $input = @*ARGS[0] // 1234;
for $input .. Inf -> $candidate {
    next unless $candidate eq $candidate.flip;
    say $candidate;
    last;
}
