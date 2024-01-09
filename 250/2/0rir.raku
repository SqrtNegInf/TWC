#!/usr/bin/env raku

use Test;

my @Test =
    ("001", "1", "000", "0001"),                1,
    ("perl", "2", "000", "python", "r4ku"),     6,
    ("perl", "200", "000", "python", "r4ku"),   200,
    ("me", "1", "001"),                         2,
;
my @Die =
    (),
    (""),
    ("", ""),
    ( "" xx 10).List,
;

plan @Die + @Test ÷ 2;

multi func( $a where * ~~ Empty ) { die "Empty list." }
multi func( $a where * eqv '' ) { die "Empty string." }
multi func( $a --> Int) {
    # my $r = ($a».&{ $_ ~~ / ^ \d+ $ / ?? .Int !! .chars }).max;
    # $r == -Inf ?? Int !! $r;
    my $r
        = ( $a».&{
            when / ^ <:L>+  $ /     { .chars }
            when / ^ <:Nd>+ $ /     { given .Int {
                                        when -Inf { Int } 
                                        $_;
                                    }
            }
            when  '' { die "Empty string." }
        }).max;
}

for @Test -> $in, $exp {
    is func($in), $exp, ($exp // "(Int)") ~ " <- $in";
}
for @Die -> $in {
    dies-ok { func($in) }, "Dies with: $in.raku()";
}

done-testing;
my @alphanumstr = ("perl", "2", "000", "python", "r4ku");

say "\nInput: @alphanumstr = @alphanumstr.raku()\nOutput: ",
        &func( @alphanumstr);
