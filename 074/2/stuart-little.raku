#!/usr/bin/env raku

sub fnr(Str $s) {
    $s.split('',:skip-empty).grep({ $s.indices($_) == 1 }).[0] || '#'
}

my $ARGS = 'ababcabd';
say (1..$ARGS.chars).map({$ARGS.substr(0,$_)}).map(&fnr);

# run as <script> <space-separated integers>
