#!/usr/bin/env raku


role LinkedList::Simple::Node
{
	has $.next is rw;

	method LinkedList
	{
		LinkedList::Simple.new( :head( self ) );
	}

	multi method append( $new-value )
	{
		self.append( $new-value but LinkedList::Simple::Node )
	}

	multi method append( LinkedList::Simple::Node $new-node )
	{
		self.next = $new-node
	}

	multi method perl()
	{
		nextsame
				}
}

role LinkedList::Simple does Iterable
{
	has LinkedList::Simple::Node $.head is rw;

	method from( *@nodes )
	{
		self.bless( :@nodes );
	}

	multi submethod BUILD( LinkedList::Simple::Node :$head, :@nodes )
	{
		$!head = my $node = $head // ( @nodes.shift but LinkedList::Simple::Node );
		$node = $node.append( $_ ) for @nodes;
	}

	method sequence()
	{
		$!head, *.next ... ! *.next.defined
	}

	method iterator()
	{
		self.sequence.iterator;
	}

	multi method perl()
	{
		"LinkedList::Simple.from({ self.sequence.map( *.perl ).join(', ') });"
	}

	method roughsort( Code $categorize )
	{
		sub dismantle( &categorize )
		{
			my $end;
			my $start;
			my $head-category = &categorize( self.head );

			gather
			{
				for self.flat -> $node
				{
					if ( $head-category == $node.&categorize )
					{
						take { :$start, :$end } with $end;

						$head-category .= not;
						$start = $node;
					}

					$end = $node;
				}

				take { :$start, :$end };
			}
		}

		sub assemble( $pieces )
		{
			my $first-node;
			my $last-frag;

			for $pieces.rotor( 2 => -1 ) -> ( $left, $right )
			{
				FIRST $first-node = $left<start>;
				LAST $last-frag = $right;

				$left<end>.next = $right<start>;
			}

			with $first-node
			{
				self.head = $first-node;
				$last-frag<end>.next = Any;
			}

			self;
		}

		assemble(
			dismantle( *.$categorize )
			.sort( not *<start>.$categorize ) );

	}
}

# run from here
test() and exit;

sub test
{
	use Test;

	my %tests =
		'2-5-6-7-13-14-18'    => [ 10, ( 2, 5, 13, 14, 6, 7, 18 ) ],
		#'2-5-6-7-13-14-18'    => [ 10, ( 13, 2, 5, 14, 6, 7, 18 ) ],
		#'1-2-3-4-11-12-13-14' => [ 10, ( 1, 11, 2, 12, 3, 13, 4, 14 ) ],
		#'1-1-1-1-2-2-2-2'     => [ 2,  ( 1, 2, 1, 2, 1, 2, 1, 2 ) ],
		#'1-2-2-4-3-5'         => [ 3,  ( 1, 4, 3, 2, 5, 2 ) ]
	;

	my &test = {
		ok LinkedList::Simple
			.from( $^test.value[1].flat )
			.roughsort( * < $^test.value[0] )
			.flat
			.join('-') eq $^test.key, $^test.key }
	;

	.&test for %tests;
}
