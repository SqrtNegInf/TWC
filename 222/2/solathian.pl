#!/usr/bin/env perl
use v5.36;

lastMember(2, 7, 4, 1, 8, 1);       # 1
lastMember(1);                      # 1
lastMember(1, 1);                   # 0

sub lastMember(@list)
{
    while(1 < @list )
    {
        @list = sort @list;
        
        # remove the two biggest elements
        my $y = pop(@list);
        my $x = pop(@list);
        
        # add new member (y-x)
        push(@list, $y - $x)    if( $x != $y);

    }
    
    push(@list, 0)  if(@list == 0);     # we have to say 0 if the array is empty
    say @list;
}
