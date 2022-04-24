#!/usr/bin/env raku

die 'not ok - disabled: not testable';

sub MAIN() {
    say DateTime.now.hh-mm-ss;
}


