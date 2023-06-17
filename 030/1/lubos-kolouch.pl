#!/usr/bin/env perl
use v5.36;

use DateTime;

sub is_sunday_date {
    my $year = shift;
    my $dt=DateTime->new(
        year => $year,
        month => 12,
        day => 25,);

    $dt->day_of_week == 7 ?1:0;
}

sub main {

    for (2019..2100) {
        say "25.12.$_" if is_sunday_date($_);
    }
}

main;

# TESTS

use Test::More;

is (is_sunday_date(2022),1,'Test for 2022');
is (is_sunday_date(2021),0,'Test for 2022');
done_testing;

