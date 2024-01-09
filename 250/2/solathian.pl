#!/usr/bin/env perl
use v5.36;

asv("perl", "2", "000", "python", "r4ku");
asv("001", "1", "000", "0007");


sub asv(@list)
{
    my $max = 0;
    
    foreach my $elem (@list)
    {
        # if it only has numbers
        if($elem =~ m"^\d+$")
        {
            $max = eval $elem     if( $elem > $max );
        }
        else
        {
           $max = length $elem     if( length $elem > $max );
        }
    }
    
    say $max;
}
