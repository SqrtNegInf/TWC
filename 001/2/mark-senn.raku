#!/usr/bin/env raku

for (1..20) {  
    my $e3 = $_ %% 3;  
    my $e5 = $_ %% 5;
    $e3 and print "fizz";
    $e3 && $e5 and print " ";
    $e5 and print "buzz";
    !$e3 && !$e5 and print $_;
    print "\n";  
}
