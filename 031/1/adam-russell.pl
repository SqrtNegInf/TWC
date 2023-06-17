#!/usr/bin/env perl
use v5.36;

eval { my($x, $y) = (9, 0); my $a = $x/$y; }; 
if($@){
    print "caught an error: $@"; 
}   
else{
    print "no error\n"; 
} 
