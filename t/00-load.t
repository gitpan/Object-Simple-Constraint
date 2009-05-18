#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'Object::Simple::Constraint' );
}

diag( "Testing Object::Simple::Constraint $Object::Simple::Constraint::VERSION, Perl $], $^X" );
