#!/usr/bin/env raku

use lib $?FILE.IO.dirname;
use RomanNumerals;

say to-roman(56);

=finish
proto MAIN (|) {
  {*}
  CATCH {
    when X::RomanNumerals {
      say "Error:\n  {.message}\n\n" ~ $*USAGE;
    }
  }
}

#multi MAIN (
#  IntStr() $number, #= A positive integer.
#  --> Nil
#) {
  say to-roman($number);
#}

multi MAIN (
  Str() $roman-numerals, #= A string of roman numerals.
  --> Nil
) {
  given from-roman($roman-numerals) -> $result {
    say $result ~ " (did you mean $_?)" x ($roman-numerals.uc ne $_) given to-roman($result);
  }
}
