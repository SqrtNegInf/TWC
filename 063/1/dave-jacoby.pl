#!/usr/bin/env perl
use v5.36;

use Getopt::Long;
use Carp;

say last_word();
say last_word( '  hello world',                qr/[ea]l/ ) || 'undef'; # 'hello'
say last_word( "Don't match too much, Chet!",  qr/ch.t/i ) || 'undef'; # 'Chet!'
say last_word( "spaces in regexp won't match", qr/in re/ ) || 'undef'; #  undef
say last_word( join( ' ', 1 .. 1e6 ), qr/^(3.*?){3}/ ) || 'undef';    # '399933'

sub last_word ( $string = ' strang string', $regex = qr/\w/ ) {
    my ($output) =
      reverse
      grep { /$regex/ }
      grep { /\S/ }
      split /\s+/, $string;
    return $output;
}
