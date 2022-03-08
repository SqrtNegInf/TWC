#!/usr/bin/env raku

#multi sub MAIN("test") is hidden-from-USAGE {
    use Test;
    is( hand-angle( 3, 10 ), 35 );
    is( hand-angle( 15, 10 ), 35 );
    is( hand-angle( 4, 0 ), 120 );
    is( hand-angle( 16, 0 ), 120 );
    done-testing;
#}

subset Time24 of Str where { $_ ~~ /^(\d\d) ':' (\d\d)$/ && 0 <= $0 <= 23 && 0 <= $1 <= 59 };
subset Hour of Int where 0 <= * <= 23;
subset Minute of Int where 0 <= * <= 59;

sub hand-angle ( Hour $hour, Minute $minute ) {
    my $minute-angle = $minute * (360 / 60);
    my $hour-angle = (($hour % 12) * (360/12)) + ($minute * (30/60));
    return abs($minute-angle - $hour-angle);
}
