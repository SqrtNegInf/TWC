#!/usr/bin/env raku


my @languages = <Perl Lisp R  C  SQL Ruby C++ Rust Lua >;
my @popularity = 29, 35, 19, 2,  9,   18,  3, 20,  31;

my @pairs ;
for (0..@languages.elems - 1) -> $index {
   @pairs.push( (@popularity[ $index ] , @languages[ $index ] ) ) ;
}
my @sorted = @pairs.sort( { $^a[0] cmp $^b[0] } ) ;
print "(" ;
say @sorted.map( {$_[1]} ).join( ',' ) ~ ")" ;
