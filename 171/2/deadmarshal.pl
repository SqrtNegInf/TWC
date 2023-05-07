#!/usr/bin/env perl
use v5.36;

my $f = sub{shift() + 2};
my $g = sub{shift() * 2};

sub compose{
  my ($f, $g) = @_;
  sub {
    $f->($g->(shift()));
  }
}

print compose($f, $g)->(5);
