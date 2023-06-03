#!/usr/bin/env perl
use v5.36;

sub find_remove{
    my($s, $x) = @_;
    my $i = index($s, $x);
    if($i != -1){
        substr $s, $i, length($x), "";
        return $s;
    }
    return undef;
}
MAIN:{
    my $A = "XY";
    my $B = "X";
    my $C = "XXY";
    my $s = find_remove($C, $A);
    if($s && $s eq $B){
        print "1\n";
        exit;
    }
    else{
        $s = find_remove($C, $B);
        if($s && $s eq $A){
            print "1\n";
            exit;
        }
    }
    print "0\n";
}
