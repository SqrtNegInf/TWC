#!/usr/bin/env perl

use v5.32;

use common::sense;

use Test2::V0 -srand => 1;

use List::MoreUtils qw(pairwise);

sub sortLanguage (\@\@) {
  map { $_->[0] } 
    sort { $a->[1] <=> $b->[1] or $a->[0] cmp $b->[0] } 
      pairwise { [$a,$b] } @{$_[0]},@{$_[1]};
}

is([sortLanguage(@{[qw{Perl C Python}]},@{[2,1,3]})],
   [qw(C Perl Python)]);
is([sortLanguage(@{[qw{C++ Haskell Java}]},@{[1,3,2]})],
   [qw(C++ Java Haskell)]);
is([sortLanguage(@{[qw{C Basic Assembly}]},@{[1,1,1]})],
   [qw(Assembly Basic C)]);

done_testing;
