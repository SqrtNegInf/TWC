#!/usr/bin/env perl
use v5.36;

while (<DATA>) {
    say /^[-+]?([0-9]*)([0-9]{3})([0-9]*)$
        (??{length ($1) == length ($3) ? "" : "(*FAIL)"})/x
                                  ? $2
      : /^[-+]?[0-9]*[^0-9].*\n/  ? "not an integer"
      : /^[-+]?(?:[0-9][0-9])*\n/ ? "even number of digits"
      :                             "too short"
}

__END__
1
1234
1234567
