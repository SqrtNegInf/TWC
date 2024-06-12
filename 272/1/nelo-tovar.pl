#!/usr/bin/env perl
use v5.36;

my @examples = ('1.1.1.1', '255.101.1.0');

sub defang_ip_address {
    my $ip = shift;
    $ip =~ s/\./\[\.\]/g;

    return $ip;
}

for my $elements (@examples) {
    my $dia = defang_ip_address $elements;

    say 'Input : $ip = ', $elements;
    say 'Output : ', $dia;
    say ' ';
}
