#!/usr/bin/env raku

use Test;

my @Test =
    #  in-a           in-b                result             result-lc
    'Mango is sweet', 'Mango is sour',    ('sweet', 'sour'), ('sweet', 'sour'),
    'Mango Mango',    'Orange',           ('Orange',),       ('orange',),
    'Mango is Mango', 'Orange is Orange', ('',),             ('',),
    '',               '',                 ('',),             ('',),
;
plan @Test ÷ 2;

# ignore case by using .lc
multi once-words( Bool :$lc!, *@word-text -->List) {
    (@word-text.words».lc).Bag.grep( *.value == 1)».key;
}
# case sensitive
multi once-words( *@word-text -->List) {
    @word-text.words.Bag.grep( *.value == 1)».key;
}

for @Test -> $l1, $l2, @exp, @lc {
    is once-words(      $l1, $l2).sort, @exp.sort, "@exp[] <- $l1 / $l2";
    is once-words( :lc, $l1, $l2).sort, @lc.sort,   "@lc[] <- $l1 / $l2";
}

done-testing;

my $line1 = 'Ripe mango is sweet';
my $line2 = 'New mango is sour';
say "\nInput: \$line1 = '$line1'\n"
    ~ "       \$line2 = '$line2'\nOutput: ", 
  $ =  (once-words( $line1, $line2)».&( "'" ~ * ~ "'")) ~~ Empty
    ?? "('')"
    !! (once-words( $line1, $line2)».&( "'" ~ * ~ "'"));

