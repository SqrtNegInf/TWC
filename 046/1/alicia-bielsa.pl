#!/usr/bin/env perl
use v5.36;

my @aMessage1 = qw(P + 2 l ! a t o);
my @aMessage2 = qw(1 e 8 0 R $ 4 u);
my @aMessage3 = qw(5 - r ] + a > /);
my @aMessage4 = qw(P x w l b 3 k \\);
my @aMessage5 = qw(2 e 3 5 R 8 y u);
my @aMessage6 = qw(< ! r ^ ( ) k 0);
my @aCharactersRepeated = ();
my $lengthMessage = scalar(@aMessage1);
my @aAllMessages = (@aMessage1, @aMessage2 ,@aMessage3, @aMessage4, @aMessage5 ,@aMessage6);
my %hCharacters = ();

foreach my $indexAllMesages (0..$#aAllMessages){
    my $indexMessage =  $indexAllMesages % $lengthMessage;
    my $currentCharacter = $aAllMessages[$indexAllMesages];
    unless (exists($hCharacters{$indexMessage})){
        $hCharacters{$indexMessage} =();
    }    
    unless (exists($hCharacters{$indexMessage}{$currentCharacter})){
        $hCharacters{$indexMessage}{$currentCharacter} = 0 ;
    }
    $hCharacters{$indexMessage}{$currentCharacter} ++;
    if ($hCharacters{$indexMessage}{$currentCharacter} == 2 ){
        $aCharactersRepeated[$indexMessage] = $currentCharacter;
    }
}
print "Decrypted Message:";
foreach my $character (@aCharactersRepeated){
    print "$character";
}
print "\n";
