#!/usr/bin/env raku

#unit sub MAIN ($popularity,
#               *@lang where @lang.elems == $popularity.words.elems > 0
#                        && $popularity.words.repeated.elems == 0
#	                && $popularity.words.min == 1
#			&& $popularity.words.max == $popularity.words.elems,
#               :v(:$verbose));

my @lang =     <Perl Lisp R  C  SQL Ruby C++ Rust Lua >;
my @popularity = 29, 35, 19, 2,  9,   18,  3, 20,  31;

#my @popularity = $popularity.words>>.Int;
my %popularity;

for ^@popularity -> $index
{
  %popularity{@lang[$index]} = @popularity[$index];
 #say ": Language '{ @lang[$index] } with popularity { @popularity[$index] }" if $verbose;
}

my @output = @lang.sort({ %popularity{$^a} <=>  %popularity{$^b} });

say "(" ~ @output.map({ "'$_'" }).join(", ") ~ ")";
