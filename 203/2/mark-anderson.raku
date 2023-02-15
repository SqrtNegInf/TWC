#!/usr/bin/env raku

my $source      = 'a/b/c'.IO;
my $destination = 'x/y'.IO;

mkdir $destination.add: .basename for $source.dir;
