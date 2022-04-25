#!/usr/bin/env raku

my ($s,$c,$n)=(0,0,0);
for (180,270,360) -> $angle {
  my $aa=$angle*pi/180;
  $s+=sin($aa);
  $c+=cos($aa);
  $n++;
}
my $oa=atan2($s/$n,$c/$n);
say $oa*180/pi;
