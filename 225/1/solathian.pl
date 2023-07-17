#!/usr/bin/env perl
use v5.36;

maxWords("Perl and Raku belong to the same family.",  "I love Perl.",     "The Perl and Raku Conference.");             # 8
maxWords("The Weekly Challenge.", "Python is the most popular guest language.",     "Team PWC has over 300 members.");  # 7

sub maxWords(@array)
{
    my $max = 0;
    foreach my $sentence (@array)
    {
        my $value = scalar split(/\s+/, $sentence);
        
        $max = $value       if $value > $max;
    }
    
    say $max;
}
