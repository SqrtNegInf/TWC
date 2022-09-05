#!/usr/bin/env perl6
## https://gfldex.wordpress.com/2022/09/04/assuming-optionality/
#    2022-09-05

for ‘Perl Weekly Challenge’, ‘Long Live Perl’ -> $str {
    my &unique-char = { (once $str.comb.BagHash»--){$_}:!exists }
    say $str.comb.first: &unique-char;
}
