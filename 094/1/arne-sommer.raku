#!/usr/bin/env raku

my $dictionary = "/usr/share/dict/words";

my @S        = <opt bat saw tab pot top was> unless @S;
my %dict  = $dictionary.IO.lines.grep(* !~~ /\W/).Set;
my %seen;
my @lines;

for @S -> $word
{
  my $sorted = $word.comb.sort.join;

  next if %seen{$sorted};

  %seen{$sorted} = True;

  @lines.push: "(" ~ $word.comb.permutations>>.join.unique.grep({ %dict{$_} }).map({ '"' ~ $_ ~ '"' }).join(", ") ~ ")";
}

say "[ ", @lines.grep(*.chars > 2).join(",\n"), " ]";
