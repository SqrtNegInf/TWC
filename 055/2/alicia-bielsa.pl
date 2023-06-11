#!/usr/bin/env perl
use v5.36;

my @aArray = (1,2,3,4,5,6);
print "Given Array: [".join( ', ', @aArray)."]\n";
my @aWaveArrays = ();
my @aTmp = ();
searchWaveArrays( \@aTmp , @aArray );


foreach my $waveArray (@aWaveArrays){
    print "\n\n[ ".join( ' ,  ', @{$waveArray})."]";
    my @aLines = ();
    my $count = 0;    
    my $waveFlag = 1;
    while  ( $waveFlag ){
        #[4, 1, 5, 2, 3]  
        my $countWaveMarkers = 0;
        foreach my $number (@{$waveArray}){
            if ($count == 0 ){
               $aLines[$count] .= "~~~~~";
            } elsif ($count == $number-1){
               $aLines[$count] .= "  ~  ";
            } elsif ($count == $number-2){
               $aLines[$count] .= " ~~~ ";
            } elsif ($count < $number){
               $aLines[$count] .= "~~~~~";                        
            } else  {
               $aLines[$count] .= "     ";   
               next;
            }
            $countWaveMarkers++;   
        }
        if ( $countWaveMarkers == 0){
            $waveFlag = 0;
        }

        $count++;         
    }
    print join("\n", reverse @aLines );
}

sub searchWaveArrays { 
    my $refWaveArray = shift;
    my @aItemsLeft = @_;    
    if (scalar( @aItemsLeft ) == 0 ){
        push (@aWaveArrays, [@{$refWaveArray}]);
        return;
    }
    my $flagUp = scalar(@{$refWaveArray}) % 2 ? 0 : 1;
    foreach my $i (0..$#aItemsLeft){
        #check the last item of the wave, if defined        
        if (defined($$refWaveArray[$#{$refWaveArray}])){
            #If the wave is going up and the current item is lower there is no wave
            if ( $flagUp  &&  $aItemsLeft[$i]  < $$refWaveArray[$#{$refWaveArray}] ){                
                next;
            }
            #if the wave is going down and the current item is higher there is no wave
            if ( !$flagUp  &&  $aItemsLeft[$i]  > $$refWaveArray[$#{$refWaveArray}] ){
                next;
            }
        }     
        my @aTmp = (@{$refWaveArray}, $aItemsLeft[$i]);       
        searchWaveArrays(  \@aTmp, @aItemsLeft[0..$i-1],  @aItemsLeft[$i+1..$#aItemsLeft]);
    }  
}

