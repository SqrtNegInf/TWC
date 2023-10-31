#!/usr/bin/env perl
use v5.36;

#die "At least 2 elements required" unless @ARGV > 1;

my $chk = 'ppp';
my @str = ("Perl", "Python", "Pascal");

join("", map { lc(substr($_,0,1)) } @str) eq lc($chk)
  ? print "true\n"
  : print "false\n";
