#!/usr/bin/env perl

use v5.16;

use List::Util qw(sum);

@ARGV = (1,3,5,6,9) unless @ARGV;

sub aMean { sum(@_)/@_ }
sub gMean { my $g=1; map{$g*=$_}@_; abs($g)**(1/@_) }
sub hMean { @_/sum(map{1/$_}@_) }

printf "AM = %f, GM = %f, HM = %f\n",
  aMean(@ARGV), gMean(@ARGV), hMean(@ARGV);

