#!/usr/bin/env raku

sub MAIN ($url = 'jdbc:mysql://user:password@localhost:3306/pwc?profile=true#h1', :$verbose)
{
  if $url ~~
    /^
      (<[a..z]><[a..z 0..9 + . : \-]>*)\: # $0 scheme
      [\/\/                               # //
        [(.*[\:.+]?)\@]?                  # $1 userinfo (optional)
        (<[\w \. \-]>*)                   # $2 host
        [\:(\d+)]?                        # $3 port (optional)
	(\/?)                             # $4 path separator
      ]?                                  # $1-$4 are optional
      ([<[\w \d -] - [#?]>]+)?            # $5 path (optional)
      [\?(<[\w \d \- =]>*)]?              # $6 query (optional) 
      [\#(.*)]?                           # $7 fragment (optional)
    $/
  {

    say $/ if $verbose;

    say "scheme:   $0";
    say "userinfo: $1" if $1;
    say "host:     $2" if $2;
    say "port:     $3" if $3;

    my $path = $4 if $4; $path ~= $5 if $5;

    say "path:     $path";
    say "query:    $6" if $6;
    say "fragment: $7" if $7;
  }
  else
  {
    say "Invalid URL.";
  }
}
