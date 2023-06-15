#!/usr/bin/env perl
use v5.36;

use DateTime;

my $input = 2230120;
$input =~ /^([12])(\d\d)([01]\d)([0-3]\d)$/ or die "malformed input\n";
my($year_msb, $year_lsb, $month, $day) = ($1, $2, $3, $4);
my $year = ($year_msb==1 ? 2000 : 1900)+$year_lsb;
$month>=1 && $month<=12 or die "malformed month\n";
my $dt = DateTime->new(year => $year, month => $month, day => 1);
$day>=1 && $day<=$dt->month_length or die "malformed day\n";
$dt = DateTime->new(year => $year, month => $month, day => $day);
say $dt->strftime("%Y-%m-%d");
