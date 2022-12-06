#!/usr/bin/env raku

use Test;

sub oddity( @list --> Str ) {
    my @input = @list;
    @input.=map: {$_.comb.map(*.ord-97).rotor( 2=>-1).map( {$_[1]-$_[0]}).join(' ')};
    my %h = Hash.new.append: @input Z=> @list;
    my @runique = %h.values.grep( *.elems == 1);
    return @runique[0] if @runique.end == 0;
    return Nil;
}

#multi MAIN ( 'test' ) {
    my @Test =
        xyz   =>(qw{ xyz },),
        bob   => qw{ aaa bob ccc ddd },
        abc   => qw{ adc wzy abc },
        (Nil) => qw{ adc way abc },
        aa    => qw{ aa ab bc de },
        (Nil) => qw{ aaa aab abc ade },
        aaaa  => qw{ aaaa aaab bbbc ddde },
        (Nil) => qw{ aaaa aaab bbbc ddde bbbb },
        (Nil) => qw{ aaaa azcd amcd alcd  },
    ;
    plan +@Test;
    for @Test -> %t {
        is oddity( %t.value), %t.key,  ' ' ~ %t.raku;
    }
    done-testing;
#}
#multi MAIN( @s = ("aaa", "bob", "ccc", "ddd") ) {
#    say "Input: \@s = (", @s.join(', ') ~ ')' ;
#    say "Output: ", oddity( @s ); 
#}

