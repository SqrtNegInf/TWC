#!/usr/bin/env perl
use v5.36;

sub leading_slash{
    my($path) = @_;
    $path = "/" . $path if substr($path, 0, 1) ne "/";
    return $path;  
}

sub single_seperator{
    my($path) = @_;
    $path =~ s#\/\/#\/#;
    return $path;  
}

sub trailing_slash{
    my($path) = @_;
    chop($path) if substr($path, length($path) - 1, 1) eq "/";
    return $path; 
}

sub up_stay{
    my($path) = @_;
    my @directories = split(/\//, substr($path, 1)); 
    my @temp_path; 
    for my $d (@directories){
        push @temp_path, $d if $d ne "." && $d ne ".."; 
        pop @temp_path if $d eq ".."; 
        next if $d eq ".";      
    }  
    return "/" . join("/", @temp_path);   
}

sub canonical_path{
    my($path) = @_; 
    return up_stay(trailing_slash(single_seperator(leading_slash($path))));  
} 

MAIN:{
    while(<DATA>){
        chomp;
        print canonical_path($_) . "\n"; 
    }  
}

__DATA__
/a/
/a/b//c/
/a/b/c/../..
