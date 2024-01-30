#!/usr/bin/env perl
use v5.36;

use Test2::V0 -srand => 1;


sub split_words
{
     my ($wds_aref, $sep) = @_;
     $sep = quotemeta $sep;
     my @output = 
          grep { length($_) > 0 }
          map { split(/$sep/, $_ ) } 
          @$wds_aref;
     return @output;
}

is(  join(" ", split_words([("one.two.three","four.five","six")], ".")),
     join(" ", ("one","two","three","four","five","six")) , 'Example 1' );
is(
     join(" ", split_words([('$perl$$', '$$raku$')], '$')),
     join(" ", ("perl", "raku")) , 'Example 2' );
done_testing();
