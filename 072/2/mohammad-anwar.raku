#!/usr/bin/env raku

sub MAIN(Str :$file where *.IO.f = 'input.txt',
         Int :$A    where * > 0 = 3,
         Int :$B    where * >= $A = 6) {

    lines-range($file, $A, $B).join("\n").say;
}

sub lines-range(Str $file, Int $A is copy, Int $B is copy) {

    my @lines = Empty;
    for --$A .. --$B -> $i {
        @lines.push: $file.IO.lines[$i];
    }

    return @lines;
}
