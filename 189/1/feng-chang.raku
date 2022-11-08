#!/usr/bin/env raku

my @C = qw/d c a f a/;

my $c = @C.pop;
put do given @C.grep(* gt $c).min {
    when 'a'..'z' { $_ }
    default       { $c }
}
