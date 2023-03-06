#!/usr/bin/env perl
use v5.36;

shortTime("00:00", "23:55", "20:00");
shortTime("01:01", "00:50", "00:57");
shortTime("10:10", "09:30", "09:00", "09:55");

sub shortTime(@array) {
    foreach my $time (@array) {
        my ($hour, $minutes) = $time =~ m"(\d\d):(\d\d)";
        $time = $hour*60 + $minutes;
    }
    
    my $shortTime = 1440;
    foreach my $time (@array) {
        foreach my $secondTime (@array) {
            next if($time == $secondTime);
            my $tempTime = $secondTime;
            ($tempTime += 1440)     if($time > $secondTime);
            $shortTime = ($tempTime - $time)  if(($tempTime - $time) < $shortTime );
        }
    }
    say $shortTime;
}
