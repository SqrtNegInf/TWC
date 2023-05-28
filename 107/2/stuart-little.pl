#!/usr/bin/env perl
use v5.36;

use File::Basename;
no strict 'refs';

my $path = (scalar @ARGV) ? ($ARGV[0]) : ($INC{'warnings.pm'});
require $path;

my ($base,$dir,$ext) = fileparse($path,qr/\.[^.]*/);
my @special = qw(BEGIN END INIT CHECK UNITCHECK);

for my $key (sort keys %{$base . "::"}) {
    *glob = ${$base . "::"}{$key};
    if ((defined &glob) || (scalar grep {$_ eq $key} @special)) {
	say $key;
    }
}
