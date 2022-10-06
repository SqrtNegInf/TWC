#!/usr/bin/env raku

use Test;

is-deeply sequence-number('ab1234', 'cd5678', 'ef1342'),
   ('001234', '015678', '021342'), 'Example 1';

is-deeply sequence-number('pq1122', 'rs3334'),
   ('001122', '013334'), 'Example 2';

done-testing;

sub sequence-number(+@list) {
    my $seq = 0;
    @list.map: { S/ ^ <:L>**2 /{ sprintf '%02d', $seq++ }/ }
}

