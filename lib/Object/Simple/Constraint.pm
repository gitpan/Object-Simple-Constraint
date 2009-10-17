package Object::Simple::Constraint;

use warnings;
use strict;
use Exporter;
use Carp;

our $VERSION = '0.0301';

our @ISA = 'Exporter';
our @EXPORT_OK = qw( is_bool is_value is_ref is_str
                     is_num is_int is_scalar_ref is_array_ref is_hash_ref
                     is_code_ref is_regexp_ref is_glob_ref is_file_handle
                     is_object is_class_name isa );

sub is_bool{ !defined($_[0]) || $_[0] eq "" || "$_[0]" eq '1' || "$_[0]" eq '0' }
sub is_value{ defined($_[0]) && !ref($_[0]) }
sub is_num{
     require Scalar::Util;
     !ref($_[0]) && Scalar::Util::looks_like_number($_[0])
}
sub is_int{ defined($_[0]) && !ref($_[0]) && $_[0] =~ /^-?[0-9]+$/ }
sub is_str{ defined($_[0]) && !ref($_[0]) }
sub is_scalar_ref{ ref($_[0]) eq 'SCALAR' }
sub is_array_ref{ ref($_[0]) eq 'ARRAY' }
sub is_hash_ref{ ref($_[0]) eq 'HASH' }
sub is_code_ref{ ref($_[0]) eq 'CODE' }
sub is_regexp_ref{ ref($_[0]) eq 'Regexp' }
sub is_glob_ref{ ref($_[0]) eq 'GLOB' }

sub is_file_handle{
    require Scalar::Util;
    ref($_[0]) eq 'GLOB' && Scalar::Util::openhandle($_[0])
    or
    Scalar::Util::blessed($_[0]) && $_[0]->isa("IO::Handle")
}

sub is_object{
    require Scalar::Util;
    Scalar::Util::blessed($_[0]) && Scalar::Util::blessed($_[0]) ne 'Regexp' 
}
sub is_class_name{ defined($_[0]) && $_[0] =~ /^(\w+::)*\w+$/ }
sub isa{ eval{ $_[0]->isa( $_[1] ) } }

=head1 NAME

Object::Simple::Constraint - Constraints for Object::Simple [DISCOURAGED]

=head1 VERSION

Version 0.0301

=head1 CAUTION

This module is discouraged now, because I feel L<Object::Simple> do not need constraint funstions

=cut

=head1 SYNOPSIS
    
    This class provede many constraint function
    
    use Object::Simple::Constraint qw( is_str isa is_int );
    
    is_str( 'aaa' );
    isa( $obj, 'Some::Class' );
    is_int( 4 );
    
=head1 EXPORT

No function is exported.

All function can be exported.

    use Object::Simple::Constraint qw( isa is_object is_int is_str );

=head1 FUNCTIONS

=head2 is_bool

If it is boolean, return true.

( undef, "", 0, and 1 ) are boolean.
    
=cut

=head2 is_value

If it is value, return true.

Not reference value is value.

=cut

=head2 is_str

If it is string, return true.

Not reference value is string. This is same as value.

=cut

=head2 is_num

If it is number, return true.

If Scalar::Util::looks_like_number return true, it is number.

=cut

=head2 is_int

If it is integer, return true.

If regexp /^-?[0-9]+$/ is matched. it is integer.

=cut

=head2 is_ref

If it is reference, return true.

=cut

=head2 is_scalar_ref

If it is scalar reference, return true.

=cut

=head2 is_array_ref

If it is array reference, return true.

=cut

=head2 is_hash_ref

If it is hash reference, return true.

=cut

=head2 is_code_ref

If it is code reference, return true.

=cut

=head2 is_regexp_ref

If it is regular expression reference, return true.

=cut

=head2 is_glob_ref

If it is glob reference, return true.

=cut

=head2 is_file_handle

If it is file handle, return true.

If Scalar::Util::openhandle is true, it is file handle.

=cut

=head2 is_object

If it is objcet, return true.

Blessed value is object, except qr//.

=cut

=head2 is_class_name

If it is class name, return true.

If /^(\w+::)*\w+$/ is matched, it is class name.

=cut

=head2 isa

If it inherit a Class, return true.

    sub author{ ac constrain => sub{ isa 'Person' }, }

=cut

=head1 AUTHOR

Yuki Kimoto, C<< <kimoto.yuki at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-simo-constrain at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Object::Simple-Constraint>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.

=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Object::Simple::Constraint


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Object::Simple-Constraint>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Object::Simple-Constraint>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Object::Simple-Constraint>

=item * Search CPAN

L<http://search.cpan.org/dist/Object::Simple-Constraint/>

=back


=head1 See also

I study from Moose::Util::TypeConstraints and
Most of Object::Simple::Constrain functions is compatible of Moose::Util::TypeConstraints

L<Moose>,L<Moose::Util::TypeConstraints>

Scalar::Util is used in Object::Simple::Constrain

L<Scalar::Util>

=head1 COPYRIGHT & LICENSE

Copyright 2009 Yuki, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Object::Simple::Constraint
