#!/usr/bin/env raku

my @words1 = ('ab', 'c');
my @words2 = ('a', 'bc');
'true'.say and exit if ( @words1.join ~~ @words2.join );
'false'.say;
