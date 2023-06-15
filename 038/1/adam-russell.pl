#!/usr/bin/env perl
use v5.36;

use boolean; 
sub is_valid{
    my($x) = @_;
    $x =~ m/([1-2]{1})([0-9]{2})(0[1-9]{1}|1[012]{1})(0[1-9]{1}|1[012]{1}|2[0-9]{1})/; 
    return $x, $1, $2, $3, $4; 
} 

sub transform{
    my($a, $b, $c, $d) = @_;
    if($a == 1){
        $a = "20$a"; 
    }
    else{
        $a = "19$b"; 
    }  
    return "$a-$c-$d"; 
}

MAIN:{
    while(my $x = <DATA>){
        my ($valid, @fields) = is_valid($x);
        unless(!$valid){
            print transform(@fields) . "\n"; 
        }
        else{
            print "invalid: $x\n"; 
        }  
    } 
} 

__DATA__
2230120
