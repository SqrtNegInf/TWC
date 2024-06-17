#!/usr/bin/env raku

my $str = "ballerina"; my $char = 'e';
my $charcount = $str.comb.grep($char);
printf("Percentage of times character apears in string %.0f%%\n", 100.0*$charcount/$str.chars);
