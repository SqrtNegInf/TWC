#!/usr/bin/env perl
use v5.36;

my @aOutputs = ();
my @aInput  =(2, 5, -1, 3 );

foreach my $i (0..$#aInput){
    foreach my $l (1..$#aInput+1-$i){
        my @asublist = ();
        push (@asublist, $aInput[$i]);
        foreach my $c  (1..$l-1){
            push (@asublist, $aInput[$i+$c]);
        }
        push ( @aOutputs, \@asublist); 
   }
}

my $maximumProduct = 0;
my @aMaximumProductSublist = ();

foreach my $output (@aOutputs) {
    my $product = getProductArray($output);
    if ($product > $maximumProduct){
        $maximumProduct = $product;
        @aMaximumProductSublist = @{$output};
    }

}

sub getProductArray {
    my $refArray = shift;
    my $productArray = 1;
    foreach my $digit (@{$refArray}){
        $productArray = $digit * $productArray;        
    }
   return $productArray;
}

print "[".join(',',  @aMaximumProductSublist)."] which gives maximum product $maximumProduct\n";
