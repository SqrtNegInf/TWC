#!/usr/bin/env perl
use v5.36;


use Time::Local;

foreach (1240229,"elephant",1234567,1111111,2222222,3333333){ 
	say $_,"  ",extractDate($_);
}

sub extractDate{
     if (shift=~/^(1|2)(\d{2})(\d{2})(\d{2})$/ ){
		 if (eval{timelocal( 0, 0, 0, $4, $3-1, ($1==1?19:20).$2)}){
			 return "".($1==1?19:20).$2."-$3-$4" 
		 }
		 else {
			 return "Invalid Date"
		 }
		 
	 }
	 else {
		 return "Must be seven digits starting with 1 or 2 "
	 }
}
 
     
    
