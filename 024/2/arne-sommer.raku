#! /usr/bin/env perl6

#sub MAIN (*@files where @files.elems >= 1, :$index = "index.txt")
sub MAIN ()
{
  my %index;
  for <sample.txt sample1.txt sample2.txt> -> $file
  {
    die "No such file: $file"    unless $file.IO.e;
    die "Unreadable file: $file" unless $file.IO.r;

    my @words = (slurp $file).words;

    @words.map({ %index{$_}.{$file} = True });
  }

  #die "Unable to write index" unless my $fh = open $index, :w;
  say("$_:{ %index{$_}.keys.sort.join(",") }") for %index.keys.sort;
  #$fh.close;
}
