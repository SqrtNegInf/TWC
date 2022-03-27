#!/usr/bin/env raku

sub MAIN ( Str:D $string = 'Markmið lífs okkar er að vera hamingjusöm' --> Nil ) {
  given $string.comb(/\S+/) {
    when * < 3 {
      say 'Fewer than 3 words given.';
      exit 1;
    }

    .[1..*-2].join.chars.say;
  }
}
