#!/usr/bin/env raku

my @aStrings = ();
 my %hNodes = ();
%hNodes{'a'} = ['e','i'];
%hNodes{'e'} = ['i'];
%hNodes{'i'} = ['a', 'e', 'o', 'u'];
%hNodes{'o'} = ['a','u'];
%hNodes{'u'} = ['a','e'];

sub MAIN ( Int $size = 3) {    
    unless (defined($size) && $size  >= 1 && $size <= 5 ) {
        die "ERROR: Size must be between 1 and 5\n";
    }   
    for  keys(%hNodes) -> $vowel {
        addVowel($size, $vowel,'');
    }    
    @aStrings.sort.map({  say  $_    });
    
}

sub addVowel ($currentLevel, $currentVowel , $currentString) {

    my $addToString  =  $currentString ~  $currentVowel; 
    my $newLevel = $currentLevel -1;
    if $currentLevel  == 1   {
        @aStrings.push($addToString );
        return 0;
    }        
    for  @(%hNodes{$currentVowel}) -> $nextVowel {   
        addVowel($newLevel, $nextVowel,$addToString  );
    }    
    return 0;
}

