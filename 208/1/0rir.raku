#!/usr/bin/env raku

use Test;

my @Test =
    ( (),               (),                     (),         ),
    ( < i >,            (),                     (),         ),
    ( (),               < i >,                  (),         ),
    ( < A B C>,         < D E F >,              (),         ),
    ( < P R L P P>,     < R P H >,              < P R>,     ),
    ( < P R L P P>,     < R P H >,              < P R>,     ),
    ( < P R L P P>,     < X X X R P H>,         < P R>,     ),
    ( < P R L    >,     < R P H >,              < P R>,     ),
    ( < a a a    >,     < a a a >,              < a >,      ),
    ( < y y a b c>,     < z z z z c b a >,      < a b c >,  ),
    ( < y y a y b c>,   < z z z z b c a >,      < a b >,    ),
    ( < y c a y b y>,   < z z z z b z a c >,    < a b c >,  ),
;
plan +@Test;

sub min-sum-match( $l, $r --> List ) {
    my $common = $l ∩ $r;
    my ($a, $b, %c, $return);
    for $l, $a, $r, $b -> $o, $d is rw {
        my $i = 0;
        my %seen;
        $d = @$o.map({
                if %seen{$_}:exists or $_ ∉ $common {
                    $i++;
                    Empty;
                } else {
                    %seen{$_}++;
                    ($_ => $i++);
                }
        }).sort( *.key).Array;
    }
    %c.append: @$a;
    for @$b -> (:key($k), :value($v)) {
        %c{$k} += $v;
    }
    my $min = %c.values.min;
    %c.keys.map: {
                 %c{$_} == $min
                 ?? ($return.push($_); Empty )
                 !! Empty };
    $return.sort.List; 
}

for @Test -> ( $l, $r, $exp) {
    quietly is min-sum-match($l,$r), $exp,
                        "$l.raku() $r.raku() -> $exp.raku()";
}
done-testing;

my @list1 = @Test[*-1][0];
my @list2 = @Test[*-1][1];
say "\nInput: @list1 = @list1[]\n       @list2 = @list2[]";
say   "Output:  &min-sum-match( @list1, @list2)";
