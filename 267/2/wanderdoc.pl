#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use constant LINE_LENGTH => 100;
use Test2::V0 -no_srand => 1;

is(
     line_counts("abcdefghijklmnopqrstuvwxyz", [10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]), 
     [3, 60],
     'Example 1');
is(
     line_counts("bbbcccdddaaa", [4,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10,10]), 
     [2, 4],
     'Example 2');
     
done_testing();



sub line_counts
{
     my ($str, $wds_aref) = @_;


     my %width;
     @width{'a' .. 'z'} = @$wds_aref;

     my @letters = split(//,$str);
     my @output;
     my @this_line;
     my $this_length = 0;
     for my $idx ( 0 .. $#letters )
     {
          if ( $this_length + $width{ $letters[$idx] } <= LINE_LENGTH )
          {
               push @this_line, $letters[$idx];

               $this_length += $width{ $letters[$idx] };

               if ( $idx == $#letters )
               {
                    push @output, [ join('', @this_line), $this_length];
               }
          }
          else
          {
               push @output, [ join('', @this_line), $this_length];
               @this_line = ();
               $this_length = 0;
               redo;
          }
     }
     return [scalar @output, $output[-1][1]];
}
