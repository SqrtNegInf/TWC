#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test2::V0 -srand => 1;

sub missing_members
{
     my ($aref_1, $aref_2, $flag_unique, $flag_nonempty) = @_;
     my (@missing_1_from_2, @missing_2_from_1);
     my ($vec_1, $vec_2);
     vec($vec_1, $_, 1) = 1 for @{$aref_1};
     vec($vec_2, $_, 1) = 1 for @{$aref_2};
     @missing_1_from_2 = grep { vec($vec_2, $_, 1) != 1 } @{$aref_1};
     @missing_2_from_1 = grep { vec($vec_1, $_, 1) != 1 } @{$aref_2};
     if ( defined $flag_unique )
     {
          _unique($_) for ( \@missing_1_from_2, \@missing_2_from_1 );
     }
     if ( defined $flag_nonempty )
     {
          return _nonempty([@missing_1_from_2], [@missing_2_from_1]);
     }
     else
     {
          return ([@missing_1_from_2], [@missing_2_from_1]);
     }
}

sub _unique
{
     my %seen;
     @{$_[0]} = grep {! $seen{$_}++ } @{$_[0]};
}


sub _nonempty
{
     return grep { scalar(@$_) > 0 } @_;
}


is([missing_members([1, 2, 3], [2, 4, 6], 1)], [[1, 3], [4, 6]], 'Example 1');
is([missing_members([1, 2, 3, 3], [1, 1, 2, 2], 'y', 'y')], [[3]], 'Example 2');
done_testing;
