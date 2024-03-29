#!/usr/bin/env raku

sub factorize(Int $N) {
    my $n = $N;
    my @primeFactors;

    while $n %% 2 {
        @primeFactors.push(2);
        $n /= 2;; 
    } 
     
    loop (my $i = 3; $i <= $n.sqrt; $i += 2)  { 
        while ($n %% $i) { 
            @primeFactors.push($i); 
            $n /= $i; 
        } 
    } 
     
    if $n > 2 { 
        @primeFactors.push($n);
    }

    return @primeFactors;
}

sub MAIN(
    @int  = [11,8,27,4]
) {
    say q{(},
    @int.sort({ factorize($^a).elems <=> factorize($^b).elems }).join(q{, }),
    q{)};

}
