#!/usr/bin/env perl
use v5.36;

my $url = "HTTP://www.example.com:80/a%C2%B1b/%7Eusername";

my $scheme_re = qr<([hH][tT][tT][pP][sS]?)>;
my $ipv4_re = qr<(?:[0-9]{1,3}\.){3}[0-9]{1,3}>;
my $hostname_re = qr<[a-zA-Z0-9.\-]+>;
my $host_re = qr<($ipv4_re|$hostname_re)>;
my $port_re = qr<(?::([0-9]+))?>;
my $rest_re = qr<([a-zA-Z0-9/\-._~\?=&%#]*)>;

# Capitalizing letters in escape sequences
$url =~ s<%[a-zA-Z0-9]{2}>< uc($&) >ge;

sub decode_octet {
    my $octet = shift;
    my $hex = hex(substr($octet, 1, length($octet)));
    if (grep /^$hex$/, map ord, 'a'..'z', 'A'..'Z', '0'..'9', qw<- . _ ~>) {
        return chr($hex);
    } else {
        return $octet;
    }
}

# Decoding percent-encoded octets of unreserved characters
$url =~ s<%[a-zA-Z0-9]{2}>< decode_octet($&) >ge;

my ($scheme, $host, $port, $path) = $url =~
    m<^$scheme_re://$host_re$port_re$rest_re>;

die "Unable to decode URI" unless $scheme and $host;

# Converting the scheme and host to lower case
$scheme = lc($scheme);
$host = lc($host);

# Removing the default port
if (!$port || $scheme eq 'http' && $port == 80 || $scheme eq 'https' && $port == 443) {
    $port = '';
} else {
    $port = ":$port";
}

# Removing dot-segments
$path =~ s</\./|/\.$></>g; # Remove all '.'
$path =~ s</[^/]+/\.\.><>g; # Remove instances of the pattern: '/x/..'
$path =~ s<(\.\./)+><>g; # Remove all '..'s left at the beginning

print "$scheme://$host$port$path\n";
