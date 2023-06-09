#!/usr/bin/env perl
use v5.36;

my $inputString = 25525511135;
unless (defined($inputString) && $inputString =~ /^\d{4,12}$/ ){
    die "Error: string containing only digits (0..9). The string should have between 4 and 12 digits.\n";
}
my $totalOctets=4 ;
my @aSubset = (3,2,1);
my @aOctets=();

searchOctets($inputString, '', $totalOctets);


sub searchOctets {
    my $input = shift;
    my $output = shift;
    my $level = shift;

    if ($level == 0  ){
        if ( $input eq ''){
           push(@aOctets , $output);
        }        
        return 0 ;
    } else {
        $level--;
    }
    
    foreach my $subset ( @aSubset ){
        if (length($input) < $subset ){
            next;
        }
        my $octet = substr($input, 0, $subset);
        if (isValidOctet($octet)){
            my $newinput = substr($input, $subset);
            my $newOutput = $output.$octet;
            if ($level != 0 ) {
                $newOutput .= '.';          
            }            
            searchOctets( $newinput,    $newOutput, $level);              
        }
    }
    return 0;
    
    
}

foreach my $octet (@aOctets){
    print "$octet\n";
    
    
}
sub isValidOctet {
    my $octetToCheck = shift;
    
    if ($octetToCheck =~ /^0\d+/){
        # No leading zeroes
        return 0;        
    }
    if (  $octetToCheck  >= 0 && $octetToCheck  <= 255){
        return 1;
    }
    return 0;
}


