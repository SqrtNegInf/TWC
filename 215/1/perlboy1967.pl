#!/usr/bin/env perl

use v5.16;

use common::sense;

use Test::More;

sub oddOneOut {
  grep { $_ ne join '',sort split //,$_ } @_;
}

is(oddOneOut('abc','xyz','tsu'),1);
is(oddOneOut('rat','cab','dad'),3);
is(oddOneOut('x','y','z'),0);
is(oddOneOut('cd','add','loop'),0);

done_testing;
