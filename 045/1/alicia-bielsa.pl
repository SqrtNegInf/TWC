#!/usr/bin/env perl
use v5.36;

my $askForInput = 0;
my $errorMessage = '';
my $columnLength = 8;

#while ($askForInput){

    if ($errorMessage ){
        print "ERROR: $errorMessage\n";
    }
    my $input = "The quick brown fox jumps over the lazy dog";
    print "Input: '$input'\n";
    if ($input =~ /^q|quit$/i){
        print "Bye bye\n";
        $askForInput = 0;
    } elsif ($input =~ /\S+/){
        $errorMessage = '';
        my $messageEncoded = encodeMessage($input);
        print "\n>>>>>>>>>>>>>>>>Encoded message: $messageEncoded\n";
    } else {
       $errorMessage =  "ERROR, no valid message was entered\n";		
    }	
	
#}

sub getInput {   
    print "------------------------------\n";
    print "Enter your message to be coded\nEnter quit(q) to exit\n";
    print "------------------------------\n";	
    my $input = <STDIN>;
    chomp($input);	
    return $input;
}

sub encodeMessage {
    my $message = shift;
    my @aSubMessages = ();
    my $messageEncoded = '';
    $message =~ s%\s+%%g;	
    my @aEncodedGroups = ();
    my @aMessage = split ('', $message);
    foreach my $indexMessage  (0..$#aMessage){
        my $indexSubgroup = $indexMessage % $columnLength ;
        unless  (defined $aEncodedGroups[$indexSubgroup]){
            $aEncodedGroups[$indexSubgroup] = '';
        }
        $aEncodedGroups[$indexSubgroup] .= $aMessage[$indexMessage]; #t
    }  
    $messageEncoded = join(' ', @aEncodedGroups);    
    return $messageEncoded ;
}
