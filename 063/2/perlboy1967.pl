#!/usr/bin/env perl

while ($_ = <DATA>) {
  my ($word, $n) = $_ =~ /(\S+)\s+(\d+)/;

  printf "rotateWord('%s', %d) => '%s'\n", 
         $word, $n, rotateWord($word, $n);
}
  
sub rotateWord {
  my ($word, $rotateNtimes) = @_;

  my @chars = split(//, $word);

  push(@chars, splice(@chars, 0, $rotateNtimes % scalar(@chars)));

  return join('', @chars);
}

__END__
xyxx 8
