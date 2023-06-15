#!/usr/bin/env perl
use v5.36;

my %guestbook = (
    "Alex"    => [ "09:10", "09:45" ],
    "Arnold"  => [ "09:15", "09:33" ],
    "Bob"     => [ "09:22", "09:55" ],
    "Charlie" => [ "09:25", "10:05" ],
    "Steve"   => [ "09:33", "10:01" ],
    "Roger"   => [ "09:44", "10:12" ],
    "David"   => [ "09:57", "10:23" ],
    "Neil"    => [ "10:01", "10:19" ],
    "Chris"   => [ "10:10", "11:00" ],
);
my %light;

for my $guest ( keys %guestbook ) {
    my ( $s_hour, $s_minute ) = split ":", $guestbook{$guest}[0];
    my ( $f_hour, $f_minute ) = split ":", $guestbook{$guest}[1];
    while (
        sprintf( "%.2d:%.2d", $s_hour, $s_minute ) ne
        sprintf( "%.2d:%.2d", $f_hour, $f_minute ) )
    {
        $light{sprintf( "%.2d:%.2d", $s_hour, $s_minute )} = 1;
        if ( $s_minute == 59 ) {
            $s_minute = 0;
            $s_hour++;
        }
        else {
            $s_minute++;
        }
    }
    $light{sprintf( "%.2d:%.2d", $f_hour, $f_minute )} = 1;
}

say "Lights were on for ", scalar keys %light, " minutes";
