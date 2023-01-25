#!/usr/bin/env raku

use v6;
#my $d8VS='N1ILKwXF';
sub Seg7 {my $iint=@_.shift;my Str @tout[7];
  my  @trth = <abcdef bc abdeg abcdg bcfg acdfg acdefg abc abcdefg abcfg>;
  my  @digz = split('',$iint, :skip-empty);
  for 0..@digz.elems-1 -> $dndx { my $dtru=@trth[@digz[$dndx]];
    my Str @char[7]=((' ' x 8) xx 7);
    if ($dtru ~~ /a/) { @char[0].substr-rw(0,7) = '-' x 7; }
    if ($dtru ~~ /b/) { @char[1].substr-rw(6,1) = '|'; @char[2].substr-rw(6,1) = '|'; }
    if ($dtru ~~ /c/) { @char[4].substr-rw(6,1) = '|'; @char[5].substr-rw(6,1) = '|'; }
    if ($dtru ~~ /d/) { @char[6].substr-rw(0,7) = '-' x 7; }
    if ($dtru ~~ /e/) { @char[4].substr-rw(0,1) = '|'; @char[5].substr-rw(0,1) = '|'; }
    if ($dtru ~~ /f/) { @char[1].substr-rw(0,1) = '|'; @char[2].substr-rw(0,1) = '|'; }
    if ($dtru ~~ /g/) { @char[3].substr-rw(0,7) = '-' x 7; }
    for 0..6 -> $line { @tout[$line] ~= @char[$line]; }
  }
  say join("\n",@tout);
  return($iint);
}
if    (@*ARGS) {
  Seg7(@*ARGS);
} else {
  Seg7(  200 );
  Seg7(765432);
}
