#!/usr/bin/env raku

grammar URL {
    regex TOP { <scheme>':'(\/\/<authority>)?<path>(\?<query>)?('#'<fragment>)? }
    regex scheme { .+? }
    
    regex authority { (<userinfo>'@')?<host>(':'<port>)? }
    regex userinfo { .+ }
    regex host { <-[:]>+ }
    regex port { \d+ }
    
    regex path { <-[?]>* }
    regex query { .+? }
    regex fragment { .+ }
}

URL.parse('jdbc:mysql://user:password@localhost:3306/pwc?profile=true#h1');
quietly my $res = qq:to/END/;

scheme: $/.<scheme>	   
userinfo: $/.[0].<authority>.[0].<userinfo>
host: $/.[0].<authority>.<host>
port: $/.[0].<authority>.[1].<port>	     
path: $/.<path>
query: $/.[1].<query>
fragment: $/.[2].<fragment>
END
say $res;
