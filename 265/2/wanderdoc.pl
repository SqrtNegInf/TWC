#!/usr/bin/env perl
use strict;
use warnings;

use Test2::V0 -srand => 1;


is(completing_word('aBc 11c', ['accbbb', 'abc', 'abbc']), 'accbbb', 'Example 1');
is(completing_word('Da2 abc', ['abcm', 'baacd', 'abaadc']), 'baacd', 'Example 2');
is(completing_word('JB 007', ['jj', 'bb', 'bjb']), 'bjb', 'Example 3');
is(completing_word('PWC 2024', ['pp', 'ww', 'cc']), '', 'Example Empty');
done_testing();

sub completing_word
{
     my ($str, $aref) = @_;
     $str =~ tr/01234567890 //ds;
     my %str_hash = word_hash($str);
     my @output;
     ELM: for my $elm ( @$aref )
     {
          my %elm_hash = word_hash($elm);
          for my $key ( keys %str_hash )
          {
               next ELM if (not exists $elm_hash{$key});
               next ELM if ($elm_hash{$key} < $str_hash{$key});
          }
          push @output, $elm;
     }
     
     if ( scalar @output == 0) { return ''; }
     else
     {
          @output = sort { length($a) <=> length($b) } @output;
          return $output[0];
     }
}


sub word_hash
{
     my $wrd = $_[0];
     my %hash;
     for my $chr ( split(//,$wrd ) )
     {
          $hash{ lc $chr }++;
     }
     return %hash;
}
