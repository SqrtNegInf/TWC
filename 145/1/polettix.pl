#!/usr/bin/env perl
use v5.36;

my $v = Vector->new(1, 2, 3);
my $w = Vector->new(4, 5, 6);
say $v . $w;

package Vector;
use overload
   '.' => sub ($v, $w, @rest) {
      die "size mismatch\n" unless $v->$#* == $w->$#*;
      my $dp = 0;
      $dp += $v->[$_] * $w->[$_] for 0 .. $v->$#*;
      return $dp;
   };

sub new ($package, @a) { bless \@a, $package }
