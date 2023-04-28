#!/usr/bin/env perl
use v5.36;
use Test::More;

my @TESTS = (
  [ [2,5,8,1                         ], 2 ],
  [ [3                               ], 0 ],
  [ [1..9,21..25, map { 2*$_ } 5..10 ], 5 ],
  [ [(1) x 10                        ], 9 ],
  [ [ 1..10                          ], 9 ],
  [ [ 2.9 , 3..10                    ], 7],
  [ [ 1..8,8.1                       ], 7],
  [ [ 1, 3..10                       ], 1 ],
  [ [ 1..8, 10                       ], 1 ],
  [ [ 1..999, 1001                   ], 1 ],
  [ [ 1..999, 999.1                  ], 998 ],
);

is( max_gap_sort(    @{$_->[0]} ), $_->[1] ) for @TESTS;
is( max_gap_nosort(  @{$_->[0]} ), $_->[1] ) for @TESTS;
is( max_gap_nosort_faster(  @{$_->[0]} ), $_->[1] ) for @TESTS;
done_testing();

sub max_gap_sort {
  return 0 unless $#_;
  @_ = sort { $a <=> $b } @_;
  my $p = shift;
  @_ = sort { $b <=> $a } map { ($_-$p,$p=$_)[0] } @_;
  $_[0]==$_[$_] || return $_ for 1..$#_;
  1*@_
}

sub max_gap_nosort {
  return 0 unless $#_;
  @_ = sort { $a <=> $b } @_;
  my($p,$b,$c)=(shift,0,0);
  $_-$p>$b ? ($b,$c)=($_-$p,1) : $_-$p==$b && $c++, $p=$_ for @_;
  $c;
}

sub max_gap_nosort_faster {
  return 0 unless $#_;
  my($p,$t,$c) = ($_[0]+1,0,0);
  $_-$p>$t ? ($t,$c)=($_-$p,1) : $_-$p==$t && $c++, $p=$_ for sort { $a<=>$b } @_;
  $c;
}

