#!/usr/bin/env perl
use strict;
use warnings;

use Test2::V0 -srand => 1;



sub find_diff_char
{
     my ($first, $second) = @_;
     if ( length($second) < length($first) )
     {
          ($first, $second) = ($second, $first);
     }
     my (%first_chars, %second_chars);
     %first_chars = map { $_, $first_chars{$_}++ } split(//, $first);
     %second_chars = map { $_, $second_chars{$_}++ } split(//, $second);
     my @output;
     for my $chr ( keys %second_chars )
     {
          no autovivification;
          push @output, $chr and next unless exists $first_chars{$chr};
          push @output, $chr if ( $second_chars{$chr} > $first_chars{$chr} );
     }
     return @output;
}



is(find_diff_char('Perl', 'Preel'), @{["e"]}, 'Example 1');
is(find_diff_char('Weekly', 'Weeakly'), @{["a"]}, 'Example 2');
is(find_diff_char('Box', 'Boxy'), @{["y"]}, 'Example 3');
done_testing();
