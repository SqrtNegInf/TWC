#!/usr/bin/env raku

my @words = ("Perl", "TPF", "PyThon", "raku");

for (@words) -> $s {

  say "Input: \$s = \'$s'";

  if ($s ~~ /^<:Lu><:Ll>*$/) {

    say "Output: 1";

  } elsif ( $s ~~ /^<:Ll>*$/) {

    say "Output: 2";

  } elsif ($s ~~ /^<:Lu>*$/) {

    say "Output: 3";

  } else {

    say "Output: 0";

  }

  say " ";

}
