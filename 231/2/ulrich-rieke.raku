#!/usr/bin/env raku

#say "Enter some tickets , separated by blanks!" ;
#we assume all ticket numbers to be in the right format
#my $line = $*IN.get ;
my @tickets = ('7868190130M7522', '5303914400F9211', '9273338290F4010');
say @tickets.grep( {$_.substr( 11 , 2 ).Int >= 60} ).elems ;
