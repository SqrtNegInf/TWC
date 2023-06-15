#!/usr/bin/env perl
use v5.36;

use DateTime;
use Test::More tests => 7;
use Test::Exception;

ok( find_date(2230120) eq "1923-01-20", "finds date" );
ok( find_date(1230120) eq "2023-01-20", "finds date" );
dies_ok { find_date(22301201) } "dies, number too long";
dies_ok { find_date(230120) } "dies, number too short";
dies_ok { find_date(3230120) } "dies, rule 1";
dies_ok { find_date(2232120) } "dies, rule 2";
dies_ok { find_date(2230140) } "dies, rule 3";

sub find_date {
    my $number = shift;
    my ($first, $second,  $third, $forth, $fifth,
        $sixth, $seventh, $dt,    $year
    );
    die "Not a valid date: $number, stopped"
        unless (
        $number =~ /^(\d{1})(\d{1})(\d{1})(\d{1})(\d{1})(\d{1})(\d{1})$/ );
    $first   = $1;
    $second  = $2;
    $third   = $3;
    $forth   = $4;
    $fifth   = $5;
    $sixth   = $6;
    $seventh = $7;
    die "Not a valid date: $number, stopped"
        unless ( $first == 1 || $first == 2 );
    $year = $first == 1 ? 20 : 19;
    $dt = DateTime->new(
        year  => "$year$second$third",
        month => "$forth$fifth",
        day   => "$sixth$seventh",
    );
    return $dt->ymd;
}
