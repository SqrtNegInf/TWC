#!/usr/bin/env perl
use v5.36;

my %tree=(
  '' => [qw(a e i o u)],
  a => [qw(e i)],
  e => [qw(i)],
  i => [qw(a e o u)],
  o => [qw(a u)],
  u => [qw(o e)],
    );

print map {"$_\n"} generate(3,\%tree);

sub generate {
  my ($len,$tree)=@_;
  my @list=('');
  while (1) {
    if (length($list[0])==$len) {
      last;
    }
    my $r=shift @list;
    my $s=substr($r,-1,1) || '';
    foreach my $extension (@{$tree{$s}}) {
      push @list,$r.$extension;
    }
  }
  return @list;
}
