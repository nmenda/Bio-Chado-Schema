package Chado::Schema::General::Dbxref;

use strict;
use warnings;

use base 'DBIx::Class';

__PACKAGE__->load_components("Core");
__PACKAGE__->table("dbxref");
__PACKAGE__->add_columns(
  "dbxref_id",
  {
    data_type => "integer",
    default_value => "nextval('dbxref_dbxref_id_seq'::regclass)",
    is_nullable => 0,
    size => 4,
  },
  "db_id",
  { data_type => "integer", default_value => undef, is_nullable => 0, size => 4 },
  "accession",
  {
    data_type => "character varying",
    default_value => undef,
    is_nullable => 0,
    size => 255,
  },
  "version",
  {
    data_type => "character varying",
    default_value => "''::character varying",
    is_nullable => 0,
    size => 255,
  },
  "description",
  {
    data_type => "text",
    default_value => undef,
    is_nullable => 1,
    size => undef,
  },
);
__PACKAGE__->set_primary_key("dbxref_id");
__PACKAGE__->add_unique_constraint("dbxref_pkey", ["dbxref_id"]);
__PACKAGE__->add_unique_constraint("dbxref_c1", ["db_id", "accession", "version"]);
__PACKAGE__->belongs_to("db_id", "Chado::Schema::General::Db", { db_id => "db_id" });


# Created by DBIx::Class::Schema::Loader v0.04005 @ 2009-06-20 19:31:16
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:wUy4g2v2PVC9HtOrGyj6mg


# You can replace this text with custom content, and it will be preserved on regeneration
1;
