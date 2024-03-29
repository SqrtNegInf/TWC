#!/usr/bin/env perl
use v5.36;

use List::Util qw<reduce>;
use Math::Trig;

my @angles= @ARGV?@ARGV:(180,270,360);
print "Average of angles [ @angles ] is: ";
my $avgCos= (reduce {$a+$b} map {cos $_ * pi/180} @angles)/@angles;
my $avgSin= (reduce {$a+$b} map {sin  $_ * pi/180} @angles)/@angles;
my $avg=atan2($avgSin, $avgCos)*180/pi;
$avg+=360 if $avg <0;
print "$avg\n";

