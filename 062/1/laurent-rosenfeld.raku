#!/usr/bin/env raku

sub normalize (Str $addr) {
    my ($box, $domain) = split /'@'/, $addr;
    $domain.uc ~ '@' ~ $box;
}
sub process-addresses( @addresses) {
    my @sorted = sort &normalize, @addresses;
    .say for @sorted;
}
multi sub MAIN (@files = ['input-list.txt']) {
    my @addresses = @files.IO.lines;
    process-addresses @addresses
}
