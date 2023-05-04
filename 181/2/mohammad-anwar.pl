#!/usr/bin/env perl
use v5.36;

use v5.36;

my $IN = 'temperature.txt';
open (my $FILE, "<", $IN) or die "$!\n";
my @data = <$FILE>;
close $FILE;

my %day_temp = map {
    chomp;
    my ($k, $v) = split /\,/;
    $k => $v+0;
} @data;

my $previous_day_temp;
foreach my $date (sort { $a cmp $b } keys %day_temp) {
    !defined $previous_day_temp
    and $previous_day_temp = $day_temp{$date}
    and next;
    if ($day_temp{$date} > $previous_day_temp) {
        say $date;
    }
    $previous_day_temp = $day_temp{$date};
}
