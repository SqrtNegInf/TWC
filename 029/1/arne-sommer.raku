#!/usr/bin/env raku

multi MAIN ($string where $string ~~ /^(.*?) \{ (.*?) \} (.*)/ = 'Perl {Daily,Weekly,Monthly,Yearly} Challenge')
{
  MAIN("$0$_$2") for $1.Str.split(",");
}

multi MAIN ($string)
{
  say $string;
}
