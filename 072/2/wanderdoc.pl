#!/usr/bin/env perl
use v5.36;

use File::Spec;
my $FROM = shift || 3;
my $TO   = shift || 6;

my $tempfile = File::Spec->catfile(File::Spec->tmpdir(), 'input.txt');


{
     open my $out, ">", $tempfile or die "$!";
     for my $i ( 1 .. 100 )
     {
          print {$out} "L${i}", $/;
     }
}

{

     open my $in, "<", $tempfile or die "$!";


     while ( my $line = <$in> )
     {
          next if $. < $FROM;

          last if $. > $TO;
          print $line;
     }
}

unlink $tempfile or die "$!";
