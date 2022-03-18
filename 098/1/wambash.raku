#!/usr/bin/env raku

sub read-n ($file,$number) {
    state  %files;
    LEAVE {%files{$file} .= tail(*-$number) }
    %files{$file} //= $file.IO.open.comb(:close);
    return %files{$file}.cache.head($number).join;
}

#multi MAIN (Bool :$test!) {
    use Test;
    is read-n('input.txt', 4), '1234';
    is read-n('input.txt', 4), '5678';
    is read-n('input.txt', 2), '90';
    done-testing;
#}
