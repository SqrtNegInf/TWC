#!/usr/local/bin/perl
use v5.36;

use FFI::Platypus;

use constant JAPH => 'Perl is awesome';

my $ffi = FFI::Platypus->new;

# search libc
$ffi->lib(undef);

# C strcmp, 0 == values are equal
say $ffi->function(strcmp => [qw(string string)] => 'int')
  ->call('Perl is awesome', JAPH) == 0
  ? 'It sure is!'
  : 'Does not compute. Must be in an alternate dimension.';

