#!/usr/bin/env raku

use Test;

# Fix the malformed time to the latest time possible.
sub extra( Str:D $t --> Str ) {
    my $i = tick-tock( $t) ;
    return $t.subst( /'?'/, $i );
}

# Return the digit which makes the string the latest time possible.
sub tick-tock( Str:D $t --> Int ) {
    my $s;
    given $t {
        when m/ '?' \d ':' \d \d / {
            $s = $t.substr( 1,1 ).Int;
            when $s == 4 and $t.substr(3).Int == 0 { return 2 }
            when $s > 3 { return 1 }
            when $s ≤ 3 { return 2 }
        }
        when m/ \d '?' ':' \d \d / {
            $s = $t.substr( 0,1 ).Int;
            when $s ≠ 2 { return 9 }
            when $s == 2 and $t.substr(3).Int == 0 { return 4 }
            return 3;
        }
        when m/ \d \d ':' '?' \d / { return 5; }
        when m/ \d \d ':' \d '?' / { return 9; }

        default { die 'Input is not broken correctly'; }
    }
}

#multi MAIN ( 'test') {
    my @Test =
        { in =>  '?0:00',  exp => '20:00', },
        { in =>  '?3:00',  exp => '23:00', },
        { in =>  '?4:00',  exp => '24:00', },
        { in =>  '?4:01',  exp => '14:01', },
        { in =>  '?5:00',  exp => '15:00', },
        { in =>  '0?:00',  exp => '09:00', },
        { in =>  '1?:00',  exp => '19:00', },
        { in =>  '2?:00',  exp => '24:00', },
        { in =>  '2?:09',  exp => '23:09', },
        { in =>  '23:?0',  exp => '23:50', },
        { in =>  '23:0?',  exp => '23:09', },
    ;
    my @die = '?3:0?',;

    plan 1 + @Test;
    for @die -> $s {
        dies-ok { tick-tock( $s ) }, 'Dies on malformed input.';
    }
    for @Test -> %t {
        is extra( %t<in>), %t<exp>, " %t<in> -> %t<exp>";
    }
    done-testing;
    exit;
#}

#multi MAIN( Str $in = "?4:01") {
#say "Input: \$time = '?4:01'
#Output: ", tick-tock($in);
#}


