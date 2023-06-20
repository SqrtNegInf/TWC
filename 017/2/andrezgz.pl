#!/usr/bin/env perl
use v5.36;

my $uri = shift || 'jdbc:mysql://user:password@localhost:3306/pwc?profile=true#h1';

my ($scheme, $auth, $path, $query, $frag, $userinfo, $host, $port);

($scheme, $auth, $path, $query, $frag) = uri_split($uri);
($userinfo, $host, $port) = auth_split($auth) if $auth;

show('scheme',$scheme);
show('userinfo',$userinfo);
show('host',$host);
show('port',$port);
show('path',$path);
show('query',$query);
show('fragment',$frag);

#based on URI::Split
sub uri_split {
     return $_[0] =~ m|
                        ^                       # string start
                        ([^/?\#]+) :            # scheme
                        (?: // ([^/?\#]*) )?    # authority (optional)
                        ([^?\#]*)               # path
                        (?: \? ([^\#]*) )?      # query (optional)
                        (?: \# (.*) )?          # fragment (optional)
                        $                       # string end
                    |x;
}

sub auth_split {
     return $_[0] =~ m|
                        (?: ([^@]+) @ )?        # userinfo (optional)
                        ([^:/?\#]+)             # host
                        (?: : (\d+) )?          # port (optional)
                    |x;
}

sub show {
    my $name = shift . ':';
    my $value = shift || '';
    print sprintf("%-10s%s\n",$name,$value);
}
