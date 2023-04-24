#!/usr/bin/env raku

sub FunSort (@list) {
     return @list if @list.elems == 1;

     my %split  = @list.classify:{ $_ %% 2 ?? 'even' !! 'odd' };
     my @evens  = |%split<even>.sort;
     my @odds   = |%split<odd>.sort;
     my @retval = |@evens, |@odds;
} # end of sub MAIN (ℕ @list)

use Test;
my @list;

@list = (1,2,3,4,5,6);
ok FunSort(@list), (2,4,6,1,3,5);

@list = (1,2);
ok FunSort(@list), (2,1);

@list = (1);
ok FunSort(@list), (1);

#@list = (1..^100).pick(50).grep: (* > 0);
#say FunSort(@list);

