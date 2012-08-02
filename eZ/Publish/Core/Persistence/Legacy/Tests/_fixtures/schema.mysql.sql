
DROP TABLE IF EXISTS ezbinaryfile;
CREATE TABLE ezbinaryfile (
  contentobject_attribute_id int(11) NOT NULL default '0',
  download_count int(11) NOT NULL default '0',
  filename varchar(255) NOT NULL default '',
  mime_type varchar(255) NOT NULL default '',
  original_filename varchar(255) NOT NULL default '',
  version int(11) NOT NULL default '0',
  PRIMARY KEY  (contentobject_attribute_id,version)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS ezcobj_state;
CREATE TABLE ezcobj_state (
  default_language_id int(11) NOT NULL DEFAULT 0,
  group_id int(11) NOT NULL DEFAULT 0,
  id int(11) NOT NULL auto_increment,
  identifier varchar(45) NOT NULL DEFAULT '',
  language_mask int(11) NOT NULL DEFAULT 0,
  priority int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (id),
  UNIQUE KEY ezcobj_state_identifier ( group_id, identifier ),
  KEY ezcobj_state_lmask ( language_mask ),
  KEY ezcobj_state_priority ( priority )
) ENGINE=InnoDB;


DROP TABLE IF EXISTS ezcobj_state_group;
CREATE TABLE ezcobj_state_group (
  default_language_id int(11) NOT NULL DEFAULT 0,
  id int(11) NOT NULL auto_increment,
  identifier varchar(45) NOT NULL DEFAULT '',
  language_mask int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY ( id ),
  UNIQUE KEY ezcobj_state_group_identifier ( identifier ),
  KEY ezcobj_state_group_lmask ( language_mask )
) ENGINE=InnoDB;


DROP TABLE IF EXISTS ezcobj_state_group_language;
CREATE TABLE ezcobj_state_group_language (
  contentobject_state_group_id int(11) NOT NULL DEFAULT 0,
  description longtext NOT NULL,
  language_id int(11) NOT NULL DEFAULT 0,
  real_language_id int(11) NOT NULL DEFAULT 0,
  name varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY ( contentobject_state_group_id, real_language_id )
) ENGINE=InnoDB;


DROP TABLE IF EXISTS ezcobj_state_language;
CREATE TABLE ezcobj_state_language (
  contentobject_state_id int(11) NOT NULL DEFAULT 0,
  description longtext NOT NULL,
  language_id int(11) NOT NULL DEFAULT 0,
  name varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY ( contentobject_state_id, language_id )
) ENGINE=InnoDB;

--
DROP TABLE IF EXISTS ezcobj_state_link;
CREATE TABLE ezcobj_state_link (
  contentobject_id int(11) NOT NULL DEFAULT '0',
  contentobject_state_id int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (contentobject_id,contentobject_state_id)
) ENGINE=InnoDB;
--

DROP TABLE IF EXISTS ezcontent_language;
CREATE TABLE ezcontent_language (
  disabled int(11) NOT NULL default '0',
  id int(11) NOT NULL default '0',
  locale varchar(20) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  PRIMARY KEY  (id),
  KEY ezcontent_language_name (name)
) ENGINE=InnoDB;



DROP TABLE IF EXISTS ezcontentclass;
CREATE TABLE ezcontentclass (
  always_available int(11) NOT NULL default '0',
  contentobject_name varchar(255) default NULL,
  created int(11) NOT NULL default '0',
  creator_id int(11) NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  identifier varchar(50) NOT NULL default '',
  initial_language_id int(11) NOT NULL default '0',
  is_container int(11) NOT NULL default '0',
  language_mask int(11) NOT NULL default '0',
  modified int(11) NOT NULL default '0',
  modifier_id int(11) NOT NULL default '0',
  remote_id varchar(100) NOT NULL default '',
  serialized_description_list longtext,
  serialized_name_list longtext,
  sort_field int(11) NOT NULL default '1',
  sort_order int(11) NOT NULL default '1',
  url_alias_name varchar(255) default NULL,
  version int(11) NOT NULL default '0',
  PRIMARY KEY  (id,version),
  KEY ezcontentclass_version (version)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS ezcontentclass_attribute;
CREATE TABLE ezcontentclass_attribute (
  can_translate int(11) default '1',
  category varchar(25) NOT NULL default '',
  contentclass_id int(11) NOT NULL default '0',
  data_float1 float default NULL,
  data_float2 float default NULL,
  data_float3 float default NULL,
  data_float4 float default NULL,
  data_int1 int(11) default NULL,
  data_int2 int(11) default NULL,
  data_int3 int(11) default NULL,
  data_int4 int(11) default NULL,
  data_text1 varchar(50) default NULL,
  data_text2 varchar(50) default NULL,
  data_text3 varchar(50) default NULL,
  data_text4 varchar(255) default NULL,
  data_text5 longtext,
  data_type_string varchar(50) NOT NULL default '',
  id int(11) NOT NULL auto_increment,
  identifier varchar(50) NOT NULL default '',
  is_information_collector int(11) NOT NULL default '0',
  is_required int(11) NOT NULL default '0',
  is_searchable int(11) NOT NULL default '0',
  placement int(11) NOT NULL default '0',
  serialized_data_text longtext,
  serialized_description_list longtext,
  serialized_name_list longtext NOT NULL,
  version int(11) NOT NULL default '0',
  PRIMARY KEY  (id,version),
  KEY ezcontentclass_attr_ccid (contentclass_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentclass_classgroup;
CREATE TABLE ezcontentclass_classgroup (
  contentclass_id int(11) NOT NULL default '0',
  contentclass_version int(11) NOT NULL default '0',
  group_id int(11) NOT NULL default '0',
  group_name varchar(255) default NULL,
  PRIMARY KEY  (contentclass_id,contentclass_version,group_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentclass_name;
CREATE TABLE ezcontentclass_name (
  contentclass_id int(11) NOT NULL default '0',
  contentclass_version int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '0',
  language_locale varchar(20) NOT NULL default '',
  name varchar(255) NOT NULL default '',
  PRIMARY KEY  (contentclass_id,contentclass_version,language_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentclassgroup;
CREATE TABLE ezcontentclassgroup (
  created int(11) NOT NULL default '0',
  creator_id int(11) NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  modified int(11) NOT NULL default '0',
  modifier_id int(11) NOT NULL default '0',
  name varchar(255) default NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentobject;
CREATE TABLE ezcontentobject (
  contentclass_id int(11) NOT NULL default '0',
  current_version int(11) default NULL,
  id int(11) NOT NULL auto_increment,
  initial_language_id int(11) NOT NULL default '0',
  language_mask int(11) NOT NULL default '0',
  modified int(11) NOT NULL default '0',
  name varchar(255) default NULL,
  owner_id int(11) NOT NULL default '0',
  published int(11) NOT NULL default '0',
  remote_id varchar(100) default NULL,
  section_id int(11) NOT NULL default '0',
  status int(11) default '0',
  PRIMARY KEY  (id),
  KEY ezcontentobject_classid (contentclass_id),
  KEY ezcontentobject_currentversion (current_version),
  KEY ezcontentobject_lmask (language_mask),
  KEY ezcontentobject_owner (owner_id),
  KEY ezcontentobject_pub (published),
  UNIQUE KEY ezcontentobject_remote_id (remote_id),
  KEY ezcontentobject_status (status)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentobject_attribute;
CREATE TABLE ezcontentobject_attribute (
  attribute_original_id int(11) default '0',
  contentclassattribute_id int(11) NOT NULL default '0',
  contentobject_id int(11) NOT NULL default '0',
  data_float float default NULL,
  data_int int(11) default NULL,
  data_text longtext,
  data_type_string varchar(50) default '',
  id int(11) NOT NULL auto_increment,
  language_code varchar(20) NOT NULL default '',
  language_id int(11) NOT NULL default '0',
  sort_key_int int(11) NOT NULL default '0',
  sort_key_string varchar(255) NOT NULL default '',
  version int(11) NOT NULL default '0',
  PRIMARY KEY  (id,version),
  KEY ezcontentobject_attr_id (id),
  KEY ezcontentobject_attribute_co_id_ver_lang_code (contentobject_id,version,language_code),
  KEY ezcontentobject_attribute_contentobject_id (contentobject_id),
  KEY ezcontentobject_attribute_language_code (language_code),
  KEY sort_key_int (sort_key_int),
  KEY sort_key_string (sort_key_string)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentobject_link;
CREATE TABLE ezcontentobject_link (
  contentclassattribute_id int(11) NOT NULL default '0',
  from_contentobject_id int(11) NOT NULL default '0',
  from_contentobject_version int(11) NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  op_code int(11) NOT NULL default '0',
  relation_type int(11) NOT NULL default '1',
  to_contentobject_id int(11) NOT NULL default '0',
  PRIMARY KEY  (id),
  KEY ezco_link_from (from_contentobject_id,from_contentobject_version,contentclassattribute_id),
  KEY ezco_link_to_co_id (to_contentobject_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentobject_name;
CREATE TABLE ezcontentobject_name (
  content_translation varchar(20) NOT NULL default '',
  content_version int(11) NOT NULL default '0',
  contentobject_id int(11) NOT NULL default '0',
  language_id int(11) NOT NULL default '0',
  name varchar(255) default NULL,
  real_translation varchar(20) default NULL,
  PRIMARY KEY  (contentobject_id,content_version,content_translation),
  KEY ezcontentobject_name_co_id (contentobject_id),
  KEY ezcontentobject_name_cov_id (content_version),
  KEY ezcontentobject_name_lang_id (language_id),
  KEY ezcontentobject_name_name (name)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentobject_trash;
CREATE TABLE ezcontentobject_trash (
  contentobject_id int(11) default NULL,
  contentobject_version int(11) default NULL,
  depth int(11) NOT NULL default '0',
  is_hidden int(11) NOT NULL default '0',
  is_invisible int(11) NOT NULL default '0',
  main_node_id int(11) default NULL,
  modified_subnode int(11) default '0',
  node_id int(11) NOT NULL default '0',
  parent_node_id int(11) NOT NULL default '0',
  path_identification_string longtext,
  path_string varchar(255) NOT NULL default '',
  priority int(11) NOT NULL default '0',
  remote_id varchar(100) NOT NULL default '',
  sort_field int(11) default '1',
  sort_order int(11) default '1',
  PRIMARY KEY  (node_id),
  KEY ezcobj_trash_co_id (contentobject_id),
  KEY ezcobj_trash_depth (depth),
  KEY ezcobj_trash_modified_subnode (modified_subnode),
  KEY ezcobj_trash_p_node_id (parent_node_id),
  KEY ezcobj_trash_path (path_string),
  KEY ezcobj_trash_path_ident (path_identification_string(50))
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentobject_tree;
CREATE TABLE ezcontentobject_tree (
  contentobject_id int(11) default NULL,
  contentobject_is_published int(11) default NULL,
  contentobject_version int(11) default NULL,
  depth int(11) NOT NULL default '0',
  is_hidden int(11) NOT NULL default '0',
  is_invisible int(11) NOT NULL default '0',
  main_node_id int(11) default NULL,
  modified_subnode int(11) default '0',
  node_id int(11) NOT NULL auto_increment,
  parent_node_id int(11) NOT NULL default '0',
  path_identification_string longtext,
  path_string varchar(255) NOT NULL default '',
  priority int(11) NOT NULL default '0',
  remote_id varchar(100) NOT NULL default '',
  sort_field int(11) default '1',
  sort_order int(11) default '1',
  PRIMARY KEY  (node_id),
  KEY ezcontentobject_tree_co_id (contentobject_id),
  KEY ezcontentobject_tree_depth (depth),
  KEY ezcontentobject_tree_p_node_id (parent_node_id),
  KEY ezcontentobject_tree_path (path_string),
  KEY ezcontentobject_tree_path_ident (path_identification_string(50)),
  KEY modified_subnode (modified_subnode)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezcontentobject_version;
CREATE TABLE ezcontentobject_version (
  contentobject_id int(11) default NULL,
  created int(11) NOT NULL default '0',
  creator_id int(11) NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  initial_language_id int(11) NOT NULL default '0',
  language_mask int(11) NOT NULL default '0',
  modified int(11) NOT NULL default '0',
  status int(11) NOT NULL default '0',
  user_id int(11) NOT NULL default '0',
  version int(11) NOT NULL default '0',
  workflow_event_pos int(11) default '0',
  PRIMARY KEY  (id),
  KEY ezcobj_version_creator_id (creator_id),
  KEY ezcobj_version_status (status),
  KEY idx_object_version_objver (contentobject_id,version)
) ENGINE=InnoDB;




DROP TABLE IF EXISTS eznode_assignment;
CREATE TABLE eznode_assignment (
  contentobject_id int(11) default NULL,
  contentobject_version int(11) default NULL,
  from_node_id int(11) default '0',
  id int(11) NOT NULL auto_increment,
  is_main int(11) NOT NULL default '0',
  op_code int(11) NOT NULL default '0',
  parent_node int(11) default NULL,
  parent_remote_id varchar(100) NOT NULL default '',
  remote_id int(11) NOT NULL default '0',
  sort_field int(11) default '1',
  sort_order int(11) default '1',
  PRIMARY KEY  (id),
  KEY eznode_assignment_co_id (contentobject_id),
  KEY eznode_assignment_co_version (contentobject_version),
  KEY eznode_assignment_coid_cov (contentobject_id,contentobject_version),
  KEY eznode_assignment_is_main (is_main),
  KEY eznode_assignment_parent_node (parent_node)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezpolicy;
CREATE TABLE ezpolicy (
  function_name varchar(255) default NULL,
  id int(11) NOT NULL auto_increment,
  module_name varchar(255) default NULL,
  original_id int(11) NOT NULL default '0',
  role_id int(11) default NULL,
  PRIMARY KEY  (id),
  KEY ezpolicy_original_id (original_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezpolicy_limitation;
CREATE TABLE ezpolicy_limitation (
  id int(11) NOT NULL auto_increment,
  identifier varchar(255) NOT NULL default '',
  policy_id int(11) default NULL,
  PRIMARY KEY  (id),
  KEY policy_id (policy_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezpolicy_limitation_value;
CREATE TABLE ezpolicy_limitation_value (
  id int(11) NOT NULL auto_increment,
  limitation_id int(11) default NULL,
  value varchar(255) default NULL,
  PRIMARY KEY  (id),
  KEY ezpolicy_limitation_value_val (value)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezrole;
CREATE TABLE ezrole (
  id int(11) NOT NULL auto_increment,
  is_new int(11) NOT NULL default '0',
  name varchar(255) NOT NULL default '',
  value char(1) default NULL,
  version int(11) default '0',
  PRIMARY KEY  (id)
) ENGINE=InnoDB;




DROP TABLE IF EXISTS ezurl;
CREATE TABLE ezurl (
  created int(11) NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  is_valid int(11) NOT NULL default '1',
  last_checked int(11) NOT NULL default '0',
  modified int(11) NOT NULL default '0',
  original_url_md5 varchar(32) NOT NULL default '',
  url longtext,
  PRIMARY KEY  (id),
  KEY ezurl_url (url(255))
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezurl_object_link;
CREATE TABLE ezurl_object_link (
  contentobject_attribute_id int(11) NOT NULL default '0',
  contentobject_attribute_version int(11) NOT NULL default '0',
  url_id int(11) NOT NULL default '0',
  KEY ezurl_ol_coa_id (contentobject_attribute_id),
  KEY ezurl_ol_coa_version (contentobject_attribute_version),
  KEY ezurl_ol_url_id (url_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezurlalias;
CREATE TABLE ezurlalias (
  destination_url longtext NOT NULL,
  forward_to_id int(11) NOT NULL default '0',
  id int(11) NOT NULL auto_increment,
  is_imported int(11) NOT NULL default '0',
  is_internal int(11) NOT NULL default '1',
  is_wildcard int(11) NOT NULL default '0',
  source_md5 varchar(32) default NULL,
  source_url longtext NOT NULL,
  PRIMARY KEY  (id),
  KEY ezurlalias_desturl (destination_url(200)),
  KEY ezurlalias_forward_to_id (forward_to_id),
  KEY ezurlalias_imp_wcard_fwd (is_imported,is_wildcard,forward_to_id),
  KEY ezurlalias_source_md5 (source_md5),
  KEY ezurlalias_source_url (source_url(255)),
  KEY ezurlalias_wcard_fwd (is_wildcard,forward_to_id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezurlalias_ml;
CREATE TABLE ezurlalias_ml (
  action longtext NOT NULL,
  action_type varchar(32) NOT NULL default '',
  alias_redirects int(11) NOT NULL default '1',
  id int(11) NOT NULL default '0',
  is_alias int(11) NOT NULL default '0',
  is_original int(11) NOT NULL default '0',
  lang_mask int(11) NOT NULL default '0',
  link int(11) NOT NULL default '0',
  parent int(11) NOT NULL default '0',
  text longtext NOT NULL,
  text_md5 varchar(32) NOT NULL default '',
  PRIMARY KEY  (parent,text_md5),
  KEY ezurlalias_ml_act_org (action(32),is_original),
  KEY ezurlalias_ml_action (action(32),id,link),
  KEY ezurlalias_ml_actt (action_type),
  KEY ezurlalias_ml_actt_org_al (action_type,is_original,is_alias),
  KEY ezurlalias_ml_id (id),
  KEY ezurlalias_ml_par_act_id_lnk (parent,action(32),id,link),
  KEY ezurlalias_ml_par_lnk_txt (parent,link,text(32)),
  KEY ezurlalias_ml_par_txt (parent,text(32)),
  KEY ezurlalias_ml_text (text(32),id,link),
  KEY ezurlalias_ml_text_lang (text(32),lang_mask,parent)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezurlalias_ml_incr;
CREATE TABLE ezurlalias_ml_incr (
  id int(11) NOT NULL auto_increment,
  PRIMARY KEY  (id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezurlwildcard;
CREATE TABLE ezurlwildcard (
  destination_url longtext NOT NULL,
  id int(11) NOT NULL auto_increment,
  source_url longtext NOT NULL,
  type int(11) NOT NULL default '0',
  PRIMARY KEY  (id)
) ENGINE=InnoDB;





DROP TABLE IF EXISTS ezuser;
CREATE TABLE ezuser (
  contentobject_id int(11) NOT NULL default '0',
  email varchar(150) NOT NULL default '',
  login varchar(150) NOT NULL default '',
  password_hash varchar(50) default NULL,
  password_hash_type int(11) NOT NULL default '1',
  PRIMARY KEY  (contentobject_id)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS ezuser_role;
CREATE TABLE ezuser_role (
  contentobject_id int(11) default NULL,
  id int(11) NOT NULL auto_increment,
  limit_identifier varchar(255) default '',
  limit_value varchar(255) default '',
  role_id int(11) default NULL,
  PRIMARY KEY  (id),
  KEY ezuser_role_contentobject_id (contentobject_id),
  KEY ezuser_role_role_id (role_id)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS ezuser_setting;
CREATE TABLE ezuser_setting (
  is_enabled int(11) NOT NULL default '0',
  max_login int(11) default NULL,
  user_id int(11) NOT NULL default '0',
  PRIMARY KEY  (user_id)
) ENGINE=InnoDB;


DROP TABLE IF EXISTS `ezsearch_object_word_link`;
CREATE TABLE `ezsearch_object_word_link` (
  `contentclass_attribute_id` int(11) NOT NULL DEFAULT '0',
  `contentclass_id` int(11) NOT NULL DEFAULT '0',
  `contentobject_id` int(11) NOT NULL DEFAULT '0',
  `frequency` float NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) NOT NULL DEFAULT '',
  `integer_value` int(11) NOT NULL DEFAULT '0',
  `next_word_id` int(11) NOT NULL DEFAULT '0',
  `placement` int(11) NOT NULL DEFAULT '0',
  `prev_word_id` int(11) NOT NULL DEFAULT '0',
  `published` int(11) NOT NULL DEFAULT '0',
  `section_id` int(11) NOT NULL DEFAULT '0',
  `word_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsearch_object_word_link_frequency` (`frequency`),
  KEY `ezsearch_object_word_link_identifier` (`identifier`),
  KEY `ezsearch_object_word_link_integer_value` (`integer_value`),
  KEY `ezsearch_object_word_link_object` (`contentobject_id`),
  KEY `ezsearch_object_word_link_word` (`word_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17279 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezsearch_return_count`;
CREATE TABLE `ezsearch_return_count` (
  `count` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase_id` int(11) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezsearch_return_cnt_ph_id_cnt` (`phrase_id`,`count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ezsearch_search_phrase`;
CREATE TABLE `ezsearch_search_phrase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phrase` varchar(250) DEFAULT NULL,
  `phrase_count` int(11) DEFAULT '0',
  `result_count` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `ezsearch_search_phrase_phrase` (`phrase`),
  KEY `ezsearch_search_phrase_count` (`phrase_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


DROP TABLE IF EXISTS `ezsearch_word`;
CREATE TABLE `ezsearch_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_count` int(11) NOT NULL DEFAULT '0',
  `word` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezsearch_word_obj_count` (`object_count`),
  KEY `ezsearch_word_word_i` (`word`)
) ENGINE=InnoDB AUTO_INCREMENT=2523 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezsection`;
CREATE TABLE `ezsection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(255) DEFAULT NULL,
  `locale` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `navigation_part_identifier` varchar(100) DEFAULT 'ezcontentnavigationpart',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezuser_accountkey`;
CREATE TABLE `ezuser_accountkey` (
      `hash_key` varchar(32) NOT NULL DEFAULT '',
      `id` int(11) NOT NULL AUTO_INCREMENT,
      `time` int(11) NOT NULL DEFAULT '0',
      `user_id` int(11) NOT NULL DEFAULT '0',
      PRIMARY KEY (`id`),
      KEY `hash_key` (`hash_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezuservisit`;
CREATE TABLE `ezuservisit` (
      `current_visit_timestamp` int(11) NOT NULL DEFAULT '0',
      `failed_login_attempts` int(11) NOT NULL DEFAULT '0',
      `last_visit_timestamp` int(11) NOT NULL DEFAULT '0',
      `login_count` int(11) NOT NULL DEFAULT '0',
      `user_id` int(11) NOT NULL DEFAULT '0',
      PRIMARY KEY (`user_id`),
      KEY `ezuservisit_co_visit_count` (`current_visit_timestamp`,`login_count`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezkeyword`;
CREATE TABLE `ezkeyword` (
  `class_id` int(11) NOT NULL DEFAULT '0',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ezkeyword_keyword` (`keyword`),
  KEY `ezkeyword_keyword_id` (`keyword`,`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezkeyword_attribute_link`;
CREATE TABLE `ezkeyword_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL DEFAULT '0',
  `objectattribute_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `ezkeyword_attr_link_keyword_id` (`keyword_id`),
  KEY `ezkeyword_attr_link_kid_oaid` (`keyword_id`,`objectattribute_id`),
  KEY `ezkeyword_attr_link_oaid` (`objectattribute_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

