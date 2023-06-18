#!/usr/bin/env perl
use v5.36;

my $pi=3.1415926535;

my ($s,$c,$n)=(0,0,0);
foreach my $angle ( (180,270,360) )  {
  my $aa=$angle*$pi/180;
  $s+=sin($aa);
  $c+=cos($aa);
  $n++;
}
my $oa=atan2($s/$n,$c/$n);
print $oa*180/$pi,"\n";
