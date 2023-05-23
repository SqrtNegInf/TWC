#!/usr/bin/env perl
use v5.36;

sub has_1{
    my($x) = @_;
    return 1 if $x =~ tr/1//d > 0;
    return 0;   
}

sub count_with_1{
    my($n) = @_;
    my $x = 1;  
    my $count = 0; 
    {
        $count += has_1($x); 
        $x += 1;
        redo if $x <= $n; 
    }
    return $count; 
}

sub count_without_1{
    my($n) = @_;
    return $n - count_with_1($n);  
}

MAIN:{
    my $N;
    $N = 15;
    print count_without_1($N) . "\n"; 
    $N = 25;
    print count_without_1($N) . "\n"; 
    $N = 200;
    print count_without_1($N) . "\n"; 
}  
