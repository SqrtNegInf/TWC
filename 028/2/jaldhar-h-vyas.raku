#!/usr/bin/env raku

die 'not ok - disabled: not testable';

sub tick() {
    my $now = DateTime.now;
    print "\b" x 8,
        sprintf("%02d:%02d:%02d", $now.hour, $now.minute , $now.second);
}

my $supply = Supply.interval(1);

$supply.tap( -> $v { tick; } );

tick();
#sleep;
