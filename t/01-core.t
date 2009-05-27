use Test::More 'no_plan';

BEGIN {
	use_ok( 'Object::Simple::Constraint', qw( is_bool is_value is_ref is_str
                                   is_num is_int is_scalar_ref is_array_ref is_hash_ref
                                   is_code_ref is_regexp_ref is_glob_ref is_file_handle
                                   is_object is_class_name isa )
    );
}


{
    ok( is_bool( 0 ), 'is_bool true 1' );
    ok( is_bool( undef ), 'is_bool true 2' );
    ok( is_bool( 1 ), 'is_bool true 3' );
    ok( is_bool( "" ), 'is_bool true 4' );
    
    ok( !is_bool( 2), 'is_bool false' );
}

{
    ok( is_value( 'a' ), 'is_value true' );
    
    ok( !is_value( undef ), 'is_value false 1' );
    
    ok( !is_value( [] ), 'is_value false 2' );
}

{
    ok( is_str( 'a' ), 'is_str true' );
    
    ok( !is_str( undef ), 'is_str false 1' );

    ok( !is_str( [] ), 'is_str false 2' );
}

{
    ok( is_num( 1.654 ), 'is_num true' );
    
    ok( !is_num( undef ), 'is_num false 1' );
    
    ok( !is_num( 'a' ), 'is_num false 2' );
}

{
    ok( is_int( 255 ), 'is_int true' );
    
    ok( !is_int( undef ), 'is_int false 1' );
    
    ok( !is_int( 1.2 ), 'is_int false 2' );
}

{
    ok( is_scalar_ref( \do{ 1 } ), 'is_scalar_ref true' );
    
    ok( !is_scalar_ref( undef ), 'is_scalar_ref false 1' );
    
    ok( !is_scalar_ref( [] ), 'is_scalar_ref false 2' );
}

{
    ok( is_array_ref( [] ), 'is_array_ref true' );
    
    ok( !is_array_ref( undef ), 'is_array_ref false 1' );
    
    ok( !is_array_ref( {} ), 'is_array_ref false 2' );
}

{
    ok( is_hash_ref( {} ), 'is_hash_ref true' );
    
    ok( !is_hash_ref( undef ), 'is_hash_ref false 1' );
    
    ok( !is_hash_ref( [] ), 'is_hash_ref false 2' );
}

{
    ok( is_code_ref( sub{} ), 'is_code_ref true' );
    
    ok( !is_code_ref( undef ), 'is_code_ref false 1' );
    
    ok( !is_code_ref( [] ), 'is_code_ref false 2' );
}

{
    ok( is_regexp_ref( qr// ), 'is_regexp_ref true' );
    
    ok( !is_regexp_ref( undef ), 'is_regexp_ref false 1' );
    
    ok( !is_regexp_ref( [] ), 'is_regexp_ref false 2' );
}

{
    ok( is_glob_ref( \*a ), 'is_glob_ref true' );
    
    ok( !is_glob_ref( undef ), 'is_glob_ref false 1' );
    
    ok( !is_glob_ref( [] ), 'is_glob_ref false 2' );
}

{
    require File::Temp;
    my $fh = File::Temp::tempfile();
    ok( is_file_handle( $fh ), 'is_file_handle true' );
    
    ok( !is_file_handle( undef ), 'is_file_handle false 1' );
    
    ok( !is_file_handle( \*a ), 'is_file_handle false 2' );
    
    close $fh;
}

{
    my $obj = bless {}, 'A';
    ok( is_object( $obj ), 'is_object true' );
    
    ok( !is_object( undef ), 'is_object false 1' );
    
    ok( !is_object( [] ), 'is_object false 2' );
    
    ok( !is_object( qr// ), 'is_object false 3' );
}

{
    ok( is_class_name( 'A' ), 'is_class_name true 1' );
    ok( is_class_name( 'A::B' ), 'is_class_name true 2' );
    
    ok( !is_class_name( undef ), 'is_class_name false 1' );
    
    ok( !is_class_name( 'A::' ), 'is_class_name false 2' );
    
    ok( !is_class_name( '::B' ), 'is_class_name false 2' );
    
    ok( !is_class_name( '-' ), 'is_class_name false 3' );
}

{
    my $obj = bless {}, 'A';
    ok( isa( $obj, 'A' ), 'isa true 1' );
    
    ok( !isa( undef, 'A' ), 'isa undef' );
    
    ok( !isa( $obj, '-' ) , 'isa -' );
    
    ok( !isa( $obj, 'B' ), 'isa false 1' );
}
