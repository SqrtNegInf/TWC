#!/usr/bin/env perl
use v5.36;

separate(1, 34, 5, 6);
separate(1, 24, 51, 60);

sub separate(@array)
{
    my @result;
    foreach my $elem (@array)
    {
        push(@result, split('', $elem));
    }
    
    say join(', ', @result);
}
