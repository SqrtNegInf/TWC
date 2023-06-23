#!/usr/bin/env perl
use v5.36;

sub center{
    my @words = @_;  
    my @padded_words;  
    my %line_length; 
    my $max_length = -1; 
    my $center;  
    my $i = 0;  
    foreach my $line (@words){
        $line_length{$i} = do{
            $line =~ tr/ [a-z][A-Z]//;
        };  
        $max_length = $line_length{$i} if $line_length{$i} > $max_length; 
        $i++;
    }  
    $center = int($max_length / 2);
    for(my $i = 0; $i < @words; $i++){
        my $middle = int($line_length{$i} / 2);  
        my $padding = $center - $middle;  
        $padded_words[$i] = " " x $padding . $words[$i];   
    }   
    return @padded_words;  
}  

##
# Main
##  
my @words;  
do{
    local $/;
    @words = split(/\n/, <DATA>);  
};  
my @centered = center(@words);  
foreach my $w (@centered){
    print "$w\n";  
}  

__DATA__
This
is
a test of the
center function
