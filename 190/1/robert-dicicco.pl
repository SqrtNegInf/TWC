#!/usr/bin/env perl

use v5.36;

my @words = ("Perl", "TPF", "PyThon", "raku");



for my $s (@words) {

  print "Input: \$s = \'$s\'\n";

  if ($s =~ /^[A-Z][a-z]*$/) {

    print "Output: 1\n";

  } elsif ( $s =~ /^[a-z]*$/) {

    print "Output: 2\n";

  } elsif ( $s =~ /^[A-Z]*$/) {

    print "Output: 3\n";

  } else {

    print "Output: 0\n";

  }

  print "\n";

}



=begin pod

PS G:\Projects\Perl\Challenges> perl .\CapitalDetection.pl

Input: $s = 'Perl'

Output: 1



Input: $s = 'TPF'

Output: 3



Input: $s = 'PyThon'

Output: 0



Input: $s = 'raku'

Output: 2



=cut
