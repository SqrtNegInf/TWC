#!/usr/bin/env raku

die 'not ok - disabled: not testable';

shell("clear");

for 1..3 {
    say "Hit Ctrl+C to exit\n";
    say DateTime.now.hh-mm-ss;
    sleep(1);    
    shell("clear");
    signal(SIGINT).tap( { say "Bye!"; exit 0 } );
}
