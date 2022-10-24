#!/usr/bin/env raku

use Test;

is 4, days-together <12-01 20-01>, <15-01 18-01>;
is 0, days-together <02-03 12-03>, <13-03 14-03>;
is 2, days-together <02-03 12-03>, <11-03 15-03>;
is 4, days-together <30-03 05-04>, <28-03 02-04>;

done-testing;

my sub day-number(Str $_) {
    fail unless /(\d**2)\-(\d**2)/;
    Date.new(2001, $/[1], $/[0]) - Date.new(2001, 1, 1)
}
sub days-together(@foo, @bar) {
    my Set() $range-foo = Range.new: |(@foo.map: &day-number);
    my Set() $range-bar = Range.new: |(@bar.map: &day-number);
    elems $range-foo ∩ $range-bar
}

