#!/usr/bin/env raku

die 'not ok - disabled: not testable';

#| Display Help Text
multi sub MAIN( Bool :h(:$help) where so * ) {
    say $*USAGE;
}

#| Print an updating clock on the command line
multi sub MAIN() {
    END say "";
    for 1..3 {
        print "{DateTime.now.hh-mm-ss}";
        sleep 1;
        print "\r";
    }
}
