#!/usr/bin/env perl
use v5.36;

use Encode 'decode';
use Text::Unidecode;

binmode STDOUT, ':utf8';
my $n = decode ('UTF-8', 'Katie');

# Prune the leading consonants, if any.
# Turn all vowels into ASCII equivalents for detection purposes
# Assume that anything which isn't a vowel is a consonant.
my ($consonants) = unidecode ($n) =~ /^([^aeiou]*)/i;
my $trail = lc $n;
my $s = substr ($trail, 0, length ($consonants), '');

my ($trimlead, $trimrest) = ('' ne $s) ? split //, lc ($s), 2 : ('', '');
$trimlead = unidecode ($trimlead);

# Closure to handle leading b, f, m special cases.
sub lead {
	my $l = shift;
	return ($trimlead eq $l ? $trimrest : $l) . $trail;
}

my %h;
$h{$_} = lead ($_) for qw/b f m/;

print <<EOT;
$n, $n, bo-$h{b}
Bonana-fanna fo-$h{f}
Fee fi mo-$h{m}
$n!

EOT
