#!/usr/bin/env raku

use Test;

sub MAIN(Str $file where *.IO.e = $*PROGRAM-NAME) {
    my $fh = $file.IO.open;
    LEAVE try close $fh;

    # attempt a single byte read explicitly in ascii
    $fh.encoding: 'ascii';

    try {
        $fh.getc;
    }
    if $! { say “The file content is binary.”}
    else  { say “The file content is ascii.” };
}
