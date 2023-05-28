#!/usr/bin/env perl
use v5.36;

use Scalar::Util 'refaddr';
sub locate_memory { refaddr(ref($_[0]) ? $_[0] : \$_[0]) }

my $whatever = 42;
say locate_memory($whatever);
say locate_memory(\$whatever);
say locate_memory(\\$whatever);
say locate_memory(42);
say locate_memory(42);
say locate_memory(bless {}, 'Whatever');
