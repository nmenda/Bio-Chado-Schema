package Chado::Schema::Companalysis::Analysisprop;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("analysisprop");
__PACKAGE__->add_columns(
  "analysisprop_id",
  {
    data_type => "integer",
    default_value => "nextval('analysisprop_analysisprop_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "analysis_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "type_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "value",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("analysisprop_id");
__PACKAGE__->add_unique_constraint("analysisprop_pkey", ["analysisprop_id"]);
__PACKAGE__->add_unique_constraint("analysisprop_c1", ["analysis_id", "type_id", "value"]);
__PACKAGE__->belongs_to(
  "analysis_id",
  "Chado::Schema::Companalysis::Analysis",
  { analysis_id => "analysis_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:20
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:ZMURTRJrbEVWfUm+qQIJ5Q


# You can replace this text with custom content, and it will be preserved on regeneration
1;
