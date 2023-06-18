#!/usr/bin/env perl
use v5.36;

use File::MMagic;
use constant TEXT_TYPE => "The file content is ascii.";
use constant BINARY_TYPE => "The file content is binary.";
 
my $fm = File::MMagic->new;
my $type = $fm->checktype_filename($0);
if($type=~m/text\//){ 
    print TEXT_TYPE . "\n";
}   
else{ 
    print BINARY_TYPE . "\n";
}   
