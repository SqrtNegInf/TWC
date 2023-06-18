#!/usr/bin/env perl
use v5.36;

# Solution:
# This can be solved with -X
my $filename = $0;
die "No filename passed" unless $filename;

# Let's make sure file exists first.
if (! -e $filename){
  die "That file doesn't exist.";
}

# Taken from `perldoc -f -X`
if (-d $filename){
  print "File is a directory.";
} elsif (-l $filename){
  print "File is a symbolic link.";
} elsif (-p $filename){
  print "File is a named pipe (FIFO), or Filehandle is a pipe.";
} elsif (-S $filename){
  print "File is a socket.";
} elsif (-b $filename){
  print "File is a block special file.";
} elsif (-c $filename){
  print "File is a character special file.";
} elsif (-t $filename){
  print "Filehandle is opened to a tty.";
} elsif (-T $filename){
  print "File is an ASCII or UTF-8 text file (heuristic guess).";
} elsif (-B $filename){
  print "File is a \"binary\" file (opposite of -T).";
}

print "\n";
