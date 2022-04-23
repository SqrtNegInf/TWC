#!/usr/bin/env raku

use Lingua::EN::Numbers;

sub MAIN ( Int $n is copy = 5) {
  print "Input: \$n = $n\n";

  while ( $n != 4 ) {
    my $n_len = cardinal($n).chars;
    print tclc(cardinal($n)) ~ " is " ~ tclc(cardinal($n_len)) ~ ", ";
    $n = $n_len;
  }

  say "Four is magic.";
}
