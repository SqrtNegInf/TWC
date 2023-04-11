#!/usr/bin/env raku

# wrong answer?

use Test;

# return True if so 'subset.elems × other.sum == subset.sum × other.elems'
# is found, else False.
multi same-average-parts2( @in where *.elems ≤ 1 -->Bool ){ False }
multi same-average-parts2( @in -->Bool){

    my Int $total = [+] @in;

    my $prev;
    for 1..(@in.elems div 2) -> $a-elems {
        for @in.combinations( $a-elems).sort -> $a {
            my $b-val = $a-elems × ($total - [+] $a);

            if $b-val == ([+] $a) × ( @in.elems - $a-elems) {
                return True;
    }   }   }
    return False;
}

my @t1 = (1, 2, 3, 4, 5, 6, 7, 8);
say same-average-parts2( @t1 );
my @t2 = (1, 3);
say same-average-parts2( @t2 );

#plan @Test/2;

#for @Test ->  @t, $exp {
#    is same-average-parts2( @t), $exp,  "$exp <- @t[]";
#}
#done-testing;

#my $ints = @Test[*-2];
#say "\nInput: \$ints = $ints[]"
#   ,"\nOutput: &same-average-parts2($ints)";
#
#exit;
