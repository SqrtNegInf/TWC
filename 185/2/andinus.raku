#!/usr/bin/env raku
unit sub MAIN(@codes = ('ab-cde-123', '123.abc.420', '3abc-0010.xy'));

for @codes -> $code {
    my Int $count;
    for $code.comb {
        given $_ {
            when /\w/ { print ($count++ < 4 ?? "x" !! $_) }
            default { .print }
        }
    }
    put "";
}
