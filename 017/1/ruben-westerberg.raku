#!/usr/bin/env raku
my ($m,$n)=(1,2);

my ($ack,$iter)=acker($m,$n);
put "Ackerman value for (m=$m, n=$n): $ack  in $iter recursions";


sub acker($m,$n){
	my $counter; ##Use dynamic variable as counter. Wrap in lexical scope.
	sub iacker (\m,\n) {
		$counter++; 	#Increment the recursion counter for informational purposes.
		say "Recursion "~$counter;
		my $y;
		if m==0 { $y=n+1}
		else {
			if n==0 {
				$y= iacker(m-1,1);
			}
			else {
				$y= iacker(m-1,iacker(m,n-1));	
			}
		}
		$y;
	}
	(iacker($m,$n), $counter); #Call internal ackerman function.
}

