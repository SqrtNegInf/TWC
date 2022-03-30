#!/usr/bin/env perl

use strict;
use warnings;
use feature qw[say signatures];
no warnings 'experimental::signatures';

use List::Util qw[min max];

my @ARGV= (2,1,4,1,2,5);
say plot_hist(@ARGV);

say count_water(@ARGV);

sub plot_hist(@data) {
  my $max = max @data;
  my $hist = "\n";

  for (1 .. $max) {
    my $level = $max - $_ + 1;
    $hist .= $level;
    $hist .= +($_ >= $level) ? ' #' : '  ' for @data;
    $hist .= "\n";
  }

  $hist .= join ' ', ('-') x (@data + 1);
  $hist .= "\n";
  $hist .= join ' ', (' ', @data);
  $hist .= "\n";

  return $hist;
}

sub count_water(@data) {
  my $water;

  for (1 .. $#data - 1) {
    $water += get_dip_size($_, @data);
  }

  return $water;
}

sub get_dip_size($idx, @data) {
  my $l_max = max(@data[0 .. $idx]) - $data[$idx];
  my $r_max = max(@data[$idx .. $#data]) - $data[$idx];

  return min($l_max, $r_max);
}
