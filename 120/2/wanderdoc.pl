#!/usr/bin/env perl
use v5.36;

my %MINUTES;
@MINUTES{0 .. 59} = map $_ * 6, 0 .. 59;

my %HOURS;
@HOURS{0 .. 11} = map $_ * 30, 0 .. 11;

sub clock_angle {
     my $time = $_[0];
     my ($hour, $min) = map $_ * 1, split(/:/, $time);
     $hour = $hour >= 12 ? $hour - 12 : $hour; 
     my $hour_hand = $HOURS{$hour} + ($min/60) * 30;
     my $minute_hand = $MINUTES{$min};
     my $angle = abs($hour_hand - $minute_hand);
     $angle = $angle > 180 ? 360 - $angle : $angle;
     return $angle;
}

#for my $time ( '0000' .. '2359' )
for my $time ( '0310', '1255' )
{
     next if unpack("xxA2", $time) > 59;

     my $time_formatted = join(':',unpack("A2A2",$time)); 
     print join(' -> ', $time_formatted, clock_angle($time_formatted)), $/;
}
