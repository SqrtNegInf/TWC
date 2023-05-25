#!/usr/bin/env perl
use v5.36;

use Test::More tests => 9;

my @now = localtime(time);

my $T = $ARGV[0] || '03:10';

unless ($T =~ m/^(\d){1,2}:(\d){1,2}$/ && $1 <= 24 && $2 <= 59) { 
    die "Please input time in the format \"hh:mm\". \n";
}

#unit: degree(s) per minute
my $hour_hand_rate = 0.5;
my $minute_hand_rate = 6.0;

print "The clock angle of NOW ($T): " if !defined($ARGV[0]);
print clock_angle($T), " deg";
print " ± 5.5 deg" if !defined($ARGV[0]);
print "\n";

sub clock_angle {
    my $time = $_[0];
    my $h = substr($time,0,2);
    my $m = substr($time,-2,2);
    my $deg = abs(($h*30+$hour_hand_rate*$m - $minute_hand_rate*$m));
    while ($deg >= 360) {
        $deg-=360;
    }
    return $deg > 180 ? 360-$deg : $deg;
}


# ref: https://www.omnicalculator.com/math/clock-angle
#       #clock-angles-the-angle-between-clock-hands

ok ( clock_angle("03:10") == 35, "Example 1");
ok ( clock_angle("04:00") == 120 , "Example 2");
ok ( clock_angle("12:00") == 0 , "noon");
ok ( clock_angle("06:00") == 180, "6 o'clock");
ok ( clock_angle("09:00") == 90, "9 o'clock");
ok ( clock_angle("11:59") == 5.5, "11:59");
ok ( clock_angle("12:01") == 5.5, "12:01");
ok ( clock_angle("09:27") == 121.5, "09:27");
ok ( clock_angle("16:11") == 59.5, "16:11");
