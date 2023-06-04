#!/usr/bin/env perl
use v5.36;

use boolean; 
sub is_leader{
    my(@a) = @_;
    my $l = shift @a;
    for my $x (@a){
        return false if $x > $l;
    } 
    return true; 
}

sub find_leaders{
    my(@a) = @_;
    my @leaders;
    for my $i (0 .. @a - 1){
        push @leaders, $a[$i] if !$a[$i + 1] || is_leader(@a[$i .. @a - 1]);   
    } 
    return @leaders; 
}

MAIN:{
    my @A;
    @A = (9, 10, 7, 5, 6, 1);
    print "\@A = (" . join(",", @A) . ")\n";
    print "Leaders = (" . join(",", find_leaders(@A)) . ")\n";
    @A = (3, 4, 5);
    print "\@A = (" . join(",", @A) . ")\n";
    print "Leaders = (" . join(",", find_leaders(@A)) . ")\n";
}  
