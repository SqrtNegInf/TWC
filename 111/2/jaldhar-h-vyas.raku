#!/usr/bin/env raku

sub MAIN(
    Str $filename='words'
) {
    my $longest = q{};

    for $filename.IO.lines -> $line {
        chomp $line;
        if $line.lc ~~ $line.lc.comb.sort.join && $line.chars > $longest.chars {
            $longest = $line;
        }
    }

    say $longest;
}
