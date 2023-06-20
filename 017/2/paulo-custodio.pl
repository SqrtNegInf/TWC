#!/usr/bin/env perl
use v5.36;

my $url = 'http://user:password@localhost:3306/pwc?profile=true#h1';
my $word = qr{ [a-z_] [a-z_0-9+.-]* }ix;
my $path = qr{ (?: $word | / )+ }ix;
$url =~ m{^             (?<scheme>      $word   ) [:]
            (?:
                //
                (?:     (?<userinfo>    $word   (?: [:] .*? )? ) [@] )?
                        (?<host>        $word   )
                (?: [:] (?<port>        \d+     )       )?
            )?
                        (?<path>        $path   )
            (?: [?]     (?<query>       .*?     )       )?
            (?: [#]     (?<fragment>    .*?     )       )?
          $}ix
    or die "Invalid URL $url\n";

say "scheme:   ", $+{scheme}    // "";
say "userinfo: ", $+{userinfo}  // "";
say "host:     ", $+{host}      // "";
say "port:     ", $+{port}      // "";
say "path:     ", $+{path}      // "";
say "query:    ", $+{query}     // "";
say "fragment: ", $+{fragment}  // "";
