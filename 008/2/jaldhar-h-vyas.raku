#!/usr/bin/env raku

sub center(@args) {
    my $maxLength = @args>>.chars.max;
    return @args.map({ .indent(($maxLength - .chars) / 2) ~ "\n"; });
}

center(('This', 'is', 'a test of the', 'centre function')).print;
