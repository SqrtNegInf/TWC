#!/usr/bin/env raku

#| Expand braces (nesting NYI)
sub MAIN (
  @phrase = <Perl {Daily,Weekly,Monthly,Yearly} Challenge>,
) {
  given @phrase.join: ' ' -> $str {
    given $str.match: /^ ( .*? ) '{' ( .* ) '}' ( .*? ) $/ {
      when .[1].so {
        for .[1].split: ',' -> $split {
          "$_[0]$split$_[2]".say;
        }
      }
      default { $str.say }
    }
  }
}
