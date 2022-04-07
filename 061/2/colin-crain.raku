#!/usr/bin/env raku

sub MAIN( $str = "2552501135" ) {
    my @matches = $str ~~ m:ex/ ^  ( \d ** 1..3
                                        <?{ $/ !~~ Nil && $/.Int <= 255 && $/ !~~ /^0\d/ }>
                                    ) ** 4  $ /;
    .flat.join(".").say for @matches;
}
