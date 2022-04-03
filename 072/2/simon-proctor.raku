#!/usr/bin/env raku

subset FilePath of Str where *.IO:f;

#| Read and output lines A -> B in the given text file
sub MAIN (
    UInt $A where * > 0 = 3, #= Start line
    UInt $B where * >= $A = 6, #= End line
    FilePath :f(:$file) = "input.txt", #= Text file to read
) {
    .say for $file.IO.lines[$A-1..$B-1];
}
