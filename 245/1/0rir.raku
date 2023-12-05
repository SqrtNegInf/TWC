#!/usr/bin/env raku
use Test;

my @Test =
    ('perl', 'c', 'python'), (2, 1, 3), ('c', 'perl', 'python'),
    ('c++', 'haskell', 'java'), (1, 3, 2), ('c++', 'java', 'haskell'),
    <Perl Lisp R  C  SQL Ruby C++ Rust Lua >,
               (29, 35, 19, 2, 9, 18,3, 20, 31),
                        <C C++ SQL Ruby R Rust Perl Lua Lisp>
;

plan @Test ÷ 3;

sub sort-n-format-names-by-rank( @name, @rank) {
   '(' ~ ( @name Z @rank).sort( *[1] ).map( *[0]).join(", ") ~ ")"
}

for @Test -> @name, @rank, @exp {
    is sort-n-format-names-by-rank( @name, @rank), "(" ~ @exp.join( ", ") ~ ")";
}
done-testing;

my @lang =     <Perl Lisp R  C  SQL Ruby C++ Rust Lua >;
my @popularity = 29, 35, 19, 2,  9,   18,  3, 20,  31;

say "\nInput: @lang = @lang.raku()\n"
  ~ "       @popularity = @popularity[].raku()\nOutput: "
  ~ sort-n-format-names-by-rank( @lang, @popularity);
