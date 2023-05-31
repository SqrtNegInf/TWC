#!/usr/bin/env perl
use v5.36;

sub find_insert{
    my($list, $n) = @_;
    if($n < $list->[0]){
        unshift @{$list}, $n;
        return 0;
    }
    if($n > $list->[@{$list} - 1]){
        push @{$list}, $n;
        return @{$list} - 1;
    }
    for(my $i = 0; $i < (@{$list} - 1); $i++){
        return $i if $n == $list->[$i];
        if($n > $list->[$i] && $n < $list->[$i + 1]){
            splice(@{$list}, $i, 2, ($list->[$i], $n, $list->[$i + 1]));
            return $i + 1;
        }
    }
}


MAIN:{
    my(@N, $N, $i);
    @N = (1, 2, 3, 4);
    $N = 3;
    $i = find_insert(\@N, $N);
    print "$i\n"; 
    
    @N = (1, 3, 5, 7);
    $N = 6;
    $i = find_insert(\@N, $N);
    print "$i\n"; 
    
    @N = (12, 14, 16, 18);
    $N = 10;
    $i = find_insert(\@N, $N);
    print "$i\n"; 
    
    @N = (11, 13, 15, 17);
    $N = 19;
    $i = find_insert(\@N, $N);
    print "$i\n"; 
}

