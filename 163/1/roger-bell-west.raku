#!/usr/bin/env raku

use Test;

plan 3;

is(sumbitwise([1,2,3]),3,'example 1');
is(sumbitwise([2,3,4]),2,'example 2');
is(sumbitwise([1,2,3,10]),7,'example 3');

sub sumbitwise(@ls) {
    return @ls.combinations(2).map({$_[0] +& $_[1]}).sum;
}
