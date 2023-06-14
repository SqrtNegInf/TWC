#!/usr/bin/env perl
use v5.36;

use constant SQUARE_SIZE => 8;
sub encode{
    my($message) = @_;
    $message =~ tr/ //d;
    my $encoded;
    my @buckets;
    my @characters = split(//, lc($message));
    for my $i (0 .. @characters){
       $buckets[$i % SQUARE_SIZE] = [] if !$buckets[$i % SQUARE_SIZE];
       push @{$buckets[$i % SQUARE_SIZE]}, $characters[$i] if $characters[$i];  
    } 
    for my $bucket (@buckets){
        $encoded .= join("", @{$bucket}) . " ";
    }  
    return $encoded; 
}

MAIN:{
    my $message = "The quick brown fox jumps over the lazy dog";
    print encode($message) . "\n"; 
}
