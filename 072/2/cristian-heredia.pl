#!/usr/bin/env perl
use strict;
use warnings;

my $file_name = 'input.txt';
my $A = $ARGV[1] // 3;
my $B = $ARGV[2] // 6;
my $count;

#In case is needed to create the file and filing it
#createFile();
sub createFile {
    foreach (my $i=1; $i<=100; $i++){
        open (F, ">>$file_name") || die "Could not open file: $!\n";
        print F "L$i\n";
        close F;
    }
}

#First we check that the file exists
if  ( !-f $file_name) {
    die "the file $file_name doesn't exist\n";
}

#We check $A <= $B
if ($A >= $B) {
    die "$A isn't smaller that $B\n";
}

printLines();

sub printLines {
    
    open(FILE, $file_name) or die "Could not read from $file_name\n";

    $count = 1;
    while (<FILE>) {
        if ($count > $B) {
            close FILE;
            exit;
        }
        if ($count >= $A) {
            print $_;
        }
      $count++;
    }
}

