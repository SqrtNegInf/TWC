#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;
#use Data::Dumper;

my $size = 3;
unless (defined($size) && $size =~ /^[1-5]{1}$/ ) {
    die "ERROR: Size must be between 1 and 5\n";
}


my %hNodes = ();
$hNodes{'a'} = ['e','i'];
$hNodes{'e'} = ['i'];
$hNodes{'i'} = ['a', 'e', 'o', 'u'];
$hNodes{'o'} = ['a','u'];
$hNodes{'u'} = ['a','e'];

my @aStrings = ();


foreach my $vowel ( keys(%hNodes)){
    addVowel($size, $vowel,'');
}

sub addVowel {
    my $currentLevel = shift;
    my $currentVowel = shift;
    my $currentString = shift;
    $currentString  .= $currentVowel;   
    if ($currentLevel  == 1  ){
        push (@aStrings , $currentString);
        return 0;
    } else {
        $currentLevel--;
    }       
        
    foreach my $nextVowel (@{$hNodes{$currentVowel}}){   
        addVowel($currentLevel, $nextVowel,$currentString );
    }
    
    return 0;
}   
foreach my $str (sort @aStrings){
    print "$str\n";

}

