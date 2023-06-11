#!/usr/bin/env perl
use v5.36;

my $target=3;                       # command line parameters
print "Enter the string length  >> "       # Prompts for input
  and chomp($target=<>) unless $target;    # if parameter not supplied
                          
print join (" ",vowelStrings($target));    # display returned list

sub vowelStrings{
  my $target=shift;
  my %following=(      # hash containing lists of valid following vowels
    a =>['e','i'],
    e =>['i'],
    i =>['a', 'e', 'o', 'u'],
    o =>['a', 'u'],
    u =>['o','e'],
  );
  my @list=(qw{a e i o u }); # start with list of vowels

# treats @list as a circular list shifting a string from one end,
# create a list made by adding all the potential following vowels
# to that string, and pushing these to the end, continuing until
# $target length achieved

  while(length $list[0] <$target){
    my $str= shift @list;
    push @list, map {$str.$_} @{$following{substr($str,-1,1)}};
  }
  return @list,
}
