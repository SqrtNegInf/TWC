#!/usr/bin/env perl
use v5.36.0;
use strict;use warnings;use utf8;
sub Seg7 {my $iint=shift(@_);my @tout;
  my  @trth = qw<abcdef bc abdeg abcdg bcfg acdfg acdefg abc abcdefg abcfg>;
  my  @digz = split('',$iint);
  for my $digt (0..$#digz) { my $dtru=$trth[$digz[$digt]];
    my @char=();push(@char,' ' x 8) for (0..6);
    if ($dtru =~ /a/) { substr($char[0],0,7,'-' x 7); }
    if ($dtru =~ /b/) { substr($char[1],6,1,'|'); substr($char[2],6,1,'|'); }
    if ($dtru =~ /c/) { substr($char[4],6,1,'|'); substr($char[5],6,1,'|'); }
    if ($dtru =~ /d/) { substr($char[6],0,7,'-' x 7); }
    if ($dtru =~ /e/) { substr($char[4],0,1,'|'); substr($char[5],0,1,'|'); }
    if ($dtru =~ /f/) { substr($char[1],0,1,'|'); substr($char[2],0,1,'|'); }
    if ($dtru =~ /g/) { substr($char[3],0,7,'-' x 7); }
    for my $line (0..6) { $tout[$line] .= $char[$line]; }
  }
  say join("\n",@tout);
  return($iint);
}
if    (@ARGV) {
  Seg7(@ARGV);
} else {
  Seg7(  200 );
  Seg7(765432);
}
