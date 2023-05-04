#!/usr/bin/env perl

use v5.36;

use Test::More;
use Test::Deep qw(cmp_deeply);


sub maskcode {
  state $re = '([^0-9a-z]*)([0-9a-z])' x 4;
  my @r;
  for (@_) {
    push(@r,s/(?i)^$re/$1x$3x$5x$7x/or);
  }
  @r;
}

   
cmp_deeply([maskcode('ab-cde-123', '123.abc.420', '3abc-0010.xy')],
           ['xx-xxe-123', 'xxx.xbc.420', 'xxxx-0010.xy']);
cmp_deeply([maskcode('1234567.a', 'a-1234-bc', 'a.b.c.d.e.f')],
           ['xxxx567.a', 'x-xxx4-bc', 'x.x.x.x.e.f']);

done_testing;
