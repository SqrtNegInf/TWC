#!/usr/bin/env raku


# The current time in minutes.
my $time = 0;

# The counted minutes of darkness from 00:00 till $time.
my $time_off = 0;

# Minutes of darkness after the last guest checked out.
my $time_last = 24 * 60;

for 'guest-book.txt'.IO.lines -> $line {
    my $rs = $line ~~ /(\d+)\:(\d+)\D+(\d+)\:(\d+)/;
    my $start = 60 * Int($rs[0]) + Int($rs[1]);
    my $end = 60 * Int($rs[2]) + Int($rs[3]);

    if ($time < $start) {
        $time_off += $start - $time;
    }

    $time = $end;
    $time_last = 24 * 60 - $end;
}

$time_off += $time_last;
my $time_on = 24 * 60 - $time_off;

say "The light was on for $time_on minutes";
