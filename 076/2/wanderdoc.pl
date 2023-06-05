#!/usr/bin/env perl
use v5.36;

use URI;
use FindBin qw($Bin);
use List::Util qw(sum);

# Load dictionary.
my %dict;
{

     open my $in, "<", "words.txt" or die "$!";
     while ( my $line = <$in> )
     {
          chomp $line;

          next unless length($line) >= 5;
          $dict{lc $line} = undef;
     }
}



# Load grid.

my @grid;
{
     open my $in, "<", "grid.txt" or die "$!";
     while ( my $line = <$in> )
     {
          chomp $line;
          $line = lc $line;
          my @string = split(/\s/,$line);

          push @grid, [@string];
     }
}



print "First search:$/";
grid_search(\@grid, 5);

print "After 90-Rotation:$/";
grid_search(rotate_90([@grid]), 5);

print "After 45-Rotation:$/";
grid_search(rotate_45([@grid]), 5);

print "After 135-Rotation:$/";
grid_search(rotate_45(rotate_90([@grid])), 5);


# my $counter;
sub grid_search
{
     my ($aref, $length) = @_;
     state $counter;
     for my $part ( @$aref )
     {

          for my $i ( 0 .. $#$part - $length )
          {
               for my $j ( $length - 1 ..  $#$part)
               {
                    next unless $j - $i >= $length - 1;
                    my $chunk = join('',@{$part}[$i .. $j]);
                    my $reversed = reverse $chunk;
                    for my $candidate ( $chunk, $reversed )
                    {

                         print ++$counter, ' ', $candidate, $/ 
                              if exists $dict{$candidate};
                    }
               }
          }
     }
}


sub rotate_90
{
     my ($aref) = @_;
     my $rotated;
     for my $row_idx ( 0 .. $#$aref )
     {
          for my $col_idx ( 0 .. $#{$aref->[$row_idx]} )
          {
               $rotated->[$col_idx][$#$aref - $row_idx] = 
                         $aref->[$row_idx][$col_idx];
          }
     }
     return $rotated;
}

sub rotate_45
{
     my $aref = $_[0];
     my $rotated;
     for my $row_idx ( 0 .. $#$aref )
     {
          for my $col_idx (0 .. $#{$aref->[$row_idx]})
          {
               push @{$rotated->[ sum($row_idx, $col_idx)]},
                    $aref->[$row_idx][$col_idx];
          }
     }
     return $rotated;
}
