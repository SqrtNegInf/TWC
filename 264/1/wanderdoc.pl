#!/usr/bin/env perl
use strict;
use warnings;

use List::Util qw(uniq);
use Test2::V0 -srand => 1;

is(greatest_letter(q(PeRlwEeKLy)),'L', 'Example 1');
is(greatest_letter(q(ChaLlenge)),'L', 'Example 2');
is(greatest_letter(q(The)),'', 'Example 3');
done_testing();


sub greatest_letter
{
     my $str = $_[0];
     my %filter;
     for my $letter ( split(//, $str) )
     {
          push @{$filter{ lc $letter }}, ord($letter);
     }
     # use Data::Dump; dd \%filter;
     for my $key ( keys %filter )
     {
          @{$filter{$key}} = uniq @{$filter{$key}};
     }
     my @output = 
          sort { $b cmp $a }
          grep { scalar @{$filter{$_}} > 1 }  keys %filter;
     return $output[0] ? uc $output[0] : '';
}
