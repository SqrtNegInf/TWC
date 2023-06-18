#!/usr/bin/env perl
use v5.36;

use File::Type;

my $filename = $0;
my $ft = File::Type->new();
my $type = $ft->mime_type($filename);

say "The file contents is $type";
