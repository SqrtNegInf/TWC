#!/usr/bin/env perl
use v5.36;
$"=" ";

# SUBROUTINES:

sub shape {
   my $r = shift @_;
   my $c = shift @_;
   my @flat = @_;
   if ($r*$c != scalar @flat){
      return ([0])}
   my @rows;
   my $i = 0;
   for (@flat){
      $rows[int $i/$c]->[$i%$c]=$_;
      ++$i}
   return @rows}

# DEFAULT INPUTS:
my @arrays =
(
   [2,2,1,2,3,4,1,4], 
   [2,3,1,2,3,4,5,6,3,2], 
   [1,2,1,2,3,2]
);

# NON-DEFAULT INPUTS:
if (@ARGV) {@arrays = ([@ARGV]);}

# MAIN BODY OF SCRIPT:
for (@arrays){
   say '';
   my @array = @{$_};
   my $or = shift @array;
   my $oc = shift @array;
   my $nc = pop   @array;
   my $nr = pop   @array;
   my @old_rows = shape($or, $oc, @array);
   my @new_rows = shape($nr, $nc, @array);
   say "Original matrix ($or rows, $oc cols):";
   say "@{$_}" for @old_rows;
   say "Reshaped matrix ($nr rows, $nc cols):";
   say "@{$_}" for @new_rows;
   if (1 == @new_rows && 1 == @{$new_rows[0]} && 0 == $new_rows[0]->[0]){
      say "(Couldn't reshape.)"}}
