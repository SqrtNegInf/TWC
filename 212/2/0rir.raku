#!/usr/bin/env raku

use Test;

my @Test =
       #  part-size, list, exp
#dies    1, [,],                 Array,
    2, [1,2,3,4,5],         Array,
    3, [1,2,3,4,5],         Array,
    4, [1,2,3,4,5],         Array,
    6, [1,2,3,4,5],         Array,
    1, [1,2,3,4],           [[1,],[2,],[3,],[4,]],
    2, [1,3,9],             Array,
    2, [1,2],               [[1,2]],
    2, [1,2,2,3],           [[1,2],[2,3]],
    2, [1,2,3,4],           [[1,2],[3,4]],
    2, [1,2,8,9],           [[1,2],[8,9]],
    2, [1,2,2,3,9,9],       Array,

    5, [1,2,3,4,2,3,4,5,3,4,5,6,6,7,8,9,-9,-8,-7,-6,-1,0,1,2], Array,
    3, [1,2,3,4,2,3,4,5,3,4,5,6,6,7,8,9,-9,-8,-7,-6,-1,0,1,2], Array,
    4, [1,2,3,4,2,3,4,5,3,4,5,6,6,7,8,9,-9,-8,-7,-6,-1,0,1,2],
            [ [ -9,-8,-7,-6,], [ -1,0,1,2], [1,2,3,4],
              [2,3,4,5,],       [3,4,5,6,],  [6,7,8,9,], ],
    2, [1,2,3,4,2,3,4,5,3,4,5,6,6,7,8,9,-9,-8,-7,-6,-1,0,1,2],
            [ [ -9,-8,],[-7,-6,], [ -1,0,],[1,2], [1,2,],[3,4],
              [2,3,],[4,5,],       [3,4,],[5,6,],  [6,7,],[8,9,], ].sort,
    1, [1,2,3,4,2,3,4,5,3,4,5,6,6,7,8,9,-9,-8,-7,-6,-1,0,1,2],
            [ [ -9],[-8],[-7],[-6],[-1],[0],[1],[2],
              [1],[2],[3],[4],[2],[3],[4],[5],[3],
              [4],[5],[6],[6],[7],[8],[9], ].sort,
;

class All-seq {
    has Int @.in     is required;       # input
    has Int $.psize  is required;       # part size
    has Int @.val;                      # input stripped to unique
    has Int @.qty;                      # zip sister give qty of elem in @val
    has     @.result is rw = [];        # solution
    has Int $.cur    is rw = 0;         # current head of workspace

    method new( Int $psize, @in ) {
        ::?CLASS.Mu::new( in => @in, psize => $psize );
    }

    method process( -->Array) {
                # easy solves
        when not  +@!in %% $!psize {
            return Array;
        }
        when $!psize == 1 {
            @!in.=sort;
            return @!in.map( { @[0] = $_ }).Array;
        }
                # set up
        {
            my @tmp = @!in.Bag.sort;
            @!qty   = @tmp.map: *.value;
            @!val   = @tmp.map: *.key;
        }

        if parts() { return @!result }
        return Array;

        #---- not reached ----

        sub parts( -->Bool) {       # build @!result, return True if done
            loop {
                while 0 == @!qty[$!cur] and $!cur < +@!val - $!psize + 1 {
                    ++$!cur;
                }
                    # done?
                if $!cur > +@!val - $!psize {
                    if @!qty[$!cur..^@!val].any ≠ 0 {
                        return False;
                    }
                    return True;
                }
                    # slide window
                my $tail = $!cur + $!psize -1;
                for ($!cur..$tail ).reverse -> $i {
                    if     $i - $!cur  ≠ @!val[$i] - @!val[$!cur] {
                        return False;
                }   }
                        # have match 
                @!result.push: @!val[$!cur..$tail].Array;
                        # clean-up
                @!qty[ $!cur..$tail].=map( --* );
                next;
            }
            # ---- not reached ----
            die "Bad programmer";
}   }   }

plan @Test ÷ 3;
for @Test -> $siz, @in, @exp {
    is All-seq.new( $siz ,@in).process, @exp,
            "@in.raku() P $siz -> @exp.raku()" ;
}
done-testing;

my @list = 1,2,3,5,1,2,7,6,3;
my $size = 3;

say "\nInput: @list = @list[] and \$size = $size
Output: ", All-seq.new( $size, @list).process // -1;

