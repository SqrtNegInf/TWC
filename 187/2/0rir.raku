#!/usr/bin/env raku

#use lib $?FILE.IO.parent(2).add("lib");
use Test;

#multi MAIN ( $t where * = < T t>.any ) {
    my @Test =
        { in =>  (1, 2, 3, 2),  exp => (3, 2, 2), },
        { in =>  (1, 3, 2),     exp => (), },
        { in =>  (1, 1, 2, 3),  exp => (), },
        { in => (2, 4, 3),      exp => (4, 3, 2), },
        { in => (1, 2, 3, 1, 2, 3, 7, 9, 10, 5, 10 ),
                                exp => ( 10, 10, 9), },
    ;
    plan 1 + @Test.elems;

    dies-ok { magical-triplet(|1,2) }, 'two elem list';
    for @Test -> %t {
        is magical-triplet( %t<in>), %t<exp>, "%t<in> -->  %t<exp>";
    }
    done-testing;
#}

sub magical-triplet( List $a where +* > 2 --> List ) {

    my $candi = $a.combinations(3).grep( {
        my (\a, \b, \c) := $_[0,1,2];
        (a + b > c) and (b + c > a) and (a + c > b)
        }
    ).List;
    return () if $candi eqv ();
    ( max( @$candi, :by( { [+] @$_}))  ).sort({$^b cmp $^a}).List;
}

#multi MAIN( List $n = (1, 2, 3, 1, 2, 3, 7, 9, 10, 5, 10 ) ) {
#    say "    Input: \$n = $n;
#    Output: ", magical-triplet($n);
#}

