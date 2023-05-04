#!/usr/bin/env perl
use v5.36;
use List::Util qw(max uniq);

my @paths = map s/\n//r, <DATA>;

say compath(@paths);    

sub compath {
    my $l = max(map length,@_)-1;
    uniq(@_)==1 ? pop : compath( map s/(.{$l}).$/$1/r, @_ )
}

__DATA__
/a/b/c/1/x.pl
/a/b/c/d/e/2/x.pl
/a/b/c/d/3/x.pl
/a/b/c/4/x.pl
/a/b/c/d/5/x.pl
