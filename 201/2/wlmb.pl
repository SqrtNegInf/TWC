#!/usr/bin/env perl
use v5.36;

use List::Util qw(min sum);
use Memoize;

memoize "rows";
say "$_->", rows($_, $_) for 5;
sub rows($coins,$max){
    return 1 if $coins==0;
    return sum map{rows($coins-$_,min($_, $coins-$_))} 1..min($coins, $max)
}
