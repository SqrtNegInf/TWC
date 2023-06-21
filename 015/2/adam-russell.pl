#!/usr/bin/env perl
use v5.36;

use constant KEYWORD => "perl";  

sub encode{
    my($plaintext) = @_;
    my $encrypted = "";
    my @characters = split(//, $plaintext);
    my @key = split(//, KEYWORD x ((length($plaintext) / length(KEYWORD)) + 1));
    foreach my $c (@characters){
       my $e = ((ord(lc($c)) - ord("a")) + (ord(shift @key) - ord("a"))) % 26;   
       $encrypted .= chr($e + ord("a"));  
    }  
    return $encrypted; 
}

sub decode{
    my($encrypted) = @_;
    my $plaintext = "";
    my @characters = split(//, $encrypted);
    my @key = split(//, KEYWORD x ((length($encrypted) / length(KEYWORD)) + 1));
    foreach my $c (@characters){
       my $e = ((ord(lc($c)) - ord("a")) - (ord(shift @key) - ord("a"))) % 26;   
       $plaintext .= chr($e + ord("a"));  
    }  
    return $plaintext; 

}

##
# Main
## 
print "ATTACKATDAWN is encoded as " . encode("ATTACKATDAWN") . "\n";
print "PXKLRORESENY is decoded as " . decode("PXKLRORESENY") . "\n";
