#!/usr/bin/env raku

use Test;

sub Is_DivByZero($a,$b){
    my Bool $result=False;
    my $misc;

    try {    $misc= "{$a/$b}" ; } ; # NOTE why does $misc = $a/$b not throw an exception! ????????????

    if $! {
        $result= True;
        # say "$a / $b failed with " ~ $!.^name
    }
    return $result;

}

is Is_DivByZero(1,0),True ,"1/0 IS  div by zero";
is Is_DivByZero(0,0),True ,"0/0 IS  div by zero (actually indeterminate)";
is Is_DivByZero(1,2),False,"1/2 NOT div by zero";
is Is_DivByZero(1,1),False,"1/1 NOT div by zero";
is Is_DivByZero(0,1),False,"0/1 NOT div by zero";
done-testing;
