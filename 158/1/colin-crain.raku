#!/usr/bin/env perl6


unit sub MAIN () ;

put (^100).grep(*.is-prime )
          .grep(*.comb.sum.is-prime);

        
