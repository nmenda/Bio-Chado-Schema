package Chado::Schema::Composite::FpKey;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("fp_key");
__PACKAGE__->add_columns(
  "feature_id",
  { data_type => "integer", default_value => undef, is_nullable => 1, size => 4 },
  "pkey",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 1,
    size => 1024,
  },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:26
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:d6qSEiDUoNrJd3IGr3KQtA


# You can replace this text with custom content, and it will be preserved on regeneration
1;
