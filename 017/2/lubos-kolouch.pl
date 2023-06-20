#!/usr/bin/env perl
use v5.36;

# I looked at jusr URI but it did not seem to work properly for the complex URL
use Mojo::URL;

sub decompose_url {
    my $what = shift;

    my $url = Mojo::URL->new($what);

    return $url;

}

#### ---------- MAIN -----------

my $what = 'jdbc:mysql://user:password@localhost:3306/pwc?profile=true#h1';

my $url = decompose_url($what);

say 'Scheme: ',   $url->scheme   if $url->scheme;
say 'Userinfo: ', $url->userinfo if $url->userinfo;
say 'Hostname: ', $url->host     if $url->host;
say 'Port: ',     $url->port     if $url->port;
say 'Path: ',     $url->path     if $url->path;
say 'Query: ',    $url->query    if $url->query;
say 'Fragment: ', $url->fragment if $url->fragment;

use Test::More;

is( decompose_url('jdbc://user:password@localhost:3306/pwc?profile=true#h1')->scheme, 'jdbc', 'Test scheme' );
is( decompose_url('jdbc://user:password@localhost:3306/pwc?profile=true#h1')->userinfo,
    'user:password', 'Test userinfo' );
is( decompose_url('jdbc://user:password@localhost:3306/pwc?profile=true#h1')->host, 'localhost',
    'Test host' );
is( decompose_url('jdbc://user:password@localhost:3306/pwc?profile=true#h1')->port, '3306', 'Test port' );
is( decompose_url('jdbc://user:password@localhost:3306/pwc?profile=true#h1')->path, '/pwc', 'Test path' );
is( decompose_url('jdbc://user:password@localhost:3306/pwc?profile=true#h1')->query,
    'profile=true', 'Test query' );
is( decompose_url('jdbc://user:password@localhost:3306/pwc?profile=true#h1')->fragment,
    'h1', 'Test fragment' );

done_testing();
