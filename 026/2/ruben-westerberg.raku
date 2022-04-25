#!/usr/bin/env raku

my @angles=@*ARGS??@*ARGS!!(180,270,360);
print "Average of [ @angles[] ] is: ";
my $avgCos= ( [+] @angles.map({($_*pi/180).cos}))/@angles;
my $avgSin= ( [+] @angles.map({($_*pi/180).sin}))/@angles;
my $avg=atan2($avgSin,$avgCos)*180/pi;
$avg+=360 if $avg < 0;
put $avg;
