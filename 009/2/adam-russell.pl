#!/usr/bin/env perl
use v5.36;

use boolean;
use Tie::RefHash;

die 'not ok - disabled: equal-value rankings not stable in output';

srand 1;

package Thing{
    use boolean;  
    sub new{ 
        my ($pkg, $values) = (@_);  
        my $attributes = {
            score => $values->{score} || -1,
            name  => $values->{name}  || ""  
        };
        return bless($attributes, $pkg);  
    }  
    sub get_score{
        my($self) = @_;  
        return $self->{score};  
    }  
    sub get_name{
        my($self) = @_;  
        return $self->{name};  
    }  
    true;  
};    

##
# sorting and ranking functions   
##   
sub sorter{
    my($a, $b, $accessor_function) = @_; 
    return $a->$accessor_function <=> $b->$accessor_function;   
}

sub standard_rank{
    my($sorted_objects, $accessor_function) = @_; 
    my %ranking; 
    my $rank = 1; 
    my $current_rank; 
    my $previous; 
    tie %ranking, "Tie::RefHash"; 
    for my $o (@{$sorted_objects}){
        my $a = $o->$accessor_function;
        if(!$previous){
            $previous = $a; 
            $ranking{$o} = $rank; 
            $current_rank = $rank; 
        } 
        else{
            if($previous == $a){
                $ranking{$o} = $current_rank;
                $rank++;  
            }  
            if($previous != $a){
                $previous = $a; 
                $rank++;  
                $ranking{$o} = $rank; 
                $current_rank = $rank; 
            }  
        }  
    }   
    return \%ranking; 
} 

sub modified_rank{
    my($sorted_objects, $accessor_function) = @_; 
    my %ranking; 
    my $rank = 1; 
    my $current_rank = 1; 
    my $previous; 
    my $has_previous = false;
    tie %ranking, "Tie::RefHash"; 
    for my $o (@{$sorted_objects}){
        my $a = $o->$accessor_function;
        if(!$previous){
            $previous = $o; 
            $ranking{$o} = $current_rank; 
        } 
        else{
            if($previous->get_score() == $a){
                if(!$has_previous && $current_rank != 1){
                    $has_previous = true;
                    $current_rank++;
                }
                $ranking{$previous} = $current_rank;
                $ranking{$o} = $current_rank;
            }  
            if($previous->get_score() != $a){
                $has_previous = false;
                $previous = $o; 
                $ranking{$o} = $rank ; 
                $current_rank = $rank;
            }  
        }  
        $rank++;    
    }   
    return \%ranking; 
} 

sub dense_rank{
    my($sorted_objects, $accessor_function) = @_; 
    my %ranking; 
    my $rank = 1; 
    my $current_rank; 
    my $previous; 
    tie %ranking, "Tie::RefHash"; 
    for my $o (@{$sorted_objects}){
        my $a = $o->$accessor_function;
        if(!$previous){
            $previous = $a; 
            $ranking{$o} = $rank; 
            $current_rank = $rank; 
        } 
        else{
            if($previous == $a){
                $ranking{$o} = $current_rank;
            }  
            if($previous != $a){
                $previous = $a; 
                $rank++;  
                $ranking{$o} = $rank; 
                $current_rank = $rank; 
            }  
        }  
    }   
    return \%ranking; 
} 
 
##
# Main   
##
my @things; 
my $rankings; 
my @characters = ("A".."Z");
for(0..9){
    my $string;
    $string .= $characters[rand @characters] for 1..3; 
    push @things, Thing->new({score => int(rand(10)+1), name => $string});  
}  
@things = sort {sorter($a, $b, \&Thing::get_score)} @things; 
$rankings = standard_rank(\@things, \&Thing::get_score); 
print "Name\tScore\tRank\n";
foreach my $key (sort {$rankings->{$a} <=> $rankings->{$b}} keys %{$rankings}) {
    printf("%s\t%d\t%d\n", $key->get_name(), $key->get_score(), $rankings->{$key});
}
print "================\n";
$rankings = modified_rank(\@things, \&Thing::get_score); 
foreach my $key (sort {$rankings->{$a} <=> $rankings->{$b}} keys %{$rankings}) {
    printf("%s\t%d\t%d\n", $key->get_name(), $key->get_score(), $rankings->{$key});
}
print "================\n";
$rankings = dense_rank(\@things, \&Thing::get_score); 
foreach my $key (sort {$rankings->{$a} <=> $rankings->{$b}} keys %{$rankings}) {
    printf("%s\t%d\t%d\n", $key->get_name(), $key->get_score(), $rankings->{$key});
}
