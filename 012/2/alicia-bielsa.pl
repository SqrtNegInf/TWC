#!/usr/bin/env perl
use v5.36;

my $separator = '/'; 
my @aPaths =('/a/b/c/d/1/2','/a/b/c/d/x/x','/a/b/c/d/a/b/c','/a/b/c/d/e/f/g/h');
my @aCommonPath = ();
 

foreach my $path ( @aPaths ){

   my @aDirectories = split ( $separator , $path );    
   unless ( scalar @aCommonPath ){
	  @aCommonPath = @aDirectories;
	  next;
   }

   foreach my $i ( 0..$#aDirectories ){ 
	  if ( defined($aCommonPath[$i]) && $aDirectories[$i]  ne $aCommonPath[$i]){
			 splice (@aCommonPath, $i , $#aCommonPath - ($i - 1));
	  }
   }
}

print "Common Directory path: " . join ( $separator,@aCommonPath ) ."\n";

 
