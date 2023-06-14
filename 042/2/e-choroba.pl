#!/usr/bin/env perl
use v5.36;

srand 1;

sub generate {
    return join "", map +('(', ')')[rand 2], 1 .. int rand 80
}

sub is_valid {
    my ($s) = @_;
    $s =~ s/\(\)//g while -1 != index $s, '()';
    return ! length $s
}


use Test::More tests => 4;
ok(is_valid('()'));
ok(is_valid('(())'));
ok(! is_valid(')('));
ok(! is_valid('())()'));

my $s = generate();
say $s, ' ', is_valid($s) ? "" : 'in', 'valid';
