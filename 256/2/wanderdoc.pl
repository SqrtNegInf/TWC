#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use List::MoreUtils qw(mesh);
use Test2::V0 -srand => 1;

sub merge_strings
{
     return join('', 
          grep defined, 
               mesh(
                    @{[split(//,$_[0])]},
                    @{[split(//,$_[1])]}
                    )
               );
}

is(merge_strings("abcd", "1234"), "a1b2c3d4", "Example 1");
is(merge_strings("abc", "12345"), "a1b2c345", "Example 2");
is(merge_strings("abcde", "123"), "a1b2c3de", "Example 3");
done_testing();
