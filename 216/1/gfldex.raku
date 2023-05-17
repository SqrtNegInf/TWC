#!/usr/bin/env raku
# from: https://gfldex.wordpress.com/2023/05/10/coercing-coercion/
#  and: https://gfldex.wordpress.com/2023/05/17/plucking-strings/

role Trans[::From, ::To, &c] {
    has To $.value;
    method COERCE(From:D $old) {
        self.new(:value($old.&c))
    }

    unless ::?ROLE.^declares_method(my $mname = To.^name) {
        ::?ROLE.^add_method: $mname, ('my method ' ~ $mname ~ '(--> To) { $.value }').EVAL;
    }
}

for [('abc', 'abcd', 'bcd'), 'AB1 2CD'; ('job', 'james', 'bjorg'), '007 JB'; ('crack', 'road', 'rac'), 'C7 RA2'] -> [@words, $reg] {
    say @words.grep($reg.lc.comb.grep(/<alpha>/) ⊆ *.comb);
}
