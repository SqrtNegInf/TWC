#!/usr/bin/env perl
use v5.36;

my $binaryNumber = $ARGV[0] // 100110011;

unless (defined($binaryNumber) && $binaryNumber =~  /^[01]+$/){
    die "ERROR: Script accepts a binary number\n";
}
print "Binary Number :$binaryNumber\n";
my @aResults = ();
my $n = length($binaryNumber);

foreach my $leftIndex (0..$n-1){
    foreach my $rightIndex ($leftIndex..$n-1){
        my $resultBinary =  flipBetween( $leftIndex , $rightIndex) ;
        my $totalOnes = () = $resultBinary =~ /1/g;
        push (@aResults,{'L' => $leftIndex, 'R' => $rightIndex , 'B' => $resultBinary ,'1' =>  $totalOnes} );        
    }
}

my $maxNumberOnes ;
foreach my $result ( sort { $b->{'1'} <=>  $a->{'1'} } @aResults){
    if (defined($maxNumberOnes) && $maxNumberOnes > $result->{'1'} ){
        last;
    }
    $maxNumberOnes  = $result->{'1'};   
    print "L=".$result->{'L'}.", R=".$result->{'R'}.", binary: ".$result->{'B'}.",  ".$result->{'1'}." 1s\n";    
}


sub flipBetween {
    my $left = shift;
    my $right = shift;    
    my @aDigits  = split ( '', $binaryNumber);    
    for my $i (0..$#aDigits){
        if ( $i >= $left && $i <= $right ){
            $aDigits[$i]  = $aDigits[$i] ? 0 : 1;
        }    
    }
    return join ('', @aDigits);
}

