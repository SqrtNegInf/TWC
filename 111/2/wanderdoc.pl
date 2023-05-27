#!/usr/bin/env perl
use v5.36;

my $max_len = 0;
my $candidate = '';
open my $in, "<", "/usr/share/dict/words" or die "$!";

LINE: while ( my $line = <$in> )
{
     chomp $line;
     my $this_len = length($line);

     next if $this_len < $max_len;
     $line = lc $line;
     
     for my $i ( 1 .. $this_len)
     {
          my $substring = substr($line, 0, $i);
          my $sorted =  join('', sort {$a cmp $b} split(//,$substring));
          next LINE if $substring ne $sorted;

     }
     $candidate = $line;
     $max_len = length($line);
}

print $candidate, $/;
