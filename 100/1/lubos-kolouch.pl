#!/usr/bin/env perl
use v5.36;

use DateTime::Format::DateParse;

sub convert_time {
    my $what = shift;

    my $pattern = $what =~ /m/ ? '%H:%M' : '%I:%M %P';

    return DateTime::Format::DateParse
        -> parse_datetime($what)
        -> strftime($pattern);

}

use Test::More;

is(convert_time('05:15pm'), '17:15');
is(convert_time('05:15 pm'), '17:15');
is(convert_time('19:15'), '07:15 pm');

done_testing;
