#!/usr/bin/env perl
use v5.36;

use Devel::Peek qw(Dump);

my $foo = "this is a string";
my $foo_ref = \$foo;
$foo_ref =~ m/(SCALAR|ARRAY|HASH)\((.*)\)/;

say "The variable head is stored at $2";
my $det = $1 eq 'ARRAY' ? 'an' : 'a';
say "The variable is $det \L$1";
say "-" x 25;
say '';

Dump $foo;
