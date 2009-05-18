use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'Object::Simple::Constraint',
    license             => 'perl',
    dist_author         => 'Yuki Kimoto <kimoto.yuki@gmail.com>',
    dist_version_from   => 'lib/Object/Simple/Constraint.pm',
    build_requires => {
        'Test::More' => 0,
    },
    requires => {
        'Scalar::Util' => 1.14
    },
    add_to_cleanup      => [ 'Object-Simple-Constraint-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
