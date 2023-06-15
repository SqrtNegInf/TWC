#!/usr/bin/env perl
use v5.36;

use Date::Calc qw(check_date);

my $input = shift;
$input ||= 2230120;

# check input for any errors, ie numbers outside legal ranges
my $error;
my ($d1,$d2,$d3,$d4,$d5,$d6,$d7) = split(//,$input);
$error .= "First digits must be 1 or 2\n" unless $d1 =~ m/1|2/;
my $month = "$d4$d5";
$error .= "Digits four and five must be a valid month 01..12\n" unless ($month >= 01 and $month <= 12);
my $day = "$d6$d7";
$error .= "Digits six and seven must be a valid calendar day 01..31\n" unless ($day >= 01 and $day <= 31);
usage($error) if ($error);

my $year = ($d1 == 1) ? "19" : "20";
$year = $year . $d2 . $d3;

# if we made it here, ranges are legit, so check if date is valid, eg Feb 29th on non-leap year or 31 days in month with only 30 
if (check_date($year,$month,$day)) {
	say "$year-$month-$day";
}
else {
	say "Date $year-$month-$day is invalid";
}
