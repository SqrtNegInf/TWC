#!/usr/bin/env perl
use v5.36;
maxGap((2,5,8,1));      # (2,5) and (5,8)
maxGap((2,5,8,1,20));   # (8, 20)
maxGap((3));            # 0

sub maxGap(@list)
{
    @list = sort{$a <=> $b} @list;

    if(@list < 2)
    {
        say "0";
    }
    else
    {
        my $maxGap = 0;
        
        for(my $i = 0; $i < $#list; $i++)
        {
            my $gap = $list[$i+1] - $list[$i];
            $maxGap = $gap   if($gap > $maxGap);
        }
        
        for(my $i = 0; $i < $#list; $i++)
        {
            my $gap = $list[$i+1] - $list[$i];
            
            print("($list[$i], $list[$i+1])") if($gap == $maxGap);
        }
    
    }
    say"";
}
