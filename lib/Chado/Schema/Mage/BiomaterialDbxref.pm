package Chado::Schema::Mage::BiomaterialDbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("biomaterial_dbxref");
__PACKAGE__->add_columns(
  "biomaterial_dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('biomaterial_dbxref_biomaterial_dbxref_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "biomaterial_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "dbxref_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
);
__PACKAGE__->set_primary_key("biomaterial_dbxref_id");
__PACKAGE__->add_unique_constraint("biomaterial_dbxref_c1", ["biomaterial_id", "dbxref_id"]);
__PACKAGE__->add_unique_constraint("biomaterial_dbxref_pkey", ["biomaterial_dbxref_id"]);
__PACKAGE__->belongs_to(
  "biomaterial_id",
  "Chado::Schema::Mage::Biomaterial",
  { biomaterial_id => "biomaterial_id" },
);


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:25
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bjDpA2GkVoRypqtm1NSIUw


# You can replace this text with custom content, and it will be preserved on regeneration
1;
