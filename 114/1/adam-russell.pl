#!/usr/bin/env perl
use v5.36;

sub next_palindrome{
    my($n) = @_;
    {
        $n++;
        return $n if $n eq join("", reverse(split(//, $n)));
        redo; 
    }   
}

MAIN:{
    my($N);
    $N = 1234;
    print next_palindrome($N) . "\n"; 
    $N = 999;
    print next_palindrome($N) . "\n"; 
}  
