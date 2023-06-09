#!/usr/bin/env perl
use v5.36;

use lib '.';
use LinkedList;

MAIN:{
    my $ll = LinkedList->new();
    my $next = $ll->insert(1, undef);
    $next = $ll->insert(4, $next);
    $next = $ll->insert(3, $next);
    $next = $ll->insert(2, $next);
    $next = $ll->insert(5, $next);
    $next = $ll->insert(2, $next);
    print "Original: "; 
    print $ll->stringify();
    $ll->partition(3);
    print "Partitioned: "; 
    print $ll->stringify();
}
