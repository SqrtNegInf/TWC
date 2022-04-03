#!/usr/bin/env raku



sub MAIN (Int $n where $n > 0 = 200000000 ) { # ummm...
    for 1..11 {
        my $fact = [*] 2..$_;
        
        ## match object captures are in a list. 
        ## Take match object [0], apply comb then elems to count the zeros
        my $zeros = ($fact ~~ /.*?(0*)$/)[0].comb.elems;
        my @pl = $zeros == 1 ?? ('is ', '') !! ('are', 's') ;
        say "there are $zeros trailing zeros on {$_}! = $fact";
    }
}

