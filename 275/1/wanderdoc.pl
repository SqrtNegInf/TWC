#!/usr/bin/env perl
use v5.36;

use Test2::V0 -no_srand;

is(check_keys(q(Perl Weekly Challenge), [qw(l a)]), 0, q(Example 1));
is(check_keys(q(Perl and Raku), [qw(a)]), 1, q(Example 2));
is(check_keys(q(Well done Team PWC), [qw(l o)]), 2, q(Example 3));
is(check_keys(q(The joys of polyglottism), [qw(T)]), 2, q(Example 4));
done_testing();





sub check_keys
{
     my $sentence = $_[0];
     my $keys_aref = $_[1];
     my $re_ltr = do { my $ltr_str = join('|', @$keys_aref); qr/$ltr_str/i; };
     my $counter = 0;
     for my $word ( split(/\s/, $sentence ) )
     {
          next if $word =~ /$re_ltr/;
          $counter++;
     }
     return $counter;
}
