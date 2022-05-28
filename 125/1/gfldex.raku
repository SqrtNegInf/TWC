#!/usr/bin/env raku
# from https://gfldex.wordpress.com/2021/08/13/inequality/

#`{{

Rakudo implements set-operations as equivalence checks, not numerical
equality. Quite in contrast to ==, eqv does a type check and Int aint’t
Rat. This might explain that the mathematical inclined don’t use Set as
much as I did expect them to. The type mismatch simply produces a result
that is not useful to mathematicians.

As implemented right now, we can’t tell the set operators what we consider
equality . With meta-operators and junctions, we can specify what operator
we actually want to use. The set-operators are not meta-operators and at
least for now, we can’t user define new meta-operators. However, we can
lexically redefine ordinary operators.

The proto is needed, because we need to get rid of multi-candidates that
are already present. A more general approach might be to have a
&*SET-COMPARATOR that defaults to &infix:<cmp>. This would slow down a
fairly simple operator by a factor of 13. I may still be able to write a
module that takes a comparator and returns a host of operators. With proper
macros this would be easy. Maybe next year.

}}

proto sub infix:<(elem)>($, $, *% --> Bool:D) is pure {*}
multi sub infix:<(elem)>(Numeric:D \a, Iterable:D \listy --> Bool:D) {
    Any.fail-iterator-cannot-be-lazy('∈', '') if listy.is-lazy;

    for listy -> \b {
        return True if a == b;
    }

    False
}

constant &infix:<∈> := &infix:<(elem)>;

proto sub infix:<(&)>(|) is pure {*}
multi sub infix:<(&)>(Iterable:D \lhs, Iterable:D \rhs) {
    Any.fail-iterator-cannot-be-lazy('∩', '') if lhs.is-lazy || rhs.is-lazy;

    my @result;

    for lhs -> \l {
        for rhs -> \r {
            @result.push: r if l == r;
        }
    }

    +@result ?? @result !! ∅
}

sub pythagorean-triples (Int:D $N where * > 0 = 13) {

   # this finds all possible (distinct) ways of expressing $n as a
   # product of two positive integers. The first item is by definition
   # lower than, or equal to, the second so that we know that only
   # distinct pairs are considered; this also means that the first
   # element cannot be greater than sqrt($n)
   sub factor-in-pairs ($n) {
      (1 .. sqrt($n))            # first element 1 .. sqrt($n)
         .grep({$n %% $_})       # make sure first element divides $n
         .map({($_, $n / $_)});  # take it and its counterpart
   }

   # I know that gather/take is slow... but it's too cool
   gather {
      # https://en.wikipedia.org/wiki/Formulas_for_generating_Pythagorean_triples#Dickson's_method
      # parameter $r spans positive even integers
      R: # this marks the outer loop, for exiting lazy iteration
      for 2, 4, 6 ... Inf -> $r {
         for factor-in-pairs($r²/2) -> ($s, $t) {
            my @triple = ($r + $s, $r + $t, $r + $s + $t);

            # if the very first triple's first element is over $N,
            # our iteration is over because any element will be
            # greater than $N from now on
            last R if $s == 1 && $N < @triple[0];

            # only take the triple if it contains our target $N
            take @triple if $N ∈ |@triple;                           # <==== custom '∈' from gfldex
            #take @triple if $N == @triple.any;
         }
      }
   }
}

sub MAIN (Int:D $N = 5) {
   my @triples = pythagorean-triples($N);
   if @triples { put '(' ~ $_.join(', ') ~ ')' for @triples }
   else        { put -1 }
}
