#!/usr/bin/env perl
use v5.36;

use List::MoreUtils qw(slide);
use Test::More;


sub oddString {
  state $c = {map { ($_, ord($_) - ord('a')) } 'a' .. 'z'};

  my (%h,%freq,@k);

  for (@_) {
    no warnings 'once';
    my $k = join('|',slide { $c->{$b} - $c->{$a}} split //); 

    $h{$k} = $_;
    $freq{$k}++;
  }

  @k = grep { $freq{$_} == 1 } keys %h;

  return $h{$k[0]} if (scalar(@k) == 1);
}


is(oddString("adc", "wzy", "abc"),'abc', 'abc');
is(oddString("aaa", "bob", "ccc", "ddd"), 'bob', 'bob');
is(oddString("abcd", "bcde", "cdef", "defh"), 'defh', 'defh');

done_testing;
