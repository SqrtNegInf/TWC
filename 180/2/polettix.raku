#!/usr/bin/env raku

sub trim (&cond, *@items) { grep {! &cond($_) }, @items }
sub trim_le ($i, *@items) { trim {$_ <= $i}, @items }

sub MAIN ($i is copy = 5, @args = (1,9,0,6,2,3,8,5,104)) {
   ($i, @args) = 3, 1, 4, 2, 3, 5 unless defined $i;
   my @trimmed = trim_le($i, @args);
   put '(' ~ @trimmed.join(',') ~ ')';
}
