#!/usr/bin/env raku
use Test;

multi max-gte-allx2 ( @a where * === List ) { die 'What am I doing?' }
multi max-gte-allx2 ( @a where * ~~ Empty --> Bool ) { Bool }
multi max-gte-allx2 ( @a where *.elems == 1 --> Bool ) { True }
multi max-gte-allx2 ( @a --> Bool ) {
    my $max = @a.max/2;
    1 == @a.grep( * > $max);
}

#multi MAIN ( $t where * = < T t>.any ) {
    my @Test =  { in => (1,2,3,4), exp => False, },
                { in => (1,2,0,5), exp => True,  },
                { in => (2,6,3,1), exp => True,  },
                { in => (4,5,2,3), exp => False, },
                { in => (3,),      exp => True,  },
    ;
    plan 2 + @Test;

    is  max-gte-allx2( ()), Bool, "Empty --> " ~ 'Bool type object';

    for @Test -> %t {
        is  max-gte-allx2( %t<in>), %t<exp> > 0, "%t<in>.raku() --> %t<exp>";
    }
    dies-ok  { max-gte-allx2( List) }, "List type object dies";

    done-testing;
#}

=finish 
multi MAIN( $list = (2,6,3,1) ) {
        { in => (2,6,3,1),  exp => -1, },
    # XXX
    say "Input: @list = $list.raku()\n"
       ~"Output: ", max-gte-allx2( $list) ?? 1 !! -1;
}

