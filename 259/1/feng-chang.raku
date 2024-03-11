#!/usr/bin/env raku

subset DateStr of Str where *.Date;

#unit sub MAIN(DateStr:D $start, UInt:D $offset is copy, *@bank-holidays);
my $start = '2018-06-28';
my $offset = 1;

my $day = $start.Date;

while $offset {
    ++$day;
    next if $day.day-of-week == 6|7;
    #next if ~$day (elem) @bank-holidays;
    --$offset;
}

put $day;
