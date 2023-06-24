#!/usr/bin/env perl
use v5.36;

sub ShrR { my @rtez = @_;my $dest = pop(@rtez);my $srce = pop(@rtez);my $cmar = '';my @srte = ();my @xrtz = ([],[],[]);my %nodz = ();my $ncnt = 0;my $dpth = 2;
  for   (@rtez) { $cmar .= '[' . join(',', @{$_}) . '], '; }
  printf("routes:%-34ssource:$srce, destination:$dest => ", $cmar);
  for   (@rtez) { # make hash of all nodes to determine maximum node count
    for my      $node (   @{$_}  ) { $nodz{$node} = 1; } }
  $ncnt = scalar( keys(%nodz) );
  for          (@rtez) { # find all 2-depth routes from source first
    for my      $nndx (0..@{$_}-1) {
      if       ($_->[$nndx] == $srce) {
        if     ($nndx            ) { push(@{$xrtz[$dpth]},       $srce . ',' . $_->[$nndx - 1]); }
        if     ($nndx <   @{$_}-1) { push(@{$xrtz[$dpth]},       $srce . ',' . $_->[$nndx + 1]); } } } }
  while (++$dpth <= $ncnt) { # iteratively deepen search up to: node count
    for   my $path (@{$xrtz[$dpth-1]}) { next unless(length($path));my $bgin = $path;$bgin =~ s/,(\d+)$//;my $ennd = $1;
      for      (@rtez) {
        for my  $nndx (0..@{$_}-1) {
          if   ($_->[$nndx] == $ennd) { # could be made faster by not re-adding nodes already visited earlier in path
            if ($nndx            ) { push(@{$xrtz[$dpth]},       $path . ',' . $_->[$nndx - 1]);#say $xrtz[$dpth][-1];
              if ($_->[$nndx - 1] == $dest) { @srte = split(/,/, $path . ',' . $_->[$nndx - 1]);last; } }
            if ($nndx <   @{$_}-1) { push(@{$xrtz[$dpth]},       $path . ',' . $_->[$nndx + 1]);#say $xrtz[$dpth][-1];
              if ($_->[$nndx + 1] == $dest) { @srte = split(/,/, $path . ',' . $_->[$nndx + 1]);last; } } }
        }; last if(@srte);
      };   last if(@srte);
    };     last if(@srte); }
  if    (@srte) { say '(' . join(',', @srte) . ');';return(@srte); }
  else          { say '-1;';                        return(   -1); }
}
if    (@ARGV) {   say 'Please use function interface in code rather than passing command-line parameters of routes, source, and destination!';
# ShrR(@ARGV);
} else {
  ShrR([1,2,6], [5,6,7],                 1, 7); # => (1,2,6,7);
  ShrR([1,2,3], [4,5,6],                 2, 5); # => -1;
  ShrR([1,2,3], [4,5,6], [3,8,9], [7,8], 1, 7); # => (1,2,3,8,7);
  ShrR([1,2,3], [4,5,6], [6,8,9], [3,4], 1, 9); # => (1,2,3,4,5,6,8,9);
  ShrR([1,2,3], [4,5,6], [6,8,9], [3,4], 9, 1); # => (9,8,6,5,4,3,2,1);
}
