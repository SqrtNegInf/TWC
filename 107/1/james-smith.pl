#!/usr/bin/env perl
use v5.36;

use Test::More;

## Generating self descriptive numbers can be split between
## the case where n >= 7 and n < 7...
## As we are asked for the first 3 these all exist in the case
## where n<7....
##
## To get the next we can write them (in base "n") as
## All other numbers can be generated by the rule
## "n-4", "2", "1", "0" (n-7 times), "1", "0", "0", "0"
##
## We loop through numbers starting 1 to see if they are self
## descriptive.
## To get the desciption of a number of length k, we loop from
## 0..(k-1) counting the number of each digit in the string...
## We can do this with a harcoded series of tr///s but in if
## we want something dynamic we can write this as
##
## @Q = m{($_)}g; $count = scalar @Q;
##
## we can do this in one line by using @{[ ]} to convert to the
## list of matches to an array { subtle distinction here between
## lists and arrays! } and counting it by getting the scalar of
## the array...
##
## The description is got by stitching those counts together...
## We can do this in the one-line join q(), map below..
## We just store it the list if the description and the number are
## the same....

my ($c,@res) = 0;

while( ++$c && @res<3 ) {
  push @res, $c if $c == join q(),
    map { scalar @{[ $c=~m{($_)}g ]} } 0 .. -1 + length $c;
}

say "@res";

## We can reduce this further - by rewriting the inner if with
## using the && trick. && is evaluated lazily - so that if
## the left hand side is false then the right hand side is not
## evaluated.
##
## So if($x) { y() } can be written as $x && y();
##
## Similarly - unless($x) { y() } can be written $x || y()] and
## if($x) { y() } else { z() } can be written $x ? y() : z()
##
## This means we can make the statement inside the loop a single
## statement and postfix the while...

($c,@res) = 0;

( $c == join q(),
        map { scalar @{[ $c=~m{($_)}g ]} }
        0 .. -1 + length $c
) && push @res, $c while ++$c && @res<3;

say "@res";

## Note we have to wrap the "condition" in brackets to force
## it to be evaluated before the && as o/w the line ends in
## 0 .. -1 + length( $x && push @res, $c);
##
## This is why we right the "yoda" looking -1 + length $c as
## if you write length $c - 1 this evaluates to length($c-1)...
##
## I wouldn't do this in "normal" code as I think it can get
## confusing $x && f() is not obviously a piece of logic &
## especially if f() has implicit side effects as here

## If we don't want to capture the values - but just display
## the results - we can drop this into a perl 1-liner on the
## command liner

=cut
perl -E '($c-join"",map{0+@{[$c=~/($_)/g]}}0..-1+length$c)||++$n&&say$c while++$c&&$n<3'

# or

perl -E '($c-join"",map{0+(@Q=$c=~/($_)/g)}0..-1+length$c)||++$n&&say$c while++$c&&$n<3'
=cut

## You will notice we are using slightly different tricks here...
## (Mainly we can do these because we haven't enabled strict!! something
## you rarely do in Perl 1-liners...)
##
## * We use -E (rather than -e) this enables more modern perl features
##   - including usefully say!
##
## * We don't collect results - and we just keep a counter - this time
##     we use || and && in the "logic"...
##
##   We know ++$n is always going to be true (it starts of
##     explicitly) and so we always run say$c if we get to the ++$n..
##
##   Note here - this is a place where it is important to choose ++$n
##     rather than the more common $n++, as the first evaluates to 0
##     the first time it is invoked - meaning we would skip the first
##     answer...
##
## * We show a different trick to count the elements of the list.
##
##   We can use another trick other than the scalar @{[ ]} trick to
##     convert the list into an array. we store it in an array
##     variable which makes it we can then get the length of the
##     array (we just ignore the array!)
##
##   As we are keeping the code short - we can replace the keyword
##     scalar with a simple 0+ which forces the array to be converted
##     into a scalar (and hence returns the length)
##
## * To gain another character as the equality is numeric we can
##     rewrite if($a==$b) { f() } as ($a-$b)||f().
##
##   $a-$b is non-zero (true) if $a!=$b so we can rewrite:
##   $a-$b is zero (false)    if $a==$b so we can rewrite:
##
##       if( $a == $b ) { f() }
##
##     as
##
##       unless( $a - $b ) { f() }
##
##   which we know we mentioned we could rewrite as:
##
##       ($a-$b) || f()
##
##   The brackets are important o/w this evaluates to:
##
##       $a-($b||f())
##
##   which isn't what we want...
##
