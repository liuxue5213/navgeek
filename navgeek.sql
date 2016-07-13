/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50547
Source Host           : 127.0.0.1:3306
Source Database       : navgeek

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-05-03 20:00:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for flarumaccess_tokens
-- ----------------------------
DROP TABLE IF EXISTS `flarumaccess_tokens`;
CREATE TABLE `flarumaccess_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `expires_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumaccess_tokens
-- ----------------------------
INSERT INTO `flarumaccess_tokens` VALUES ('KWgwqKj9a4sSLZQeIA8iy7Bl63rfLnsIebnfIUdf', '1', '2016-04-27 03:48:54', '2016-05-11 03:48:54');

-- ----------------------------
-- Table structure for flarumapi_keys
-- ----------------------------
DROP TABLE IF EXISTS `flarumapi_keys`;
CREATE TABLE `flarumapi_keys` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumapi_keys
-- ----------------------------

-- ----------------------------
-- Table structure for flarumauth_tokens
-- ----------------------------
DROP TABLE IF EXISTS `flarumauth_tokens`;
CREATE TABLE `flarumauth_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumauth_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for flarumdiscussions
-- ----------------------------
DROP TABLE IF EXISTS `flarumdiscussions`;
CREATE TABLE `flarumdiscussions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0',
  `participants_count` int(10) unsigned NOT NULL DEFAULT '0',
  `number_index` int(10) unsigned NOT NULL DEFAULT '0',
  `start_time` datetime NOT NULL,
  `start_user_id` int(10) unsigned DEFAULT NULL,
  `start_post_id` int(10) unsigned DEFAULT NULL,
  `last_time` datetime DEFAULT NULL,
  `last_user_id` int(10) unsigned DEFAULT NULL,
  `last_post_id` int(10) unsigned DEFAULT NULL,
  `last_post_number` int(10) unsigned DEFAULT NULL,
  `hide_time` datetime DEFAULT NULL,
  `hide_user_id` int(10) unsigned DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  `is_locked` tinyint(1) NOT NULL DEFAULT '0',
  `is_sticky` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumdiscussions
-- ----------------------------
INSERT INTO `flarumdiscussions` VALUES ('1', 'test', '1', '1', '1', '2016-04-27 03:55:54', '1', '1', '2016-04-27 03:55:54', '1', '1', '1', null, null, '1', '0', '0');

