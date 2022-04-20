#!/usr/bin/env raku

my %h;
%h<a b c d> = ^4;

say %h;
say %h<a c>;


# Slice indexing
#
# Similar, we can use slicing for extracting slices from an array.
# Also see: https://docs.perl6.org/language/list#Range_as_slice

my @a = ^10;

say @a[0..2];
say @a[^2];
say @a[0..*];
say @a[0..Inf-1];
say @a[0..*-1];
say @a[0..^*-1];
say @a[0..^*/2];
