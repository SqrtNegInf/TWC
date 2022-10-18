#!/usr/bin/env perl
use strict;
use warnings;
use utf8;
use Unicode::Normalize; # 'NKFD'
use Encode 'encode';

sub makeover {
  my $str = shift;

  return encode( 'ascii', NFKD($str), sub {q{}} );
}

use Test::More;

is makeover('ÃÊÍÒÙ'), 'AEIOU', 'first example';
is makeover('âÊíÒÙ'), 'aEiOU', 'second example';

done_testing;
