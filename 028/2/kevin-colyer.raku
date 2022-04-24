#!/usr/bin/env raku

die 'not ok - disabled: not testable';

use Test;

sub MAIN() {
    # bare minimum
    say DateTime.now.hh-mm-ss;
}
