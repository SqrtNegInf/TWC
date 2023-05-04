#!/usr/bin/env perl
use v5.36; # use new bit-wise operator

use Test::More;

my @TESTS = (
  [ [qw(/a/b/c/1/x.pl /a/b/c/d/e/2/x.pl /a/b/c/d/3/x.pl /a/b/c/4/x.pl /a/b/c/d/5/x.pl)], '/a/b/c' ],
  [ [qw(/a/b/a.txt /a/b/c/d/e/q.txt /a/b/c.txt)], '/a/b' ],
  [ [qw(a/b/a.txt a/b/c/d/e/q.txt a/b/c.txt)], 'a/b' ],
  [ [qw(ab.txt ac.txt)], '' ],
  [ [qw(a ab/q.txt)], '' ],
  [ [qw(ab ab/q.txt)], '' ],
  [ [qw(/ab /ab/q.txt)], '' ],
  [ [qw(ab/ ab/q.txt)], 'ab' ],
  [ [qw(/a/b.txt /c/d.txt)], '' ],
  [ [qw(/a/q.txt)], '/a' ],
  [ [qw(/aa/q.txt /ab/q.txt)], '' ],
  [ [qw(/z/aa/q.txt /z/ab/q.txt)], '/z' ],
);

is( common_path(@{$_->[0]}), $_->[1] ) foreach @TESTS;

done_testing();

sub common_path {
  my $l = shift;
  ## Compute the common string....
  $l = substr $l, 0, length( (($_ ^. $l) =~ m{^(\0+)})[0]) for @_;
  ## Remove the trailing "/"s
  $l=~m{/} ? substr $l, 0, rindex $l, '/' : ''
}

