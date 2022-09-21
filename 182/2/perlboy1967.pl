#!/usr/bin/env perl

use v5.16;
use warnings;

use List::Util qw(uniq);
use List::MoreUtils qw(each_arrayref);

my @l = qw(
  /a/b/c/1/x.pl
  /a/b/c/d/e/2/x.pl
  /a/b/c/d/3/x.pl
  /a/b/c/4/x.pl
  /a/b/c/d/5/x.pl
);


sub commonPath (@) {

  my (@c,@s);

  my $ea = each_arrayref map{ [ split '/' ] } @_;
  while (@s = $ea->() and scalar uniq(@s) == 1) {
    push(@c,shift @s);
  }

  return (scalar @c ? join('/',@c) : '/');
}


say commonPath(@l);
