#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2021/11/30/monkey-see-no-crossproduct/

#`{{ 
First we build all possible combinations of an n-places integer. This
would be done with an expression like @a xx @a ... $n where $n is the
number of places. I don’t think we got such a construct in Raku so I had to
macro it in with EVAL (also, it made a good blog title). We then proceed
with eliminating all combinations that are forbidden by the task. First we
weed out repetition with ».unique. Next we only take integers that are
shorter then the original integer and don’t have the same order. We sort
the result list by number of digits to make it pretty. At this point the
digits are still represented as a list. We change that by forcing them into
a Str via ».join and remove duplicates and turn them into Ints (not
strictly necessary). Now we fulfil the last condition of divisibility by
$n.

The sub is-same-order was where I spend the most time. And you can tell by
how short it is. The idea is simple. We build a list of indices by walking
the places of the number we want to check against the original integer. If
the indices are all ascending, the order is the same. And we can tell by
checking if those are already numerically sorted.

I’m not happy with using bind. This is another spot where Raku won’t allow
functional programming to integrate well with OO. I’m gonna ask Santa if he
can make &$m.index DWIM.

}}

sub like1($m, $n) {
    use MONKEY-SEE-NO-EVAL;

    sub bind($o, Str $method-name) {
        sub (|c) { $o."$method-name"(|c) }
    }

    sub is-same-order(@l) {
        my @indices = @l.map(bind($m, 'index'));
        @indices ~~ @indices.sort;
    }

    say [$m, $n];
    my @a = $m.comb;
    my $expr = ('@a' xx @a).join(' X, '); # I can haz RakuAST macro plox?
    my @digits = (EVAL $expr)».unique.grep(-> @l { @l < @a && is-same-order(@l) }).sort(*.elems)».join.unique».Int;
    say @digits.grep: * %% $n;
}


for (1234, 2; 768, 4) -> [$m, $n] {
        like1($m, $n);
}

say '======================================================================';

#  there is sub cross, what makes the EVAL redundant

sub like2($m, $n) {

    sub bind($o, Str $method-name) {
        sub (|c) { $o."$method-name"(|c) }
    }

    sub is-same-order(@l) {
        my @indices = @l.map(bind($m, 'index'));
        @indices ~~ @indices.sort;
    }

    say [$m, $n];
    my @a = $m.comb;
    my @digits = cross(@a xx +@a)».unique.grep(-> @l { @l < @a && is-same-order(@l) }).sort(*.elems)».join.unique».Int;
    say @digits.grep: * %% $n;
}


for (1234, 2; 768, 4) -> [$m, $n] {
        like2($m, $n);
}
