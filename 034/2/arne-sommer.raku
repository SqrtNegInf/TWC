#!/usr/bin/env raku

#die 'not ok';

my $value = 10;

my %dispatch =
(
  q      => &last,
  quit   => &last, 
  d      => &double,
  double => &double,
  h      => &half,
  half   => &half,
  c      => &clear,
  clear  => &clear,
  help   => &help,
);

#loop
#{
  my $command = 'd'; #prompt "[$value]: ";

  say $value;
  if %dispatch{$command}     { %dispatch{$command}(); }
  elsif $command ~~ /^(\d)$/ { set($0.Int); }
  say $value;
#}

sub last
{
  exit;
}

sub double
{
  $value *= 2;
}

sub half
{
  $value /= 2;
}

sub clear
{
  $value = 0;
}

sub set ($new)
{
  $value = $new;
}

sub help
{
  say "Please consult a doctor.";
}
