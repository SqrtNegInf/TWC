#!/usr/bin/env perl
use v5.36;

my $S="perlweeklychallenge";
my @W = ("weekly", "challenge", "perl");

my $sl=length($S);

my @l;
my $done=0;

while (!$done) {
  my $c=[];
  if (@l) {
    $c=shift @l;
  }
  my $cc=join('',@{$c});
  foreach my $wc (@W) {
    my $ccw=$cc.$wc;
    my $ccwl=length($ccw);
    if ($ccwl <= $sl) {
      if (index($S,$ccw)==0) {
        push @l,[@{$c},$wc];
        if ($ccwl == $sl) {
          $done=1;
          last;
        }
      }
    }
  }
  unless (@l) {
    last;
  }
}

if (@l) {
  print join(', ',map {'"' . $_ . '"'} @{$l[-1]}),"\n";
} else {
  print "0\n";
}
