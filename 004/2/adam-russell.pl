#!/usr/bin/env perl
use v5.36;
#use strict;
#use warnings;
use boolean;

my @words=qw| 
    cat
    mouse
    rabbit
    horse
    sheep
    cow
    aardvark
|; 

my @letters = qw|  
    a b c e h i o p r s t w b e z      
|;  

sub contains_remove{
    my($c) = @_;  
    return sub{
        my($word) = @_;  
        $word =~ s/$c//; 
        return $word;     
    }  
} 

my @checks;
for my $c (@letters){
    push @checks, contains_remove(lc($c));  
} 

sub check_word{
    my($word, $checks) = @_;
    if($word && !@{$checks}){
        return false;  
    } 
    $word = &{$checks->[0]}($word);
    if(!$word){
        return true;  
    }  
    check_word($word, [@{$checks}[1 .. @{$checks} - 1]]);
}  

for my $w (@words){
    if(check_word(lc($w), \@checks)){
        print "$w\n";  
    }   
}   
