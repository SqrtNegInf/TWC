#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;

good_strings( ["cat", "bt", "hat", "tree"], "atach" );
good_strings( ["hello", "world", "challenge"], "welldonehopper" );

sub good_strings {
   my ($words, $chars) = @_;
   my $result = 0;
   print "Input: (" . join(", ", @$words) . "); \"$chars\"\n";
   foreach my $word (@$words) {
      $result += good_string_result($word, $chars);
   }
   print "Output: $result\n";
}

sub good_string_result {
   my ($word, $chars) = @_;
   my ($wordmap, $charmap);
   my $result = 0;
   map { $wordmap->{$_}++ } split //, $word;
   map { $charmap->{$_}++ } split //, $chars;
   foreach my $c  (keys %$wordmap) {
      return 0 unless $charmap->{$c};
      return 0 unless $charmap->{$c} >= $wordmap->{$c};
      $result += $wordmap->{$c};
   }
   return $result;
}
