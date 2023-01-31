#!/usr/bin/env raku

sub MNum {my @aray=@_;my @mnmz=();my %hash=();
  print '(' ~ sprintf("%-5s",join(',',@aray)) ~ ') => (';%hash{$_}=1 for @aray;
  for     0..@aray.elems {@mnmz.push($_) unless %hash{$_}:exists;}
  say join(',',@mnmz) ~ ');';
  return       @mnmz;
}

if    (@*ARGS) {
  MNum(@*ARGS);
} else {
  MNum(0,1,3); # => 2
  MNum(0,1  ); # => 2
}