-- ----------------------------
-- Table structure for flarumdiscussions_tags
-- ----------------------------
DROP TABLE IF EXISTS `flarumdiscussions_tags`;
CREATE TABLE `flarumdiscussions_tags` (
  `discussion_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`discussion_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumdiscussions_tags
-- ----------------------------
INSERT INTO `flarumdiscussions_tags` VALUES ('1', '1');

-- ----------------------------
-- Table structure for flarumemail_tokens
-- ----------------------------
DROP TABLE IF EXISTS `flarumemail_tokens`;
CREATE TABLE `flarumemail_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumemail_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for flarumflags
-- ----------------------------
DROP TABLE IF EXISTS `flarumflags`;
CREATE TABLE `flarumflags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` int(10) unsigned NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reason_detail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumflags
-- ----------------------------

-- ----------------------------
-- Table structure for flarumgroups
-- ----------------------------
DROP TABLE IF EXISTS `flarumgroups`;
CREATE TABLE `flarumgroups` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_singular` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name_plural` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `color` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumgroups
-- ----------------------------
INSERT INTO `flarumgroups` VALUES ('1', 'Admin', 'Admins', '#B72A2A', 'wrench');
INSERT INTO `flarumgroups` VALUES ('2', 'Guest', 'Guests', null, null);
INSERT INTO `flarumgroups` VALUES ('3', 'Member', 'Members', null, null);
INSERT INTO `flarumgroups` VALUES ('4', 'Mod', 'Mods', '#80349E', 'bolt');

-- ----------------------------
-- Table structure for flarummentions_posts
-- ----------------------------
DROP TABLE IF EXISTS `flarummentions_posts`;
CREATE TABLE `flarummentions_posts` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarummentions_posts
-- ----------------------------

-- ----------------------------
-- Table structure for flarummentions_users
-- ----------------------------
DROP TABLE IF EXISTS `flarummentions_users`;
CREATE TABLE `flarummentions_users` (
  `post_id` int(10) unsigned NOT NULL,
  `mentions_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`mentions_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarummentions_users
-- ----------------------------

-- ----------------------------
-- Table structure for flarummigrations
-- ----------------------------
DROP TABLE IF EXISTS `flarummigrations`;
CREATE TABLE `flarummigrations` (
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarummigrations
-- ----------------------------
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_access_tokens_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_api_keys_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_config_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_discussions_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_email_tokens_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_groups_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_notifications_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_password_tokens_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_permissions_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_posts_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_users_discussions_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_users_groups_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_users_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_09_15_000000_create_auth_tokens_table', null);
INSERT INTO `flarummigrations` VALUES ('2015_09_20_224327_add_hide_to_discussions', null);
INSERT INTO `flarummigrations` VALUES ('2015_09_22_030432_rename_notification_read_time', null);
INSERT INTO `flarummigrations` VALUES ('2015_10_07_130531_rename_config_to_settings', null);
INSERT INTO `flarummigrations` VALUES ('2015_10_24_194000_add_ip_address_to_posts', null);
INSERT INTO `flarummigrations` VALUES ('2015_09_21_011527_add_is_approved_to_discussions', 'flarum-approval');
INSERT INTO `flarummigrations` VALUES ('2015_09_21_011706_add_is_approved_to_posts', 'flarum-approval');
INSERT INTO `flarummigrations` VALUES ('2015_09_02_000000_add_flags_read_time_to_users_table', 'flarum-flags');
INSERT INTO `flarummigrations` VALUES ('2015_09_02_000000_create_flags_table', 'flarum-flags');
INSERT INTO `flarummigrations` VALUES ('2015_05_11_000000_create_posts_likes_table', 'flarum-likes');
INSERT INTO `flarummigrations` VALUES ('2015_09_04_000000_add_default_like_permissions', 'flarum-likes');
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_add_locked_to_discussions', 'flarum-lock');
INSERT INTO `flarummigrations` VALUES ('2015_05_11_000000_create_mentions_posts_table', 'flarum-mentions');
INSERT INTO `flarummigrations` VALUES ('2015_05_11_000000_create_mentions_users_table', 'flarum-mentions');
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_add_sticky_to_discussions', 'flarum-sticky');
INSERT INTO `flarummigrations` VALUES ('2015_05_11_000000_add_subscription_to_users_discussions_table', 'flarum-subscriptions');
INSERT INTO `flarummigrations` VALUES ('2015_05_11_000000_add_suspended_until_to_users_table', 'flarum-suspend');
INSERT INTO `flarummigrations` VALUES ('2015_09_14_000000_rename_suspended_until_column', 'flarum-suspend');
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_discussions_tags_table', 'flarum-tags');
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_tags_table', 'flarum-tags');
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_create_users_tags_table', 'flarum-tags');
INSERT INTO `flarummigrations` VALUES ('2015_02_24_000000_set_default_settings', 'flarum-tags');
INSERT INTO `flarummigrations` VALUES ('2015_10_19_061223_make_slug_unique', 'flarum-tags');

-- ----------------------------
-- Table structure for flarumnotifications
-- ----------------------------
DROP TABLE IF EXISTS `flarumnotifications`;
CREATE TABLE `flarumnotifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` int(10) unsigned NOT NULL,
  `sender_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subject_type` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject_id` int(10) unsigned DEFAULT NULL,
  `data` blob,
  `time` datetime NOT NULL,
  `is_read` tinyint(1) NOT NULL DEFAULT '0',
  `is_deleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumnotifications
-- ----------------------------

-- ----------------------------
-- Table structure for flarumpassword_tokens
-- ----------------------------
DROP TABLE IF EXISTS `flarumpassword_tokens`;
CREATE TABLE `flarumpassword_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumpassword_tokens
-- ----------------------------

-- ----------------------------
-- Table structure for flarumpermissions
-- ----------------------------
DROP TABLE IF EXISTS `flarumpermissions`;
CREATE TABLE `flarumpermissions` (
  `group_id` int(10) unsigned NOT NULL,
  `permission` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`group_id`,`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumpermissions
-- ----------------------------
INSERT INTO `flarumpermissions` VALUES ('2', 'viewDiscussions');
INSERT INTO `flarumpermissions` VALUES ('3', 'discussion.likePosts');
INSERT INTO `flarumpermissions` VALUES ('3', 'discussion.reply');
INSERT INTO `flarumpermissions` VALUES ('3', 'startDiscussion');
INSERT INTO `flarumpermissions` VALUES ('4', 'discussion.delete');
INSERT INTO `flarumpermissions` VALUES ('4', 'discussion.deletePosts');
INSERT INTO `flarumpermissions` VALUES ('4', 'discussion.editPosts');
INSERT INTO `flarumpermissions` VALUES ('4', 'discussion.rename');

-- ----------------------------
-- Table structure for flarumposts
-- ----------------------------
DROP TABLE IF EXISTS `flarumposts`;
CREATE TABLE `flarumposts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `discussion_id` int(10) unsigned NOT NULL,
  `number` int(10) unsigned DEFAULT NULL,
  `time` datetime NOT NULL,
  `user_id` int(10) unsigned DEFAULT NULL,
  `type` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `edit_time` datetime DEFAULT NULL,
  `edit_user_id` int(10) unsigned DEFAULT NULL,
  `hide_time` datetime DEFAULT NULL,
  `hide_user_id` int(10) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_approved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_discussion_id_number_unique` (`discussion_id`,`number`),
  FULLTEXT KEY `content` (`content`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumposts
-- ----------------------------
INSERT INTO `flarumposts` VALUES ('1', '1', '1', '2016-04-27 03:55:54', '1', 'comment', '<t><p>test123</p></t>', null, null, null, null, null, '1');

-- ----------------------------
-- Table structure for flarumposts_likes
-- ----------------------------
DROP TABLE IF EXISTS `flarumposts_likes`;
CREATE TABLE `flarumposts_likes` (
  `post_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`post_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumposts_likes
-- ----------------------------

-- ----------------------------
-- Table structure for flarumsettings
-- ----------------------------
DROP TABLE IF EXISTS `flarumsettings`;
CREATE TABLE `flarumsettings` (
  `key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` blob,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumsettings
-- ----------------------------
INSERT INTO `flarumsettings` VALUES ('allow_post_editing', 0x7265706C79);
INSERT INTO `flarumsettings` VALUES ('allow_renaming', 0x3130);
INSERT INTO `flarumsettings` VALUES ('allow_sign_up', 0x31);
INSERT INTO `flarumsettings` VALUES ('custom_less', '');
INSERT INTO `flarumsettings` VALUES ('default_locale', 0x656E);
INSERT INTO `flarumsettings` VALUES ('default_route', 0x2F616C6C);
INSERT INTO `flarumsettings` VALUES ('extensions_enabled', 0x5B22666C6172756D2D617070726F76616C222C22666C6172756D2D6262636F6465222C22666C6172756D2D656D6F6A69222C22666C6172756D2D656E676C697368222C22666C6172756D2D666C616773222C22666C6172756D2D6C696B6573222C22666C6172756D2D6C6F636B222C22666C6172756D2D6D61726B646F776E222C22666C6172756D2D6D656E74696F6E73222C22666C6172756D2D737469636B79222C22666C6172756D2D737562736372697074696F6E73222C22666C6172756D2D73757370656E64222C22666C6172756D2D74616773225D);
INSERT INTO `flarumsettings` VALUES ('flarum-tags.max_primary_tags', 0x31);
INSERT INTO `flarumsettings` VALUES ('flarum-tags.max_secondary_tags', 0x33);
INSERT INTO `flarumsettings` VALUES ('flarum-tags.min_primary_tags', 0x31);
INSERT INTO `flarumsettings` VALUES ('flarum-tags.min_secondary_tags', 0x30);
INSERT INTO `flarumsettings` VALUES ('forum_description', '');
INSERT INTO `flarumsettings` VALUES ('forum_title', 0x4A6F686E2053636F74742031393839);
INSERT INTO `flarumsettings` VALUES ('mail_driver', 0x6D61696C);
INSERT INTO `flarumsettings` VALUES ('mail_from', 0x6E6F7265706C79406C6F63616C686F7374);
INSERT INTO `flarumsettings` VALUES ('theme_colored_header', 0x30);
INSERT INTO `flarumsettings` VALUES ('theme_dark_mode', 0x30);
INSERT INTO `flarumsettings` VALUES ('theme_primary_color', 0x23344436393845);
INSERT INTO `flarumsettings` VALUES ('theme_secondary_color', 0x23344436393845);
INSERT INTO `flarumsettings` VALUES ('version', 0x302E312E302D626574612E33);
INSERT INTO `flarumsettings` VALUES ('welcome_message', 0x54686973206973206265746120736F66747761726520616E6420796F752073686F756C64206E6F742075736520697420696E2070726F64756374696F6E2E);
INSERT INTO `flarumsettings` VALUES ('welcome_title', 0x57656C636F6D6520746F204A6F686E2053636F74742031393839);

-- ----------------------------
-- Table structure for flarumtags
-- ----------------------------
DROP TABLE IF EXISTS `flarumtags`;
CREATE TABLE `flarumtags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `color` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background_mode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `default_sort` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_restricted` tinyint(1) NOT NULL DEFAULT '0',
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  `discussions_count` int(10) unsigned NOT NULL DEFAULT '0',
  `last_time` datetime DEFAULT NULL,
  `last_discussion_id` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumtags
-- ----------------------------
INSERT INTO `flarumtags` VALUES ('1', 'General', 'general', null, '#888', null, null, '0', null, null, '0', '0', '1', '2016-04-27 03:55:54', '1');

-- ----------------------------
-- Table structure for flarumusers
-- ----------------------------
DROP TABLE IF EXISTS `flarumusers`;
CREATE TABLE `flarumusers` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_activated` tinyint(1) NOT NULL DEFAULT '0',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `bio` text COLLATE utf8mb4_unicode_ci,
  `avatar_path` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `preferences` blob,
  `join_time` datetime DEFAULT NULL,
  `last_seen_time` datetime DEFAULT NULL,
  `read_time` datetime DEFAULT NULL,
  `notifications_read_time` datetime DEFAULT NULL,
  `discussions_count` int(10) unsigned NOT NULL DEFAULT '0',
  `comments_count` int(10) unsigned NOT NULL DEFAULT '0',
  `flags_read_time` datetime DEFAULT NULL,
  `suspend_until` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumusers
-- ----------------------------
INSERT INTO `flarumusers` VALUES ('1', 'liuxue5213', '956149307@qq.com', '1', '$2y$10$B5Y7gl1.FxF.Tz8STUnz8OXd9wrH2/bpyutog3hhC1bUtHmt0pP/q', null, null, 0x7B226E6F746966795F64697363757373696F6E52656E616D65645F616C657274223A747275652C226E6F746966795F706F73744C696B65645F616C657274223A747275652C226E6F746966795F64697363757373696F6E4C6F636B65645F616C657274223A747275652C226E6F746966795F706F73744D656E74696F6E65645F616C657274223A747275652C226E6F746966795F706F73744D656E74696F6E65645F656D61696C223A66616C73652C226E6F746966795F757365724D656E74696F6E65645F616C657274223A747275652C226E6F746966795F757365724D656E74696F6E65645F656D61696C223A66616C73652C226E6F746966795F6E6577506F73745F616C657274223A747275652C226E6F746966795F6E6577506F73745F656D61696C223A747275652C22646973636C6F73654F6E6C696E65223A747275652C22696E64657850726F66696C65223A747275652C226C6F63616C65223A6E756C6C7D, '2016-04-27 03:48:52', '2016-04-27 04:05:22', '2016-04-27 03:55:33', null, '1', '1', '2016-04-27 03:50:26', null);

-- ----------------------------
-- Table structure for flarumusers_discussions
-- ----------------------------
DROP TABLE IF EXISTS `flarumusers_discussions`;
CREATE TABLE `flarumusers_discussions` (
  `user_id` int(10) unsigned NOT NULL,
  `discussion_id` int(10) unsigned NOT NULL,
  `read_time` datetime DEFAULT NULL,
  `read_number` int(10) unsigned DEFAULT NULL,
  `subscription` enum('follow','ignore') COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`,`discussion_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumusers_discussions
-- ----------------------------
INSERT INTO `flarumusers_discussions` VALUES ('1', '1', '2016-04-27 03:55:54', '1', null);

-- ----------------------------
-- Table structure for flarumusers_groups
-- ----------------------------
DROP TABLE IF EXISTS `flarumusers_groups`;
CREATE TABLE `flarumusers_groups` (
  `user_id` int(10) unsigned NOT NULL,
  `group_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumusers_groups
-- ----------------------------
INSERT INTO `flarumusers_groups` VALUES ('1', '1');

-- ----------------------------
-- Table structure for flarumusers_tags
-- ----------------------------
DROP TABLE IF EXISTS `flarumusers_tags`;
CREATE TABLE `flarumusers_tags` (
  `user_id` int(10) unsigned NOT NULL,
  `tag_id` int(10) unsigned NOT NULL,
  `read_time` datetime DEFAULT NULL,
  `is_hidden` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of flarumusers_tags
-- ----------------------------

-- ----------------------------
-- Table structure for nav_crawler_data
-- ----------------------------
DROP TABLE IF EXISTS `nav_crawler_data`;
CREATE TABLE `nav_crawler_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `image_url` varchar(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL COMMENT '0',
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_crawler_data
-- ----------------------------

-- ----------------------------
-- Table structure for nav_crawler_urls
-- ----------------------------
DROP TABLE IF EXISTS `nav_crawler_urls`;
CREATE TABLE `nav_crawler_urls` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `status` int(1) DEFAULT NULL COMMENT '0',
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_crawler_urls
-- ----------------------------

-- ----------------------------
-- Table structure for nav_group_type
-- ----------------------------
DROP TABLE IF EXISTS `nav_group_type`;
CREATE TABLE `nav_group_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL DEFAULT '',
  `status` int(1) DEFAULT NULL COMMENT '0',
  `author` int(11) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_group_type
-- ----------------------------
INSERT INTO `nav_group_type` VALUES ('1', '未分类', '1', '9', '2016-05-03 14:24:49', '2016-05-03 14:24:51');
INSERT INTO `nav_group_type` VALUES ('2', '舰娘', '1', '9', null, null);
INSERT INTO `nav_group_type` VALUES ('3', '博客', '1', '9', null, null);
INSERT INTO `nav_group_type` VALUES ('4', '工具', '1', '9', null, null);
INSERT INTO `nav_group_type` VALUES ('5', '响应式', '1', '9', null, null);
INSERT INTO `nav_group_type` VALUES ('6', 'html css', '1', '9', null, null);
INSERT INTO `nav_group_type` VALUES ('7', '未分类', '1', '10', '2016-05-03 16:27:03', '2016-05-03 16:27:03');

-- ----------------------------
-- Table structure for nav_index_navigator
-- ----------------------------
DROP TABLE IF EXISTS `nav_index_navigator`;
CREATE TABLE `nav_index_navigator` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `url` varchar(255) NOT NULL DEFAULT '',
  `image_url` varchar(255) DEFAULT NULL,
  `post_type` int(5) DEFAULT NULL COMMENT '0',
  `status` int(1) DEFAULT NULL COMMENT '0',
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_index_navigator
-- ----------------------------

-- ----------------------------
-- Table structure for nav_titles
-- ----------------------------
DROP TABLE IF EXISTS `nav_titles`;
CREATE TABLE `nav_titles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(80) NOT NULL DEFAULT '',
  `url` text NOT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `author` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `post_type` int(5) DEFAULT NULL COMMENT '0',
  `status` int(1) DEFAULT NULL COMMENT '0',
  `comment_status` varchar(255) DEFAULT 'open',
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1085 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_titles
-- ----------------------------
INSERT INTO `nav_titles` VALUES ('742', '艦隊これくしょん～艦これ～ - オンラインゲーム - DMM.com', 'http://www.dmm.com/netgame_s/kancolle/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('743', '舰队collection阵型加成对比分析一览表_页游家舰队collection', 'http://www.yeyoujia.com/jn/gl/6542891121059.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('744', '【转帖】【练船指南】舰娘能力评析及入手推荐，我该练哪些船？ver201412 - N宅！ACG游戏攻略组', 'http://notaku.cn/article/32', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('745', '最新舰娘 远征&任务表 （2014.9.20更新 包含要求+掉落+收益报酬 舰队collection） - 校园水区 - 中国海洋大学论坛-海大学习论坛 - P', 'http://bbs.oucer.net/thread-841-1-1.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('746', '舰队collection全地图完整攻略——超完整版！ - N宅！ACG游戏攻略组', 'http://notaku.cn/article/11', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('747', '艦隊Collection/期間限定海域/發令！第十一號作戰 - 萌娘百科 萬物皆可萌的百科全書', 'http://zh.moegirl.org/%E8%88%B0%E9%98%9FCollection/%E6%9C%9F%E9%97%B4%E9%99%90%E5%AE%9A%E6%B5%B7%E5%9F%9F/%E5%8F%91%E4%BB%A4%EF%BC%81%E7%AC%AC%E5%8D%81%E4%B8%80%E5%8F%B7%E4%BD%9C%E6%88%98#E1.E3.80.90.E5.8F.91.E5.8A.A8.E5.87.86.E5.A4.87.EF.BC.8C.E7.AC.AC.E5.8D.81.E4.B8.80.E5.8F.B7.E4.BD.9C.E6.88.98.EF.BC.81.E3.80.91.E5.92.96.E5.96.B1.E6.B4.8B', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('748', 'unlockACGWeb Pro', 'http://unlockacgweb.galstars.net/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('749', '奋斗在韩国 韩国留学生论坛-论坛-韩国留学生 在韩华人生活娱乐 以韩国留学生为本 韩国中文', 'http://bbs.icnkr.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('750', '네이버 부동산 :: 내집마련의 시작, 네이버 부동산', 'http://land.naver.com/search/article.nhn?tab=article&query=%EC%84%9C%EC%9A%B8%208%EB%B0%B1%EB%A7%8C%EC%9B%90%20%EC%9D%B4%EC%83%81%20%EC%95%84%ED%8C%8C%ED%8A%B8%20%EC%9B%94%EC%84%B8#%7B%22rletType%22%3A%22A01%3AA03%3AA04%22%2C%22tradeType%22%3A%22B2%22%2C%22price%22%3A%22self%22%2C%22depositPrice%22%3A%22%22%2C%22minPrice%22%3A800%2C%22maxPrice%22%3A10000000%2C%22size%22%3A%22%22%2C%22confirmDate%22%3A%22%22%7D', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('751', 'NAVER[韩]', 'http://www.naver.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('752', '싸이월드', 'http://www.cyworld.com/cymain/?f=cymain', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('753', 'Amie.Nei(endingrsq)_饭否', 'http://fanfou.com/endingrsq', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('754', 'josephine911(josephine911)_饭否', 'http://fanfou.com/josephine911', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('755', '最好的时光 @ 不老歌 - 记录与分享', 'http://bulaoge.net/?apresete', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('756', '从前慢 @ 不老歌 - 记录与分享', 'http://bulaoge.net/?oldslow', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('757', '永遠亭 @ 不老歌 - 记录与分享', 'http://bulaoge.net/?tataranatsumi', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('758', '木mu马ma的微博&私杂志', 'http://www.sizazhi.com/u/3197473325/3739611647893365.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('759', 'Leo龙泓全的窝 - 蚂蜂窝', 'http://www.mafengwo.cn/u/176642.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('760', '边缘儿的窝 - 蚂蜂窝', 'http://www.mafengwo.cn/u/17092346.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('761', '玥明', 'http://www.douban.com/people/amyue/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('762', '玑衡', 'http://www.douban.com/people/lilyshen/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('763', 'kindle5超详细使用心得+电子书网站推荐+PDF切边问题', 'http://www.douban.com/group/topic/37234815/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('764', 'moon', 'http://www.douban.com/people/moon.f/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('765', '长清短清，云心水心。', 'http://www.douban.com/group/topic/10049179/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('766', '赵谜', 'http://www.douban.com/people/zxxaki/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('767', '王垠：完全用Linux工作', 'http://www.douban.com/group/topic/12121637/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('768', '承欢', 'http://www.douban.com/people/miranda0126/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('769', '藕粽', 'http://www.douban.com/people/ozone_bdwm/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('770', 'Yuliiee', 'http://www.douban.com/people/soo_park641215/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('771', 'Emmy.Scorpius', 'http://www.douban.com/people/2950955/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('772', '左堂堂的日记', 'http://www.douban.com/people/bb900813/notes?start=0&type=note', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('773', 'GM、VP、FVP、CIO都是什么职位？_乔应涛_新浪博客', 'http://blog.sina.com.cn/s/blog_6a2c38270100mso5.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('774', '萌歌玛丽的微博_微博', 'http://weibo.com/u/1188452857', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('775', '(2)博文_Sunny_新浪博客', 'http://blog.sina.com.cn/s/articlelist_1800379235_0_1.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('776', '王丽坤的微博_微博', 'http://weibo.com/wanglikunblog', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('777', 'Icy_Kong的微博_微博', 'http://weibo.com/u/2034633260#_rnd1419009411847', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('778', '微博 文章 - 一生中很重要的10年，你是否正在浪费？', 'http://weibo.com/p/1001603756073361219090', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('779', '诺小念------Dreamer的微博_微博', 'http://weibo.com/p/1005052788076620/album?from=page_100505&mod=TAB#place', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('780', '从不入流学校的博士到世界三大杂志编委_Sam赵山_新浪博客', 'http://blog.sina.com.cn/s/blog_4c560ef10100tgzq.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('781', '请叫老板欧尼酱的微博_微博', 'http://weibo.com/p/1005051789320361/album?from=page_100505&mod=TAB#place', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('782', '(2)小何两年学习php的路线_子非何_新浪博客', 'http://blog.sina.com.cn/s/blog_6d0d99cc01018ex5.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('783', 'lulu居美日记_新浪博客', 'http://blog.sina.com.cn/usalulu', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('784', '[跳躍的荷爾蒙] - 博客大巴', 'http://2kano.blogbus.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('785', '欧游杂记 - 落英纷飞 - 博客大巴', 'http://skyland.blogbus.com/c1744598/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('786', 'Déjà Vu, Déjà Vu - 博客大巴', 'http://orlandoc.blogbus.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('787', 'Candybox - 博客大巴', 'http://mycandybox.blogbus.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('788', 'Just the Way You Are - 博客大巴', 'http://judijudijudy.blogbus.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('789', '阿煩 - 博客大巴', 'http://imbenc09.blogbus.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('790', '安静下来看花开 - 博客大巴', 'http://holyhu0916.blogbus.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('791', '西风广播电台 - 博客大巴', 'http://guorongxi.blogbus.com/index_2.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('792', '流波上的舞 - 博客大巴', 'http://princessxixino1.blogbus.com/index_8.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('793', '水做的天堂 - BlogBus.com', 'http://bluecarrie.blogbus.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('794', 'Yosemite to San Francisco - 悠悠的日志 - 网易博客', 'http://blog.163.com/cathy_0611/blog/static/1220653122012630103514322/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('795', '我是Sunny - 双眼皮的女生 - 网易博客', 'http://blog.163.com/shuanyan_love/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('796', 'Starry Night - Panda - 网易博客', 'http://blog.163.com/ladygege_eva/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('797', '在博客的第一炮 - Jayfan的自留地 - jayfan - 和讯博客', 'http://jayfan.blog.hexun.com/1709033_d.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('798', '大Joy在侃村 | daJoy@Canterbury', 'http://giantjoy.net/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('799', 'Siqi Pan - Parallel Universe, We don\'t need no education, we don\'t need know tho', 'http://about.me/baoxiaozha', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('800', '当然我在扯淡', 'http://www.yinwang.org/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('801', 'DOU | 曾经的大豆，此刻的小豆', 'https://gracedou.geowhy.org/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('802', 'Hello world！ | Daydreamers', 'https://hermioneli.wordpress.com/2010/10/05/hello-world/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('803', '让IE6/IE7/IE8浏览器支持CSS3属性 « 张鑫旭-鑫空间-鑫生活', 'http://www.zhangxinxu.com/wordpress/2010/04/%E8%AE%A9ie6ie7ie8%E6%B5%8F%E8%A7%88%E5%99%A8%E6%94%AF%E6%8C%81css3%E5%B1%9E%E6%80%A7/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('804', 'Bootstrap可视化布局系统', 'http://layout.ruby-world.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('805', 'layDate - js日期控件与时间插件官方讲解', 'http://sentsin.com/layui/laydate/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('806', 'Adobe Photoshop CS6 基础到精通_IT技能_培训_腾讯精品课', 'http://class.qq.com/class/8462.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('807', 'HTML5教程 HTML5基础语法教程 - DIV+CSS学习教程与资源分享平台', 'http://www.divcss5.com/html5/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('808', 'jQuery插件：返回顶部/底部 - yenange的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/yenange/article/details/14231127', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('809', '转一段js验证身份证号的代码-久久艳阳天-搜狐博客', 'http://fanyanyang.blog.sohu.com/95719038.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('810', 'js验证身份证号，超准确 - 发表是最好的记忆 - 博客园', 'http://www.cnblogs.com/shenliang123/archive/2012/04/05/2432880.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('811', 'www.pudn.com - 程序员联合开发网 源代码数目215万个', 'http://www.pudn.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('812', 'Bootstrap表单构造器', 'http://www.bootcss.com/p/bootstrap-form-builder/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('813', 'CSS 圆角生成器', 'http://border-radius.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('814', 'Bootstrap中文网', 'http://www.bootcss.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('815', 'Email Suggest 邮箱输入提示演示', 'http://stylechen.com/wp-content/uploads/demo/email-suggest/index.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('816', 'CSS3 Generator', 'http://css3generator.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('817', 'DIV+CSS教程_DIV+CSS布局_十天学会div+css_web标准化——标准之路', 'http://www.aa25.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('818', '网页平面设计视频教程-html+css 全集-张鹏-传智播客 - 视频栏目合集 - 土豆', 'http://www.tudou.com/plcover/pEpqS6evark/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('819', 'HTML+CSS | 高品质 HTML+CSS 制作服务 – SonicHTML', 'http://www.sonichtml.com/category/html-css/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('820', 'HTML、CSS、JS网页设计入门到精通', 'http://wenku.it168.com/redian/design2012/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('821', 'DIV+CSS切图案例 防阿里云站', 'http://www.div123.com/cases/65.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('822', 'DIVCSS5 - DIV+CSS布局教程学习与CSS资源分享平台', 'http://www.divcss5.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('823', 'Your CSS Frame _ XHTML to CSS Converter', 'http://lab.xms.pl/css-generator/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('824', 'Grid Designer 2', 'http://grid.mindplay.dk/#[[0,0,0,0,0,0,0],[\'Verdana\',\'\',\'\',\'\',\'\',\'\',\'\'],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[1,2,2,2,2,2,2],[10,16,16,16,16,16,16],[0,0,0,0,0,0,0],[0,0,0,0,0,0,0],[2,20,16,22,924],{},[0,1]]', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('825', 'CSSMate - Online CSS Editor - Editor', 'http://cssmate.com/csseditor.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('826', 'CSS Type Set', 'http://csstypeset.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('827', 'CSS3 Click Chart | CSS3 Browser Support and Information', 'http://css3clickchart.com/#rotate-transform', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('828', 'js刷新页面方法大全_javascript技巧_脚本之家', 'http://www.jb51.net/article/14397.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('829', 'Jquery 获得Form下的所有text、checkbox等表单的值 - - ITeye技术网站', 'http://tsyouaschen.iteye.com/blog/704066', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('830', 'TouchSlide 触屏滑动特效插件 大话主席', 'http://www.superslide2.com/TouchSlide/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('831', 'JavaScript视频教程-JavaScrip网页特效精华制作-传智播客网页平面培训', 'http://icd.itcast.cn/news/20140320/16252477697.shtml?qq-pf-to=pcqq.group#', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('832', '20130725 上海OOW第四日_yangtingkun-ITPUB博客', 'http://blog.itpub.net/4227/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('833', 'Day 1: Bower —— 管理你的客户端依赖关系 - SegmentFault', 'http://segmentfault.com/a/1190000000349555', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('834', 'JavaScript程序员必备的5个debug技巧 – WEB骇客', 'http://www.webhek.com/5-javascript-debugging-tips', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('835', '详解MySQL中EXPLAIN解释命令 - 51CTO.COM', 'http://database.51cto.com/art/200912/168453.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('836', '播放器跨平台解决方案,极酷阳光播放器适配移动终端IPad,IPhone,安卓', 'http://www.cuplayer.com/CuSunPlayer/Help/Help415.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('837', 'css3动画简介以及动画库animate.css的使用 - 无双 - 博客园', 'http://www.cnblogs.com/2050/p/3409129.html?ADUIN=956149307&ADSESSION=1416875593&ADTAG=CLIENT.QQ.5329_.0&ADPUBNO=26349', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('838', '传智播客Android核心基础课程视频教程-[压缩包]–华为网盘|资源共享-文件备份-免费网络硬盘', 'http://dl.dbank.com/c06oaccbzg', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('839', 'PHP的包依赖管理工具Composer简介 - zzulp的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/zzulp/article/details/18981029', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('840', '1.2. 安装', 'http://www.php100.com/manual/ZendFramework/introduction.installation.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('841', 'Laravel-简洁、优雅的PHP开发框架(PHP Web Framework)。- Laravel中文网（Laravel中国社区）', 'http://v4.golaravel.com/docs/4.2', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('842', 'PHP 语法', 'http://www.w3school.com.cn/php/php_syntax.asp', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('843', '推荐CMS程序和网页模板、网页素材、网页在线工具等，分享建站经验！ - 酷站代码', 'http://www.5icool.org/jianzhanziyuan/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('844', 'PHP文件加密 - PHP在线加密平台', 'http://www.phpjm.net/encode.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('845', '循环执行SQL语句问题-技术问答-悬赏求助区-PHPChina - Powered by Discuz!', 'http://bbs.phpchina.com/thread-189327-1-1.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('846', 'php中foreach循环语句中可以使用sql查询语句吗？比如_百度知道', 'http://zhidao.baidu.com/link?url=NIrgVf_2TVCImz1ltgvaovsJY-RseozaQLocY6K6pB1ziFfkabHH7-0rN8REIRFLaHcziloURt9Ys8iLlfChkq', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('847', 'php批量执行sql语句_CaleHsieh_新浪博客', 'http://blog.sina.com.cn/s/blog_6ad624380101a0aq.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('848', 'mysql存储过程语法及实例 - 木月的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/wangchao0605/article/details/5935988', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('849', 'php 连接字符串处理_百度知道', 'http://zhidao.baidu.com/link?url=IZ4nfxsnGT7lYrBDe79Py0sq9A4tA2Y-xBSKo7pHxbc7-wWvLzScmo5s7gKWKaiR2uOdG2Z0FII5IM0WdkFfkK', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('850', 'PHP源码,PHP网站源码 - A5源码', 'http://down.admin5.com/php/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('851', 'php获取字符串中各个字符出现的次数 - php之路的日志 - 网易博客', 'http://phpway.blog.163.com/blog/static/212112005201292210847220/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('852', 'php字符串与字符替换函数 - 知识天地 - 博客园', 'http://www.cnblogs.com/mfryf/archive/2012/02/12/2347984.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('853', 'PHP系统设计与云架构-Hadoop架构-about云开发', 'http://www.aboutyun.com/thread-10296-1-1.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('854', '美图秀秀网页版 官方网站_在线制作图片及图片处理工具', 'http://xiuxiu.web.meitu.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('855', 'Highcharts中文网', 'http://www.hcharts.cn/index.php', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('856', '网盘 · 115互联我', 'http://115.com/?mode=index', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('857', 'APK Downloader | Download APK file Directly From Google Play.', 'http://downloader-apk.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('858', '响应式Screenfly ', 'http://quirktools.com/screenfly/?', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('859', '115网盘礼包_115网盘礼包码提取_网盘礼包码_文件提取码_网盘搜索_网盘资源_网盘下载_网络U盘_115网盘-115互联我-115.com', 'http://115.com/lb/5lbeeh17o4zf', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('860', 'Ultimate CSS Gradient Generator - ColorZilla.com', 'http://www.colorzilla.com/gradient-editor/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('861', 'md5在线查询破解,md5解密加密', 'http://www.cmd5.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('862', 'Free Website Builder | Create a Free Website | WIX.com', 'http://www.wix.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('863', '匿名查看别人空间最近访客 不留痕迹-QQ空间技巧-Q迅家园', 'http://www.qqxoo.com/qzone/200910/6082.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('864', '在线ico图标制作-快速制作ico图标、ico制作、icon图标制作和ico图标下载。', 'http://www.ico.la/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('865', '在线工具 —— 开源中国社区', 'http://tool.oschina.net/#preview', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('866', '百度用户服务中心', 'http://help.baidu.com/question?prod_en=search&class=%C3%E2%B7%D1%B4%FA%C2%EB&id=1000664', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('867', 'cssarrowplease', 'http://cssarrowplease.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('868', 'www.xiami.com/widget/imulti?spm=0.0.0.0.jp7bua', 'http://www.xiami.com/widget/imulti?spm=0.0.0.0.jp7bua', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('869', '20 个强大的 Sublime Text 插件 - OPEN资讯', 'http://www.open-open.com/news/view/26d731', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('870', '网站登录管理后台', 'http://admin.ev123.com/login.php', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('871', '杨青个人博客 - 一个站在web前端设计之路的女技术员个人博客网站', 'http://www.yangqq.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('872', '值得收藏的14款响应式前端开发框架-CSDN.NET', 'http://www.csdn.net/article/2013-07-25/2816344', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('873', 'scrollUp jQuery plugin — Mark Goodyear — Front-end developer and designer', 'http://markgoodyear.com/2013/01/scrollup-jquery-plugin/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('874', '响应资源网站Media Queries', 'http://mediaqueri.es/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('875', '响应式resizeMyBrowser', 'http://www.resizemybrowser.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('876', '[Modernizr]-----HTML5和CSS3开发利器 - hevily - 博客园', 'http://www.cnblogs.com/NetSos/archive/2012/03/26/2418053.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('877', '响应式ScreenQueri', 'http://beta.screenqueri.es/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('878', 'Treehouse Blog | Learn skills to change the world today!', 'http://blog.teamtreehouse.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('879', 'The home page of Author and responsive web designer Ben Frain', 'http://benfrain.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('880', '切图Super Marker', 'http://barretlee.github.io/SuperMarker/index_cn.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('881', '基于Bootstrap的响应式后台管理模板-Metronic1.3,超赞！-分享-最代码', 'http://www.zuidaima.com/share/2095739746143232.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('882', '必应 在线翻译', 'http://www.bing.com/translator/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('883', '新浪体育', 'http://sports.sina.com.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('884', '我的首页 新浪微博-随时随地分享身边的新鲜事儿', 'http://weibo.com/u/1571762267/home?topnav=1&wvr=5', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('885', '首页_饭否', 'http://fanfou.com/home', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('886', '清晨醒脑！T-ara根本停不下来！-斗鱼- 全民游戏直播平台', 'http://www.douyutv.com/iseven', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('887', '[〓领域〓] 钢铁И前沿 | 军团 | 坦克世界', 'http://ncw.worldoftanks.cn/community/clans/1733/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('888', '【[高清]郭德纲最新相声集】mp3在线收听，[高清]郭德纲最新相声集专辑打包下载 - 喜马拉雅网', 'http://www.ximalaya.com/1000202/album/238474', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('889', '【郭德纲精品相声】mp3在线收听，郭德纲精品相声专辑打包下载 - 喜马拉雅网', 'http://www.ximalaya.com/2668658/album/214646', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('890', '【资源】跟踪者自制双语剧本分享（随剧更新中）_stalker吧_百度贴吧', 'http://tieba.baidu.com/p/3329746028?pn=3', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('891', '2014年英国伦敦跨年烟火晚会()_视频在线观看 - 56.com', 'http://www.56.com/u29/v_MTAzNzQ1NDE4.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('892', 'aiesecforportal.force.com/membershipcenterLogin/TMPRegister?bj=gjjs', 'http://aiesecforportal.force.com/membershipcenterLogin/TMPRegister?bj=gjjs', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('893', 'CNN在线收听,美国CNN广播电台英语新闻节目网上直播收听练听力 - 飞达广播网', 'http://www.fltaradio.com/english/2-cnn-news.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('894', 'DetonationCP - 知乎', 'http://www.zhihu.com/people/detonationcp', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('895', 'FM2014 14.30版BUG转会及BUG签约 - 绿茵吧 - 一个球迷的呼声', 'http://www.lvyinba.com/fm/20140313/16316.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('896', 'FM2014 世界各国刷小牛的时间 - 11人足球网 - 11player.com', 'http://www.11player.com/FM/fm2014/zhidao/20131123136347.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('897', 'Glassdoor – Get Hired. Love Your Job.', 'http://www.glassdoor.com/index.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('898', 'https://www.linkedin.com/reg/join', 'https://www.linkedin.com/reg/join', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('899', 'JavaScript UI Library, Ajax Components & HTML5 Framework - DHTMLX', 'http://dhtmlx.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('900', 'liuxue5213 (John Scott)', 'https://github.com/liuxue5213', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('901', 'liuxue5213 - 个人中心 - Coding.Net', 'https://coding.net/user', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('902', 'plancksconstant.org/blog1/pdfs/SSRN-id961967.pdf', 'http://plancksconstant.org/blog1/pdfs/SSRN-id961967.pdf', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('903', 'Pocket : 我的列表', 'http://getpocket.com/a/queue/list/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('904', 'reddit: the front page of the internet', 'http://www.reddit.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('905', 'The Crafting Chicks – Ideas and Inspiration to Create Your Life.', 'http://thecraftingchicks.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('906', 'WarpRadio.com | WIRY-AM', 'http://player.warpradio.com/WIRY-AM/index.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('907', 'Xiaoxiao Blog', 'http://xiaoxiaozhao.net/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('908', '代码管理 - Sina App Engine', 'http://sae.sina.com.cn/?m=vermng&app_id=liuxue5213&ver=1', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('909', '多玩坦克世界盒子战斗力查询_多玩坦克世界官网合作专区', 'http://wot.duowan.com/zhanji/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('910', '国内-蜻蜓fm在线收听_最好的网络收音机|广播电台在线收听平台', 'http://qingting.fm/category/domestic', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('911', '教你如何使用php session_php实例_脚本之家', 'http://www.jb51.net/article/42500.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('912', '利用Mysql的DATE_FORMAT（）进行日期格式转换 - mini_snow的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/mini_snow/article/details/3118583', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('913', '慕课网-免费的IT技能学习平台', 'http://www.imooc.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('914', '纽约每日新闻', 'http://www.nydailynews.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('915', '轻松调频,飞鱼秀在线收听,CRI北京easy fm 91.5和上海easy fm 87.9 - 飞达广播网', 'http://www.fltaradio.com/english/125-cri-easy-fm.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('916', '日报英文版', 'http://www.chinadaily.com.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('917', '首页 - 中国红客联盟 - Powered by HUC', 'http://www.cnhonkerarmy.com/portal.php', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('918', '天津音乐广播 FM99.0-蜻蜓fm在线收听_最好的网络收音机|广播电台在线收听平台', 'http://qingting.fm/channels/1170', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('919', '微服360-微信公众号开发与管理平台', 'http://www.weifu360.com/index.jsp', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('920', '微信公众平台开发入门教程 - 微信公众平台开发：微信公众号开发平台教程，技术文摘 - 红黑联盟', 'http://www.2cto.com/weixin/201405/302733.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('921', '我的未来-十年后', 'http://10years.me/#85634', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('922', '写英语文章的时候还在用very么？', 'http://www.douban.com/note/479579917/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('923', '学信', 'http://www.chsi.com.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('924', '移动web前端小结 - 小米哥的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/small_rice_/article/details/22690535', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('925', '应用仓库 - Sina App Engine', 'http://sae.sina.com.cn/?m=appstore&category=8', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('926', '英语口语8000句文本_英语口语8000句', 'http://www.langfly.com/a/20130415/182455.shtml', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('927', '制作网页过程中经常要用到的代码_WEB前端开发', 'http://www.webclks.com/archives/89', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('928', '前端资源分享大杂烩|FE-国内最好的学习交流平台', 'http://html5jq.com/fe/hulianwangzuixinzixun/2015/0309/73.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('929', 'Google 翻译', 'http://translate.google.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('930', 'JS计算两个日期之间的天数 - zjrbiancheng的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/zjrbiancheng/article/details/6407571', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('931', '微博 文章 - 如何写好英文个人简历和求职信', 'http://weibo.com/p/1001603808338461757270', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('932', 'API網站 DevDocs/HTML/HTML5   ', 'http://devdocs.io/html-html5/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('933', 'JS关闭窗口与JS关闭页面的几种方法小结_javascript技巧_脚本之家', 'http://www.jb51.net/article/44514.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('934', '微云网页版', 'http://www.weiyun.com/disk/index.html?WYTAG=weiyun.portal.index', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('935', '学英语必看英语语法手册(全)_百度文库', 'http://wenku.baidu.com/view/0bf7a4956bec0975f465e2b0.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('936', '赖世雄中级美语教程+1-148课笔记_百度文库', 'http://wenku.baidu.com/view/be361f3367ec102de2bd8975.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('937', '上海哪里有好吃正宗不算贵的日本料理？ - 王志伟的回答 - 知乎', 'http://www.zhihu.com/question/20128992/answer/35733453', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('938', 'PHP新浪面试题及完整答案 - PHP点点通', 'http://www.phpddt.com/php/php-sina-test.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('939', 'php面试题及答案(原创) - 我的php学习与实践生涯 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/phpsome/article/details/4085464', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('940', 'PHP书写规范(1) - 51CTO.COM', 'http://developer.51cto.com/art/201107/274561.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('941', '7个超级实用的PHP代码片段分享(1) - 51CTO.COM', 'http://developer.51cto.com/art/201107/276005.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('942', 'PHP获取用户访问IP地址的5种方法 - IT博客达人网 - LAMP开发,PHP学习开发,C语言学习开发,VIM发烧友,自由开源分享 - 码农的博客', 'http://www.blogdaren.com/post-349.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('943', '藕粽的微博_微博', 'http://weibo.com/pleasecallmeavenue', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('944', '挑战最强大脑——来自全球的14个编码社区-CSDN.NET', 'http://www.csdn.net/article/2014-04-21/2819404-coding-challenges/1', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('945', 'git 命令常用总结 - NewPanderKing - 博客园', 'http://www.cnblogs.com/newpanderking/p/4005698.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('946', '首页 - 知乎', 'http://www.zhihu.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('947', '秦时明月官方社区-一亿目光注视的中国原创动画品牌-中国首部3D武侠动漫-玄机科技出品', 'http://www.qinsmoon.com/index', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('948', 'MongoDB在windows的安装 - luxideyao的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/luxideyao/article/details/19431289', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('949', 'html5调用手机摄像头，实现拍照上传功能', 'http://bbs.php100.com/simple/?t375686.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('950', 'HTTP错误 大全 403 401 400 404 304 200 - 服务器相关 - 技术文章 - 开源吧', 'http://www.kaiyuanba.cn/html/1/131/226/4258.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('951', 'MongoDB基本使用 - TankMa - 博客园', 'http://www.cnblogs.com/TankMa/archive/2011/06/08/2074947.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('952', '3.2. Hello World', 'http://www.laruence.com/manual/tutorial.firstpage.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('953', 'gre网络课堂|gre网络课程-菜鸟哦哦哦论坛 - 菜鸟哦哦哦论坛', 'http://cainiao.ooo/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('954', 'base64加密/解密_百度应用', 'http://app.baidu.com/107000_base64?keyword=base64%E5%8A%A0%E', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('955', '单引号和双引号的区别-慕课网', 'http://www.imooc.com/code/548', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('956', 'mysql 批量更新与批量更新多条记录的不同值实现方法_Mysql_脚本之家', 'http://www.jb51.net/article/41852.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('957', 'CSS代码格式化 css在线压缩工具', 'http://www.jb51.net/tools/cssyasuo.shtml', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('958', 'Bootstrap 字体图标(Glyphicons) | w3cschool菜鸟教程', 'http://www.runoob.com/bootstrap/bootstrap-glyphicons.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('959', '起步 · Bootstrap v3 中文文档', 'http://v3.bootcss.com/getting-started/#grunt-dist-css-javascript', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('960', '官方网页版飞信——在网页上与飞信好友聊天、免费发短信', 'https://webim.feixin.10086.cn/main.aspx', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('961', '摆脱无线干扰 双频无线路由的快速传输_NETGEAR WNDR4300_网络设备评测-中关村在线', 'http://net.zol.com.cn/374/3745294_all.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('962', 'Forms & HTML - Laravel - The PHP Framework For Web Artisans', 'http://laravel.com/docs/4.2/html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('963', '[译]Laravel 5.0 之 表单验证类 (Form Requests) - PHP - 裁纸刀下', 'http://ofcss.com/2015/02/10/laravel-5-form-requests.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('964', 'php框架laravel excel包使用教程介绍-Php常用代码-Php教程-壹聚教程网', 'http://www.111cn.net/phper/php-cy/80329.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('965', 'Laravel模板引擎Blade中section的一些标签的区别介绍_php技巧_脚本之家', 'http://www.jb51.net/article/60957.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('966', '制作ico图标 | 在线ico图标转换工具 方便制作favicon.ico - 比特虫 - Bitbug.net', 'http://www.bitbug.net/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('967', 'Introduction to Laravel Framework - Laravel Book', 'http://laravelbook.com/laravel-introduction/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('968', 'mysql 获取当前日期及格式化 - KANGBROTHER的专栏 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/kangbrother/article/details/7030304', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('969', 'H5交互页编辑器AEditor介绍 | Web前端 腾讯AlloyTeam Blog | 愿景: 成为地球卓越的Web团队！', 'http://www.alloyteam.com/2015/06/h5-jiao-hu-ye-bian-ji-qi-aeditor-jie-shao/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('970', 'Phaser - A fast, fun and free open source HTML5 game framework', 'http://phaser.io/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('971', '经典《老友记》1-10季#24小时直播-美剧FAN的直播直播间-龙珠直播,第一游戏直播平台', 'http://star.longzhu.com/554090', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('972', 'UCLA Extension: UCLA Extension Locations', 'https://www.uclaextension.edu/Pages/locations.aspx', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('973', 'PHP开发 - OPEN开发经验库', 'http://www.open-open.com/lib/list/39', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('974', 'laravel使用Caching缓存数据减轻数据库查询压力 - \'尛東峝學. - 博客频道 - CSDN.NET', 'http://blog.csdn.net/xd43100678/article/details/24377531', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('975', 'mewebstudio/captcha', 'https://github.com/mewebstudio/captcha', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('976', 'PHP: Memcached - Manual', 'http://php.net/manual/zh/book.memcached.php', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('977', '(6)php程序员的发展路线_资深高级php工程师_新浪博客', 'http://blog.sina.com.cn/s/blog_8efa3c4f0102v5fo.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('978', 'php class类的用法详细总结_php技巧_脚本之家', 'http://www.jb51.net/article/42172.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('979', 'Happy Schools - Study Abroad, U.S. Visa, Travel and Life Style', 'http://www.happyschools.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('980', 'Swift编程入门_电子书免费在线阅读_百度阅读', 'http://yuedu.baidu.com/ebook/6f6c3b1ef01dc281e43af000?fr=aladdin&key=Swift&f=read###', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('981', 'sunnyxx的技术博客', 'http://blog.sunnyxx.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('982', 'JAVASCRIPT加密方法，JS加密解密综述（7种） - 与时俱进 - 博客园', 'http://www.cnblogs.com/top5/archive/2009/08/07/1540860.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('983', 'PHP 之道', 'http://laravel-china.github.io/php-the-right-way/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('984', 'Swiper中文网', 'http://www.swiper.com.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('985', 'Webpack 入门指迷 - SegmentFault', 'http://segmentfault.com/a/1190000002551952', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('986', 'facebook/react', 'https://github.com/facebook/react', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('987', 'Your students | Khan Academy', 'https://www.khanacademy.org/coach/dashboard', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('988', '目录 | TIPI: 深入理解PHP内核', 'http://www.php-internals.com/book/?p=index', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('989', 'owner888/phpspider', 'https://github.com/owner888/phpspider', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('990', '1 Swift + Swifttype ft. Dogweather', 'https://www.livecoding.tv/video/1-swift-swifttype-ft-dogweather/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('991', '天津会计', 'http://www.tjkj.gov.cn/platform/tjkj/index2.jsp', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('992', '每天一个linux命令（61）：wget命令 - peida - 博客园', 'http://www.cnblogs.com/peida/archive/2013/03/18/2965369.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('993', 'barryvdh/laravel-dompdf', 'https://github.com/barryvdh/laravel-dompdf', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('994', 'Muhammad Usman - Stack Overflow Careers', 'http://careers.stackoverflow.com/usman', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('995', '黑客表头文字生成', 'http://patorjk.com/software/taag/#p=display&h=1&v=0&f=Big&t=liuxue', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('996', '2015新西兰技术移民打分系统(在线自测)', 'http://www.jack-liu.com/PointCheck/?', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('997', 'Bootstrap 警告框 | 菜鸟教程', 'http://www.runoob.com/bootstrap/bootstrap-alert-plugin.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('998', 'API调试工具_API Store', 'http://apistore.baidu.com/astore/toolshttpproxy?apiId=us2_yA&isAworks=1', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('999', '2015年韩剧,韩国电视剧在线观看 - H9T韩剧网', 'http://www.hanjucc.com/hanju/list_140_1.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1000', '(10)MySQL存储过程详解  mysql 存储过程_王者佳暮_新浪博客', 'http://blog.sina.com.cn/s/blog_52d20fbf0100ofd5.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1001', 'PHP中文乱码 完美解决PHP中文乱码问题_王者佳暮_新浪博客', 'http://blog.sina.com.cn/s/blog_52d20fbf0100obsz.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1002', 'php面试题目_php笔试题目_php面试测试_百度经验', 'http://jingyan.baidu.com/article/a65957f49e30a424e77f9b45.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1003', 'php牛逼的面试题分享_php技巧_脚本之家', 'http://www.jb51.net/article/33374.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1004', 'FTS-前端测试服务', 'http://fts.aliyun.com/index.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1005', '快速开始 | React', 'http://reactjs.cn/react/docs/getting-started.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1006', 'Ionic: Advanced HTML5 Hybrid Mobile App Framework', 'http://ionicframework.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1007', 'Python Programming Tutorials - YouTube', 'https://www.youtube.com/playlist?list=PLEA1FEF17E1E5C0DA&feature=plcp', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1008', 'qiwsir/ITArticles', 'https://github.com/qiwsir/ITArticles', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1009', 'Python Web 框架，第 1 部分: 使用 Django 和 Python 开发 Web 站点', 'http://www.ibm.com/developerworks/cn/linux/l-django/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1010', 'Converting SRT files to WebVTT files', 'http://www.webvtt.org/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1011', '响应式网站基础：HTML、CSS 与 JavaScript | MOOC中国 - 分享最好课程的中文慕课网', 'http://www.mooc.cn/course/5226.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1012', 'Mobizen -连接智能机和计算机', 'https://www.mobizen.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1013', 'SEVEN赛文柒收藏的歌曲', 'http://www.xiami.com/space/lib-song/u/8416395?spm=a1z1s.6928797.1561534497.5.TUfUeT', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1014', 'React 入门实例教程 - 阮一峰的网络日志', 'http://www.ruanyifeng.com/blog/2015/03/react.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1015', '风雪之隅-Laruence的博客', 'http://www.laruence.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1016', 'Norse Attack Map', 'http://map.norsecorp.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1017', 'OS X下机械键盘的设置和技巧（不仅仅是改苹果键） - Mac综合讨论区 - 威锋论坛 - 威锋网', 'http://bbs.feng.com/read-htm-tid-8746599.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1018', '企业号开发者接口文档', 'http://qydev.weixin.qq.com/wiki/index.php?title=%E9%A6%96%E9%A1%B5', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1019', 'PHP+redis实现超迷你全文检索 - myD - 博客园', 'http://www.cnblogs.com/iLoveMyD/p/4064704.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1020', 'CentOS 添加常用 yum 源 | IT农民工', 'http://blog.itnmg.net/centos-yum-source/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1021', 'Downloads · phpredis/phpredis · GitHub', 'https://github.com/phpredis/phpredis/downloads', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1022', '框架 - awesomes', 'http://www.awesomes.cn/repos/Applications/frameworks', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1023', '基于 Java 的 PHP 框架 —— Quercus 简介', 'http://www.ibm.com/developerworks/cn/web/wa-quercus/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1024', 'PHP源码阅读，PHP设计模式-胖胖的空间 | PHP　内核　扩展　程序　项目管理', 'http://www.phppan.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1025', '新版本蓝灯配置方法（Chrome浏览器）', 'http://card.weibo.com/article/h5/s#cid=1001603887053136859567&vid=1748622905&extparam=&from=1037299010&wm=3333_6001&ip=61.187.54.9', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1026', 'RESTful API 设计最佳实践 - 博客 - 伯乐在线', 'http://blog.jobbole.com/41233/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1027', '12306的变态验证码算得了什么？我们有Python大法！', 'http://mp.weixin.qq.com/s?__biz=MzA3NDM1NjUwMQ==&mid=400826756&idx=1&sn=9bca06d250c76bcdd8f352296b4e0117&scene=1&srcid=1208Uwk4gwklO5FeKnT8tYv0#rd', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1028', 'HIVE部署安装(笔记) - 李克华 - 博客园', 'http://www.cnblogs.com/likehua/p/3825479.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1029', '用PHP将数据导入到Foxmail的实现代码_php技巧_脚本之家', 'http://www.jb51.net/article/24725.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1030', 'DevX: Your Information Source for Enterprise Application Development', 'http://www.devx.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1031', 'Scrapy入门教程 - 方倍工作室 - 博客园', 'http://www.cnblogs.com/txw1958/archive/2012/07/16/scrapy-tutorial.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1032', '我心目中最好的框架组合是 - java,oracle,mysql,jquery,linux,Struts,Spring,Hibernate,maven webs', 'http://zz563143188.iteye.com/blog/1867767', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1033', 'Django 文档 — Django 1.8.2 中文文档', 'http://python.usyiyi.cn/django/index.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1034', 'laravel4视频学习教程合集附LARAVEL4.1中文文档－给力VIP收集整理提供－『网站技术』－给力VIP资源论坛', 'http://www.geilivip.com/thread-928-1-1.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1035', '对iWebShop测试的一些技巧和心得分享-iWebShop开源网店系统', 'http://bbs.aircheng.com/read-1046', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1036', 'tutorials/getting-started', 'http://webpack.github.io/docs/tutorials/getting-started/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1037', 'phodal/booktree', 'https://github.com/phodal/booktree', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1038', 'CMMI經驗談', 'http://www.javaforge.com/dir/1286', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1039', 'ZEALER 社区-分享您的手机数码硬件测评体验-知名电子发烧友论坛--苹果,三星,小米,魅族,华为,坚果,奇酷等品牌产品测评体验交流中心', 'http://plus.zealer.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1040', '鳥哥的 Linux 私房菜 -- 第零章、計算機概論', 'http://linux.vbird.org/linux_basic/0105computers.php#', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1041', '如何在新浪云 SAE 上安装部署 Laravel 5.1 应用并测试数据库连接 - 推酷', 'http://www.tuicool.com/articles/jUj6z2u', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1042', 'hosts – 蜂巢\'s Blog', 'http://blog.yadgen.com/?page_id=585', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1043', '首页 极客标签 | 在线编程知识分享学习平台', 'http://www.gbtags.com/gb/index.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1044', 'ratchetphp/Ratchet', 'https://github.com/ratchetphp/Ratchet', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1045', 'websocket - 易文', 'http://www.yxsss.com/sg.php?fp=0&tag=websocket', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1046', '管理中心 - 阿里大鱼', 'http://www.alidayu.com/admin/user/account?spm=a3142.7791109.2.1.L0k77H', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1047', '创建站点 - 多说，社会化评论框', 'http://duoshuo.com/create-site/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1048', '算法', 'http://poj.org/problemlist', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1049', '国人必备的30个Alfred Workflow – Mac玩儿法 | Mac软件下载 | Mac软件推荐', 'http://www.waerfa.com/alfred-workflow', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1050', 'MacGG-全球最大的中文资讯、技巧站', 'http://www.macgg.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1051', '小众软件', 'http://www.appinn.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1052', 'EER3 | 专注于为Web开发人员提供更优质的技术博文', 'http://eer3.com/article/article/index.htm', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1053', 'Kindle 电子书资源网站及网盘15G资源汇总（持续更新）', 'https://www.douban.com/note/525938172/?type=rec', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1054', '【新提醒】epub电子书 - Powered by Discuz!', 'http://lt.imobile.com.cn/forum-323-2.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1055', 'Bootstrap可视化布局系统', 'http://www.bootcss.com/p/layoutit/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1056', 'JavaScript 标准库 - JavaScript | MDN', 'https://developer.mozilla.org/zh-CN/docs/Web/JavaScript/Reference/Global_Objects', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1057', '互联网快报-微头条(wtoutiao.com)', 'http://www.wtoutiao.com/author/ekuaibao.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1058', '树莓派实验室 | Raspberry Pi中文资讯站，提供丰富的树莓派使用教程和DIY资讯', 'http://shumeipai.nxez.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1059', 'AJAX POST&跨域 解决方案 - CORS - 聂微东 - 博客园', 'http://www.cnblogs.com/Darren_code/p/cors.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1060', '为什么XMLHttpRequest的POST请求会变OPTIONS请求－XMLHttpRequest对象对HTTP请求的访问控制（CORS跨站资源共享） - I', 'http://itbilu.com/javascript/js/VkiXuUcC.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1061', 'CaptionBot - For pictures worth the thousand words', 'https://www.captionbot.ai/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1062', 'http_build_query用法,挺方便的 - zhjahch - 博客园', 'http://www.cnblogs.com/zhja/archive/2012/11/10/2764174.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1063', '如何使用手机作为树莓派的“屏幕”教程_树莓派吧_百度贴吧', 'http://tieba.baidu.com/p/4064959646?qq-pf-to=pcqq.group', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1064', '构建高并发高可用的电商平台架构实践 - 分布式架构、大数据、机器学习、搜索、推荐、广告 - 博客频道 - CSDN.NET', 'http://blog.csdn.net/yangbutao/article/details/12242441/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1065', 'Inception使用规范及说明文档', 'http://mysql-inception.github.io/inception-document/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1066', 'RealClearPolitics - Opinion, News, Analysis, Video and Polls', 'http://www.realclearpolitics.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1067', 'ECMAScript6-下一代Javascript标准 - w3ctech - 中国最大的前端技术社区', 'http://www.w3ctech.com/topic/741', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1068', 'jQuery分页插件 - OPEN开发经验库', 'http://www.open-open.com/lib/list/343', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1069', 'Unix时间戳(Unix timestamp)转换工具 - 站长工具', 'http://tool.chinaz.com/Tools/unixtime.aspx', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1070', '老左博客 - 便宜VPS_美国主机_域名优惠码_免费VPS及VPS教程', 'http://www.laozuo.org/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1071', '50首最好听的英文歌曲_百度文库', 'http://wenku.baidu.com/view/51b9e758be23482fb4da4c66.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1072', '百度一下，你就知道', 'https://www.baidu.com/index.php?tn=ylmf_4_pg&ch=3', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1073', '淘宝网', 'http://www.taobao.com/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1074', '中国佛教禅宗网 沩仰 曹洞 临济 云门 法眼 禅门公案', 'http://cz.zgfj.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1075', '天津市各区街道劳动保障服务中心地址电话_百度文库', 'http://wenku.baidu.com/view/903f06f5f90f76c661371af5.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1076', '网站导航设置-建站ABCV2012beta', 'http://admin.ev123.com/user_make_navi.php###', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1077', '在下天羽，《道家练气术》奉上。。_剑法吧_百度贴吧', 'http://tieba.baidu.com/p/2529802267', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1078', '显密文库 佛教文集 佛教电子书 佛教图书 佛经 佛教故事 藏传佛教', 'http://read.goodweb.cn/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1079', '打坐参禅禅定_佛门网', 'http://www.fomen123.com/fo/chan/', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1080', '视频制作软件会声会影 如何制作照片视频 - 狸窝转换器下载网', 'http://www.leawo.cn/space-756442-do-thread-id-36373.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1081', '菩提心 [http://1085498887.qzone.qq.com]', 'http://user.qzone.qq.com/1085498887/blog/1413875799', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1082', '天津去哪捐衣服?_百度知道', 'http://zhidao.baidu.com/link?url=qYbEZAO25c0uIkzQ60HXES-sjqXfuefTml8bK12k-U5z7wuE-poMDMSW4Vky8fOg3kzq-voexCMJwu6sVSxl2_', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1083', '甜蜜小清新 diy相册 韩国情侣 创意拍立得相册影集', 'http://www.36588.com.cn/product-171011539.html', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');
INSERT INTO `nav_titles` VALUES ('1084', '超级方块_百度搜索', 'https://www.baidu.com/index.php?tn=ylmf_4_pg&ch=3', '', '10', null, '7', '1', 'open', '2016-05-03 17:02:58', '2016-05-03 17:02:58');

-- ----------------------------
-- Table structure for nav_users
-- ----------------------------
DROP TABLE IF EXISTS `nav_users`;
CREATE TABLE `nav_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(255) NOT NULL,
  `sex` int(1) DEFAULT NULL,
  `birthday` date DEFAULT NULL COMMENT '0',
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT '0',
  PRIMARY KEY (`id`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_users
-- ----------------------------
INSERT INTO `nav_users` VALUES ('6', 'JohnScott', '956149307@qq.com', '11df9baea40a071c081c0fdb149911bf', '1', '1989-07-25', '2016-04-29 15:48:03', '2016-04-29 15:48:03', '1');
INSERT INTO `nav_users` VALUES ('9', 'test', '13920669186', '11df9baea40a071c081c0fdb149911bf', '1', '2001-04-16', '2016-04-29 17:07:52', '2016-04-29 17:07:52', '1');
INSERT INTO `nav_users` VALUES ('10', 'liuxue', 'liuxue5213', '9467bb1a1692c911ae8f237a63b92d62', '1', '2000-09-16', '2016-05-03 16:27:02', '2016-05-03 16:27:02', '1');

-- ----------------------------
-- Table structure for nav_users_info
-- ----------------------------
DROP TABLE IF EXISTS `nav_users_info`;
CREATE TABLE `nav_users_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `other_email` varchar(255) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `home_url` varchar(255) DEFAULT NULL,
  `qq_no` int(15) DEFAULT NULL,
  `location` varchar(50) DEFAULT NULL,
  `wechat_no` varchar(50) DEFAULT NULL,
  `interest1` varchar(20) DEFAULT NULL,
  `interest2` varchar(20) DEFAULT NULL,
  `interest3` varchar(20) DEFAULT NULL,
  `updated_time` datetime DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  PRIMARY KEY (`id`,`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_users_info
-- ----------------------------
INSERT INTO `nav_users_info` VALUES ('4', '10', '956149307@qq.com', '13920669186@qq.com', '18600578961', 'liuxue890725@sinaapp.com', '956149307', '北京', 'liuxue5213', '体育', '音乐', '看书\0\0\0\0\0\0\0\0\0\0\0\0\0\0', '2016-05-03 19:35:59', '2016-05-03 18:54:55', '1');

-- ----------------------------
-- Table structure for nav_users_logs
-- ----------------------------
DROP TABLE IF EXISTS `nav_users_logs`;
CREATE TABLE `nav_users_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `log` varchar(255) DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_users_logs
-- ----------------------------
INSERT INTO `nav_users_logs` VALUES ('1', '6', 'user', '用户登录', '2016-05-03 11:13:36');
INSERT INTO `nav_users_logs` VALUES ('2', '6', 'user', '用户退出登录', '2016-05-03 13:42:09');
INSERT INTO `nav_users_logs` VALUES ('3', '6', 'user', '用户登录', '2016-05-03 14:00:54');
INSERT INTO `nav_users_logs` VALUES ('4', '6', 'user', '用户退出登录', '2016-05-03 14:06:45');
INSERT INTO `nav_users_logs` VALUES ('5', '6', 'user', '用户登录', '2016-05-03 14:07:14');
INSERT INTO `nav_users_logs` VALUES ('6', '6', 'user', '用户退出登录', '2016-05-03 14:08:43');
INSERT INTO `nav_users_logs` VALUES ('7', '6', 'user', '用户登录', '2016-05-03 14:08:47');
INSERT INTO `nav_users_logs` VALUES ('8', '6', 'user', '用户退出登录', '2016-05-03 14:08:57');
INSERT INTO `nav_users_logs` VALUES ('9', '6', 'user', '用户登录', '2016-05-03 14:09:08');
INSERT INTO `nav_users_logs` VALUES ('10', '6', 'user', '用户退出登录', '2016-05-03 14:12:00');
INSERT INTO `nav_users_logs` VALUES ('11', '6', 'user', '用户登录', '2016-05-03 14:12:07');
INSERT INTO `nav_users_logs` VALUES ('12', '6', 'user', '用户登录', '2016-05-03 14:13:56');
INSERT INTO `nav_users_logs` VALUES ('13', '6', 'user', '用户登录', '2016-05-03 15:12:44');
INSERT INTO `nav_users_logs` VALUES ('14', '6', 'user', '用户退出登录', '2016-05-03 16:23:27');
INSERT INTO `nav_users_logs` VALUES ('15', '10', 'user', '用户注册', '2016-05-03 16:27:02');

-- ----------------------------
-- Table structure for nav_users_title_group
-- ----------------------------
DROP TABLE IF EXISTS `nav_users_title_group`;
CREATE TABLE `nav_users_title_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `visit_id` int(11) DEFAULT NULL COMMENT '查看用户ID',
  `user_group_type_id` int(11) DEFAULT NULL COMMENT '可查看的分组',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_users_title_group
-- ----------------------------
INSERT INTO `nav_users_title_group` VALUES ('1', '9', '6', '1');
INSERT INTO `nav_users_title_group` VALUES ('2', '9', '6', '2');
INSERT INTO `nav_users_title_group` VALUES ('3', '9', '6', '3');
