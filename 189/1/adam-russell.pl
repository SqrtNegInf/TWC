#!/usr/bin/env perl
use v5.36;
use strict;
use warnings;

sub greatest_character{
    my($characters, $target) = @_;
    return [sort {$a cmp $b} grep {$_ gt $target} @{$characters}]->[0] || $target;
}

MAIN:{
    say greatest_character([qw/e m u g/], q/b/);
    say greatest_character([qw/d c e f/], q/a/);
    say greatest_character([qw/j a r/],   q/o/);
    say greatest_character([qw/d c a f/], q/a/);
    say greatest_character([qw/t g a l/], q/v/);
}
