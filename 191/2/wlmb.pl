#!/usr/bin/env perl

use v5.36;
use Algorithm::Combinatorics qw(permutations);
use List::Util qw(all);

sub cute($o){ # check @$o is a cute sequence
    my @o=@$o;
    return all {$o[$_-1]%$_==0||$_%$o[$_-1]==0} 1..@o;
}

for(8){
    my $iter=permutations[1..$_];
    my $count=0;
    my $o;
    cute($o) && ++$count while $o=$iter->next;
    say "$_ -> $count";
}
