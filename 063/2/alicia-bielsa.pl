#!/usr/bin/env perl
use v5.36;

my $inputWord = 'xyxx';    
my $rotations = getRotations($inputWord);   
print "$inputWord  needs $rotations rotations\n";

sub getRotations {
    my $word = shift;
    my $lengthWord = length($word);
    my $currentWord = $word ;
    my $i = 0;

    while ($word ne $currentWord || !$i){
        $i++;
        my $c = $i % $lengthWord;
        my $front = substr($currentWord, 0, $c);
        my $back = substr( $currentWord,$c);
        $currentWord = $back.$front;
        print "Rotation $i: you get $currentWord by moving $front to the end.\n";
    }   
    return $i;
}


