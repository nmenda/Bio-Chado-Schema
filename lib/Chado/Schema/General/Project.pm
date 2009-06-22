package Chado::Schema::General::Project;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("project");
__PACKAGE__->add_columns(
  "project_id",
  {
    data_type => "integer",
    default_value => "nextval('project_project_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "name",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
);
__PACKAGE__->set_primary_key("project_id");
__PACKAGE__->add_unique_constraint("project_pkey", ["project_id"]);
__PACKAGE__->add_unique_constraint("project_c1", ["name"]);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:p9lmv/LvWNAK7dIZIXJ1bQ


# You can replace this text with custom content, and it will be preserved on regeneration
1;
