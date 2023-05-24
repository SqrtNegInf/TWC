#!/usr/bin/env perl
use v5.36;

use Text::Banner;

my $size = 4;
my $shift = $size - 2;
my $banner = Text::Banner->new;
$banner->fill ('#');
$banner->size ($size);

$banner->set ('o');
my $out = $banner->get;
$out =~ s/^\s{$shift}//mg;

$banner->set ('+');
$out .= $banner->get;
$out =~ s/\n\s*\n/\n/g;

print $out;

