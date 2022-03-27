#!/usr/bin/env perl
use strict;
use warnings FATAL => qw(all);

use Test::More;
use constant {MAX_INT => 2_147_483_647};

sub reverse_integer32
{

     my $num = $_[0];

     my $rev = reverse $num;
     $rev =~ tr/-//ds;
     $rev =~ s/^0+//;
     return $rev > MAX_INT ? 0 : $num < 0 ? 0 - $rev : $rev;
}

is(reverse_integer32(1234), 4321, 'Example 1');
is(reverse_integer32(-1234), -4321, 'Example 2');
is(reverse_integer32(1231230512), 0, 'Example 3');
is(reverse_integer32(1e3), 1, 'Example with 0');
is(reverse_integer32(-1e3), -1, 'Example with 0 and minus');



done_testing();
