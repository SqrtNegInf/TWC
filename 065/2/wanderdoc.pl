#!/usr/bin/env perl
use v5.36;

use List::Util qw(sum);
use Getopt::Long;
use Pod::Usage;

my $message_text = <<"OUT";
Usage: script [flags] string.
Flags: 
--i 0|1 consider or not solutions that are not complete partitions of the string.
--s 0|1 consider or not single letters as a part of the solution.
--h read this message
OUT



my %opts = (incomplete_partitions => 1, single_letters => 0,);



GetOptions( \%opts, 
     'incomplete_partitions|i=i', 
     'single_letters|s=i',
     'help|h'
) or die pod2usage({ -message => $message_text ,
             -exitval => 2,  
             -verbose => 0,  
             -output  => \*STDERR });

pod2usage($message_text) if $opts{help};

my $string = 'aabbababba';


sub is_palindrome { return ($_[0] eq reverse $_[0]); }



sub deep_copy
{
     my $aref = shift;
     my @arr = @$aref;
     return [@arr];
}



sub solve
{
     my ($str, $start, $solution, $all) = @_; 

     if ( $start == length($str) )
     {
          my $s = deep_copy($solution);
          push @$all, $s; 

     }
     for my $idx ( $start   .. length($str) ) 
     {
          if (is_palindrome(substr($str, $start, $idx - $start + 1)))
          {
               push @$solution, substr($str, $start, $idx - $start + 1);
               solve($str, $idx + 1, $solution, $all); 
               pop @$solution;

          }
     }
}

sub find_palindrome_substrings
{
     my $string = $_[0];
     my @sols;

     my $strlen = length($string);
     solve($string, 0, [], \@sols);
     if ($opts{single_letters} == 0 ) { filter_out_single_letters(\@sols); }
     if ($opts{incomplete_partitions} == 0) {filter_out_incomplete_partitions(\@sols, $strlen); }
     if ( scalar @sols )
     {
          my $counter = qq[a];
          print $counter++, ") ", join(" ", @$_), $/ for @sols;
     }

     else
     {
          print -1;
     }
}




sub filter_out_single_letters
{
     @{$_[0]} = grep {@$_ = grep { length > 1 } @$_} @{$_[0]};
}

sub filter_out_incomplete_partitions
{
     @{$_[0]} = grep {sum(map {sum(length)} @$_) == $_[1]} @{$_[0]};
}


find_palindrome_substrings($string);
