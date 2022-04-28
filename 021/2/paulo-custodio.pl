#!/usr/bin/env perl

use Modern::Perl;

sub decode_triplets {
    my($hex) = @_;
    my $c = chr(hex($hex));
    return $c if $c =~ /[a-zA-Z0-9\-._~]/;
    return '%'.uc($hex);
}

sub norm_uri {
    my($uri) = @_;
    for ($uri) {
        # Converting percent-encoded triplets to uppercase
        s/(\%[0-9a-f]{2})/\U$1/gi;

        # Converting the scheme and host to lowercase
        s/^(\w+:\/\/)((.*?@)?)(.*?\/)/\L$1\E$2\L$4/;

        # Decoding percent-encoded triplets of unreserved characters
        s/(\%([0-9a-f]{2}))/ decode_triplets($2) /gie;

        # Removing dot-segments
        s/\/\.\//\//g;
        s/\/[^\/]+\/\.\.\//\//g;

        # Converting an empty path to a "/" path
        s/^(\w+:\/\/[^\/]+)$/$1\//;

        # Removing the default port
        s/^(http:\/\/[^\/]+?):80\//$1\//;
    }
    return $uri;
}

my $uri = "HTTP://www.example.com:80/a%C2%B1b/%7Eusername";
say norm_uri($uri);
