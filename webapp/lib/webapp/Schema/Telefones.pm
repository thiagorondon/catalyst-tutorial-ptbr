package webapp::Schema::Telefones;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("telefones");
__PACKAGE__->add_columns(
  "id",
  { data_type => "INT", default_value => undef, is_nullable => 0, size => 11 },
  "nome",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
  "telefone",
  {
    data_type => "VARCHAR",
    default_value => undef,
    is_nullable => 1,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("id");


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-01-29 14:39:38
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Oe4WozNlAGfHMCQ0LmYVEA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
