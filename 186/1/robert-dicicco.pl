#!/usr/bin/env perl

use strict;
use warnings;
use feature qw/say/;

my @a = qw/1 2 3/;
my @b = qw/a b c /;

sub zip {
  my $first = shift;
  my $second = shift;
  my @c;

  if (scalar(@a) != scalar(@b)){
    push(@c, -1);
  }

  for (my $x = 0; $x < scalar(@a); $x++ ) {
    push(@c,@$first[$x]);
    push(@c,@$second[$x]);
  }

  return(@c);
}

  my @d = zip(\@a,\@b);
  if ($d[0] == -1 ){
    say "Error: Uneven arrays";
    exit(1);
  }
  print "@d\n";
  @d = zip(\@b,\@a);
  print "@d\n";
