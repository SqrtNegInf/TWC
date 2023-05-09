#!/usr/bin/env perl
use v5.36;
use List::Util qw(max);
use Data::Printer;

#@ARGV = (grep {-d } glob('*')) unless @ARGV;

kDirDiff(<dir_a dir_b dir_c dir_d>);

sub kDirDiff {
  my (@dirs) = sort @_;

  my %dirEntries;
  my %maxLength;

  # Build filelist presence map 
  for my $dir (@dirs) {
    $maxLength{$dir} = length($dir);
    opendir(D, $dir);
    map { 
      $_ .= '/' if (-d "$dir/$_");
      $dirEntries{$_}{$dir}++;
      $maxLength{$dir} = max($maxLength{$dir}, length($_));
    } readdir(D);
  }

  # Create report
  my $fmt = join(' | ', map { "%-$maxLength{$_}s" } sort keys(%maxLength))."\n";
 
  printf($fmt, @dirs);
  printf($fmt =~ tr/ /-/r, map { '-' x $maxLength{$_} } @dirs);
  foreach my $f (sort keys %dirEntries) {
    printf($fmt, map { exists $dirEntries{$f}{$_} ? $f : '' } @dirs)
      unless (scalar @dirs == scalar keys %{$dirEntries{$f}});
  }
}
