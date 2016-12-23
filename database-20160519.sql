-- phpMyAdmin SQL Dump
-- version 4.4.15.2
-- http://www.phpmyadmin.net
--
-- 主機: localhost
-- 產生時間： 2016 年 12 月 23 日 02:15
-- 伺服器版本: 5.5.53-0+deb7u1
-- PHP 版本： 5.4.4-14+deb7u5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `ocs`
--

-- --------------------------------------------------------

--
-- 資料表結構 `access_keys`
--

CREATE TABLE IF NOT EXISTS `access_keys` (
  `access_key_id` bigint(20) NOT NULL,
  `context` varchar(40) NOT NULL,
  `key_hash` varchar(40) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `expiry_date` datetime NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `announcements`
--

CREATE TABLE IF NOT EXISTS `announcements` (
  `announcement_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `date_expire` datetime DEFAULT NULL,
  `date_posted` datetime NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `announcement_settings`
--

CREATE TABLE IF NOT EXISTS `announcement_settings` (
  `announcement_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `announcement_types`
--

CREATE TABLE IF NOT EXISTS `announcement_types` (
  `type_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `announcement_type_settings`
--

CREATE TABLE IF NOT EXISTS `announcement_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `auth_sources`
--

CREATE TABLE IF NOT EXISTS `auth_sources` (
  `auth_id` bigint(20) NOT NULL,
  `title` varchar(60) NOT NULL,
  `plugin` varchar(32) NOT NULL,
  `auth_default` tinyint(4) NOT NULL DEFAULT '0',
  `settings` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `building_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `building_settings`
--

CREATE TABLE IF NOT EXISTS `building_settings` (
  `building_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `captchas`
--

CREATE TABLE IF NOT EXISTS `captchas` (
  `captcha_id` bigint(20) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `value` varchar(20) NOT NULL,
  `date_created` datetime NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `comments`
--

CREATE TABLE IF NOT EXISTS `comments` (
  `comment_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `num_children` int(11) NOT NULL DEFAULT '0',
  `user_id` bigint(20) DEFAULT NULL,
  `poster_ip` varchar(15) NOT NULL,
  `poster_name` varchar(90) DEFAULT NULL,
  `poster_email` varchar(90) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `body` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `conferences`
--

CREATE TABLE IF NOT EXISTS `conferences` (
  `conference_id` bigint(20) NOT NULL,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `primary_locale` varchar(5) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `conference_event_log`
--

CREATE TABLE IF NOT EXISTS `conference_event_log` (
  `log_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) DEFAULT NULL,
  `conference_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `log_level` varchar(1) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `is_translated` tinyint(4) DEFAULT NULL,
  `entry_params` text,
  `message` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `conference_settings`
--

CREATE TABLE IF NOT EXISTS `conference_settings` (
  `conference_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `controlled_vocabs`
--

CREATE TABLE IF NOT EXISTS `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL,
  `symbolic` varchar(32) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `controlled_vocab_entries`
--

CREATE TABLE IF NOT EXISTS `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `controlled_vocab_entry_settings`
--

CREATE TABLE IF NOT EXISTS `controlled_vocab_entry_settings` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `custom_track_orders`
--

CREATE TABLE IF NOT EXISTS `custom_track_orders` (
  `sched_conf_id` bigint(20) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `edit_assignments`
--

CREATE TABLE IF NOT EXISTS `edit_assignments` (
  `edit_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `director_id` bigint(20) NOT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_underway` datetime DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `edit_decisions`
--

CREATE TABLE IF NOT EXISTS `edit_decisions` (
  `edit_decision_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `stage` tinyint(4) NOT NULL,
  `director_id` bigint(20) NOT NULL,
  `decision` tinyint(4) NOT NULL,
  `date_decided` datetime NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `email_templates`
--

CREATE TABLE IF NOT EXISTS `email_templates` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(64) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `email_templates_data`
--

CREATE TABLE IF NOT EXISTS `email_templates_data` (
  `email_key` varchar(64) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `subject` varchar(120) NOT NULL,
  `body` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `email_templates_default`
--

CREATE TABLE IF NOT EXISTS `email_templates_default` (
  `email_id` bigint(20) NOT NULL,
  `email_key` varchar(30) NOT NULL,
  `can_disable` tinyint(4) NOT NULL DEFAULT '1',
  `can_edit` tinyint(4) NOT NULL DEFAULT '1',
  `from_role_id` bigint(20) DEFAULT NULL,
  `to_role_id` bigint(20) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `email_templates_default_data`
--

CREATE TABLE IF NOT EXISTS `email_templates_default_data` (
  `email_key` varchar(30) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'en_US',
  `subject` varchar(120) NOT NULL,
  `body` text,
  `description` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `groups`
--

CREATE TABLE IF NOT EXISTS `groups` (
  `group_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `context` bigint(20) DEFAULT NULL,
  `about_displayed` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `group_memberships`
--

CREATE TABLE IF NOT EXISTS `group_memberships` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `about_displayed` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `group_settings`
--

CREATE TABLE IF NOT EXISTS `group_settings` (
  `group_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `notification_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `level` bigint(20) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `date_read` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `contents` text,
  `param` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `is_localized` tinyint(4) NOT NULL DEFAULT '1',
  `product` varchar(20) DEFAULT NULL,
  `context` bigint(20) NOT NULL,
  `assoc_type` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `notification_settings`
--

CREATE TABLE IF NOT EXISTS `notification_settings` (
  `setting_id` bigint(20) NOT NULL,
  `setting_name` varchar(64) NOT NULL,
  `setting_value` text,
  `user_id` bigint(20) NOT NULL,
  `product` varchar(20) DEFAULT NULL,
  `context` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `oai_resumption_tokens`
--

CREATE TABLE IF NOT EXISTS `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `papers`
--

CREATE TABLE IF NOT EXISTS `papers` (
  `paper_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `track_id` bigint(20) DEFAULT NULL,
  `language` varchar(10) DEFAULT 'en',
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `comments_to_dr` text,
  `citations` text,
  `date_submitted` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `date_status_modified` datetime DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `submission_progress` tinyint(4) NOT NULL DEFAULT '1',
  `review_mode` bigint(20) DEFAULT NULL,
  `current_stage` tinyint(4) NOT NULL DEFAULT '1',
  `submission_file_id` bigint(20) DEFAULT NULL,
  `revised_file_id` bigint(20) DEFAULT NULL,
  `review_file_id` bigint(20) DEFAULT NULL,
  `layout_file_id` bigint(20) DEFAULT NULL,
  `director_file_id` bigint(20) DEFAULT NULL,
  `pages` varchar(255) DEFAULT NULL,
  `date_to_presentations` datetime DEFAULT NULL,
  `date_to_archive` datetime DEFAULT NULL,
  `comments_status` tinyint(4) NOT NULL DEFAULT '0',
  `date_author_modified` datetime DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_authors`
--

CREATE TABLE IF NOT EXISTS `paper_authors` (
  `author_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `primary_contact` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0',
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(255) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_author_settings`
--

CREATE TABLE IF NOT EXISTS `paper_author_settings` (
  `author_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_comments`
--

CREATE TABLE IF NOT EXISTS `paper_comments` (
  `comment_id` bigint(20) NOT NULL,
  `comment_type` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `assoc_id` bigint(20) NOT NULL,
  `author_id` bigint(20) NOT NULL,
  `comment_title` varchar(255) NOT NULL,
  `comments` text,
  `date_posted` datetime DEFAULT NULL,
  `date_modified` datetime DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_email_log`
--

CREATE TABLE IF NOT EXISTS `paper_email_log` (
  `log_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `sender_id` bigint(20) NOT NULL,
  `date_sent` datetime NOT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `from_address` varchar(255) DEFAULT NULL,
  `recipients` text,
  `cc_recipients` text,
  `bcc_recipients` text,
  `subject` varchar(255) DEFAULT NULL,
  `body` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_event_log`
--

CREATE TABLE IF NOT EXISTS `paper_event_log` (
  `log_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_logged` datetime NOT NULL,
  `ip_address` varchar(15) NOT NULL,
  `log_level` varchar(1) DEFAULT NULL,
  `event_type` bigint(20) DEFAULT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `is_translated` tinyint(4) DEFAULT NULL,
  `entry_params` text,
  `message` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_files`
--

CREATE TABLE IF NOT EXISTS `paper_files` (
  `file_id` bigint(20) NOT NULL,
  `revision` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) NOT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `type` varchar(40) NOT NULL,
  `stage` tinyint(4) DEFAULT NULL,
  `viewable` tinyint(4) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_galleys`
--

CREATE TABLE IF NOT EXISTS `paper_galleys` (
  `galley_id` bigint(20) NOT NULL,
  `locale` varchar(5) DEFAULT NULL,
  `paper_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `label` varchar(32) DEFAULT NULL,
  `html_galley` tinyint(4) NOT NULL DEFAULT '0',
  `style_file_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_html_galley_images`
--

CREATE TABLE IF NOT EXISTS `paper_html_galley_images` (
  `galley_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_notes`
--

CREATE TABLE IF NOT EXISTS `paper_notes` (
  `note_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `title` varchar(255) NOT NULL,
  `note` text,
  `file_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_search_keyword_list`
--

CREATE TABLE IF NOT EXISTS `paper_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword_text` varchar(60) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_search_objects`
--

CREATE TABLE IF NOT EXISTS `paper_search_objects` (
  `object_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_search_object_keywords`
--

CREATE TABLE IF NOT EXISTS `paper_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_settings`
--

CREATE TABLE IF NOT EXISTS `paper_settings` (
  `paper_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_supplementary_files`
--

CREATE TABLE IF NOT EXISTS `paper_supplementary_files` (
  `supp_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `type` varchar(255) DEFAULT NULL,
  `language` varchar(10) DEFAULT NULL,
  `public_supp_file_id` varchar(255) DEFAULT NULL,
  `date_created` date DEFAULT NULL,
  `show_reviewers` tinyint(4) DEFAULT '0',
  `date_submitted` datetime NOT NULL,
  `seq` double NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_supp_file_settings`
--

CREATE TABLE IF NOT EXISTS `paper_supp_file_settings` (
  `supp_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paypal_transactions`
--

CREATE TABLE IF NOT EXISTS `paypal_transactions` (
  `txn_id` varchar(17) NOT NULL,
  `txn_type` varchar(20) DEFAULT NULL,
  `payer_email` varchar(127) DEFAULT NULL,
  `receiver_email` varchar(127) DEFAULT NULL,
  `item_number` varchar(127) DEFAULT NULL,
  `payment_date` varchar(127) DEFAULT NULL,
  `payer_id` varchar(13) DEFAULT NULL,
  `receiver_id` varchar(13) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `plugin_settings`
--

CREATE TABLE IF NOT EXISTS `plugin_settings` (
  `plugin_name` varchar(80) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `conference_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `setting_name` varchar(80) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `published_papers`
--

CREATE TABLE IF NOT EXISTS `published_papers` (
  `pub_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `room_id` bigint(20) DEFAULT NULL,
  `date_published` datetime NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `views` int(11) NOT NULL DEFAULT '0',
  `public_paper_id` varchar(255) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `queued_payments`
--

CREATE TABLE IF NOT EXISTS `queued_payments` (
  `queued_payment_id` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `date_modified` datetime NOT NULL,
  `expiry_date` date DEFAULT NULL,
  `payment_data` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registrations`
--

CREATE TABLE IF NOT EXISTS `registrations` (
  `registration_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `type_id` bigint(20) NOT NULL,
  `date_registered` date NOT NULL,
  `date_paid` date DEFAULT NULL,
  `membership` varchar(40) DEFAULT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `ip_range` text,
  `special_requests` text,
  `survey` text,
  `application_form` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_options`
--

CREATE TABLE IF NOT EXISTS `registration_options` (
  `option_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `code` varchar(80) DEFAULT NULL,
  `opening_date` date DEFAULT NULL,
  `closing_date` datetime NOT NULL,
  `pub` tinyint(4) NOT NULL,
  `seq` double NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_option_assoc`
--

CREATE TABLE IF NOT EXISTS `registration_option_assoc` (
  `option_id` bigint(20) NOT NULL,
  `registration_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_option_costs`
--

CREATE TABLE IF NOT EXISTS `registration_option_costs` (
  `type_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `cost` double NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_option_settings`
--

CREATE TABLE IF NOT EXISTS `registration_option_settings` (
  `option_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_types`
--

CREATE TABLE IF NOT EXISTS `registration_types` (
  `type_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `code` varchar(80) DEFAULT NULL,
  `cost` double NOT NULL,
  `currency_code_alpha` varchar(3) NOT NULL,
  `opening_date` date DEFAULT NULL,
  `closing_date` datetime NOT NULL,
  `expiry_date` datetime DEFAULT NULL,
  `access` smallint(6) NOT NULL,
  `institutional` tinyint(4) NOT NULL DEFAULT '0',
  `membership` tinyint(4) NOT NULL DEFAULT '0',
  `pub` tinyint(4) NOT NULL,
  `seq` double NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_type_settings`
--

CREATE TABLE IF NOT EXISTS `registration_type_settings` (
  `type_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_assignments`
--

CREATE TABLE IF NOT EXISTS `review_assignments` (
  `review_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `reviewer_id` bigint(20) NOT NULL,
  `recommendation` tinyint(4) DEFAULT NULL,
  `date_assigned` datetime DEFAULT NULL,
  `date_notified` datetime DEFAULT NULL,
  `date_confirmed` datetime DEFAULT NULL,
  `date_completed` datetime DEFAULT NULL,
  `date_acknowledged` datetime DEFAULT NULL,
  `date_due` datetime DEFAULT NULL,
  `last_modified` datetime DEFAULT NULL,
  `reminder_was_automatic` tinyint(4) NOT NULL DEFAULT '0',
  `declined` tinyint(4) NOT NULL DEFAULT '0',
  `replaced` tinyint(4) NOT NULL DEFAULT '0',
  `cancelled` tinyint(4) NOT NULL DEFAULT '0',
  `reviewer_file_id` bigint(20) DEFAULT NULL,
  `date_rated` datetime DEFAULT NULL,
  `date_reminded` datetime DEFAULT NULL,
  `quality` tinyint(4) DEFAULT NULL,
  `stage` tinyint(4) NOT NULL DEFAULT '1',
  `review_form_id` bigint(20) DEFAULT NULL,
  `comment_author` text,
  `comment_director` text,
  `comment_survey` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_forms`
--

CREATE TABLE IF NOT EXISTS `review_forms` (
  `review_form_id` bigint(20) NOT NULL,
  `assoc_type` bigint(20) DEFAULT NULL,
  `assoc_id` bigint(20) DEFAULT NULL,
  `seq` double DEFAULT NULL,
  `is_active` tinyint(4) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_form_elements`
--

CREATE TABLE IF NOT EXISTS `review_form_elements` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL,
  `element_type` bigint(20) DEFAULT NULL,
  `required` tinyint(4) DEFAULT NULL,
  `included` tinyint(4) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_form_element_settings`
--

CREATE TABLE IF NOT EXISTS `review_form_element_settings` (
  `review_form_element_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_form_responses`
--

CREATE TABLE IF NOT EXISTS `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_form_settings`
--

CREATE TABLE IF NOT EXISTS `review_form_settings` (
  `review_form_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_stages`
--

CREATE TABLE IF NOT EXISTS `review_stages` (
  `paper_id` bigint(20) NOT NULL,
  `stage` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `conference_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` bigint(20) NOT NULL,
  `building_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `room_settings`
--

CREATE TABLE IF NOT EXISTS `room_settings` (
  `room_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `rt_contexts`
--

CREATE TABLE IF NOT EXISTS `rt_contexts` (
  `context_id` bigint(20) NOT NULL,
  `version_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `abbrev` varchar(32) NOT NULL,
  `description` text,
  `cited_by` tinyint(4) NOT NULL DEFAULT '0',
  `author_terms` tinyint(4) NOT NULL DEFAULT '0',
  `define_terms` tinyint(4) NOT NULL DEFAULT '0',
  `geo_terms` tinyint(4) NOT NULL DEFAULT '0',
  `seq` double NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `rt_searches`
--

CREATE TABLE IF NOT EXISTS `rt_searches` (
  `search_id` bigint(20) NOT NULL,
  `context_id` bigint(20) NOT NULL,
  `title` varchar(120) NOT NULL,
  `description` text,
  `url` text,
  `search_url` text,
  `search_post` text,
  `seq` double NOT NULL DEFAULT '0'
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `rt_versions`
--

CREATE TABLE IF NOT EXISTS `rt_versions` (
  `version_id` bigint(20) NOT NULL,
  `conference_id` bigint(20) NOT NULL,
  `version_key` varchar(40) NOT NULL,
  `locale` varchar(5) DEFAULT 'en_US',
  `title` varchar(120) NOT NULL,
  `description` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `scheduled_tasks`
--

CREATE TABLE IF NOT EXISTS `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `sched_confs`
--

CREATE TABLE IF NOT EXISTS `sched_confs` (
  `sched_conf_id` bigint(20) NOT NULL,
  `conference_id` bigint(20) DEFAULT NULL,
  `path` varchar(32) NOT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `sched_conf_settings`
--

CREATE TABLE IF NOT EXISTS `sched_conf_settings` (
  `sched_conf_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `sessions`
--

CREATE TABLE IF NOT EXISTS `sessions` (
  `session_id` varchar(40) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(39) NOT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created` bigint(20) NOT NULL DEFAULT '0',
  `last_used` bigint(20) NOT NULL DEFAULT '0',
  `remember` tinyint(4) NOT NULL DEFAULT '0',
  `data` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `site`
--

CREATE TABLE IF NOT EXISTS `site` (
  `redirect` bigint(20) NOT NULL DEFAULT '0',
  `primary_locale` varchar(5) NOT NULL,
  `min_password_length` tinyint(4) NOT NULL DEFAULT '6',
  `installed_locales` varchar(255) NOT NULL DEFAULT 'en_US',
  `supported_locales` varchar(255) DEFAULT NULL,
  `original_style_file_name` varchar(255) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `special_events`
--

CREATE TABLE IF NOT EXISTS `special_events` (
  `special_event_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `room_id` bigint(20) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `special_event_settings`
--

CREATE TABLE IF NOT EXISTS `special_event_settings` (
  `special_event_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `static_pages`
--

CREATE TABLE IF NOT EXISTS `static_pages` (
  `static_page_id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `conference_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `static_page_settings`
--

CREATE TABLE IF NOT EXISTS `static_page_settings` (
  `static_page_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` longtext,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `temporary_files`
--

CREATE TABLE IF NOT EXISTS `temporary_files` (
  `file_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `file_name` varchar(90) NOT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `file_size` bigint(20) NOT NULL,
  `original_file_name` varchar(127) DEFAULT NULL,
  `date_uploaded` datetime NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `time_blocks`
--

CREATE TABLE IF NOT EXISTS `time_blocks` (
  `time_block_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `assigned_colour` varchar(6) DEFAULT NULL,
  `unassigned_colour` varchar(6) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `time_block_settings`
--

CREATE TABLE IF NOT EXISTS `time_block_settings` (
  `time_block_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `tracks`
--

CREATE TABLE IF NOT EXISTS `tracks` (
  `track_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `review_form_id` bigint(20) DEFAULT NULL,
  `seq` double NOT NULL DEFAULT '0',
  `director_restricted` tinyint(4) NOT NULL DEFAULT '0',
  `meta_reviewed` tinyint(4) NOT NULL DEFAULT '1',
  `hide_about` tinyint(4) NOT NULL DEFAULT '0',
  `disable_comments` tinyint(4) NOT NULL DEFAULT '0',
  `abstract_word_count` bigint(20) DEFAULT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `track_directors`
--

CREATE TABLE IF NOT EXISTS `track_directors` (
  `sched_conf_id` bigint(20) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `track_settings`
--

CREATE TABLE IF NOT EXISTS `track_settings` (
  `track_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` bigint(20) NOT NULL,
  `username` varchar(32) NOT NULL,
  `password` varchar(40) NOT NULL,
  `salutation` varchar(40) DEFAULT NULL,
  `first_name` varchar(40) NOT NULL,
  `middle_name` varchar(40) DEFAULT NULL,
  `last_name` varchar(90) NOT NULL,
  `gender` varchar(1) DEFAULT NULL,
  `initials` varchar(5) DEFAULT NULL,
  `affiliation` varchar(255) DEFAULT NULL,
  `email` varchar(90) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `phone` varchar(24) DEFAULT NULL,
  `fax` varchar(24) DEFAULT NULL,
  `mailing_address` varchar(255) DEFAULT NULL,
  `country` varchar(90) DEFAULT NULL,
  `locales` varchar(255) DEFAULT NULL,
  `date_last_email` datetime DEFAULT NULL,
  `date_registered` datetime NOT NULL,
  `date_validated` datetime DEFAULT NULL,
  `date_last_login` datetime NOT NULL,
  `must_change_password` tinyint(4) DEFAULT NULL,
  `auth_id` bigint(20) DEFAULT NULL,
  `auth_str` varchar(255) DEFAULT NULL,
  `disabled` tinyint(4) NOT NULL DEFAULT '0',
  `disabled_reason` text
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `user_settings`
--

CREATE TABLE IF NOT EXISTS `user_settings` (
  `user_id` bigint(20) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_name` varchar(255) NOT NULL,
  `assoc_type` bigint(20) DEFAULT '0',
  `assoc_id` bigint(20) DEFAULT '0',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `versions`
--

CREATE TABLE IF NOT EXISTS `versions` (
  `major` int(11) NOT NULL DEFAULT '0',
  `minor` int(11) NOT NULL DEFAULT '0',
  `revision` int(11) NOT NULL DEFAULT '0',
  `build` int(11) NOT NULL DEFAULT '0',
  `date_installed` datetime NOT NULL,
  `current` tinyint(4) NOT NULL DEFAULT '0',
  `product_type` varchar(30) DEFAULT NULL,
  `product` varchar(30) DEFAULT NULL
) DEFAULT CHARSET=utf8;

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `access_keys`
--
ALTER TABLE `access_keys`
  ADD PRIMARY KEY (`access_key_id`),
  ADD KEY `access_keys_hash` (`key_hash`,`user_id`,`context`);

--
-- 資料表索引 `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`),
  ADD KEY `announcements_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`),
  ADD KEY `announcement_settings_announcement_id` (`announcement_id`);

--
-- 資料表索引 `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `announcement_type_settings_type_id` (`type_id`);

--
-- 資料表索引 `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`auth_id`);

--
-- 資料表索引 `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`building_id`),
  ADD KEY `building_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `building_settings`
--
ALTER TABLE `building_settings`
  ADD UNIQUE KEY `building_settings_pkey` (`building_id`,`locale`,`setting_name`),
  ADD KEY `building_settings_building_id` (`building_id`);

--
-- 資料表索引 `captchas`
--
ALTER TABLE `captchas`
  ADD PRIMARY KEY (`captcha_id`);

--
-- 資料表索引 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `comments_paper_id` (`paper_id`),
  ADD KEY `comments_parent_comment_id` (`parent_comment_id`);

--
-- 資料表索引 `conferences`
--
ALTER TABLE `conferences`
  ADD PRIMARY KEY (`conference_id`),
  ADD UNIQUE KEY `conferences_path` (`path`);

--
-- 資料表索引 `conference_event_log`
--
ALTER TABLE `conference_event_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `conference_event_log_sched_conf_id` (`sched_conf_id`),
  ADD KEY `conference_event_log_conference_id` (`conference_id`);

--
-- 資料表索引 `conference_settings`
--
ALTER TABLE `conference_settings`
  ADD UNIQUE KEY `conference_settings_pkey` (`conference_id`,`locale`,`setting_name`),
  ADD KEY `conference_settings_conference_id` (`conference_id`);

--
-- 資料表索引 `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  ADD PRIMARY KEY (`controlled_vocab_id`),
  ADD UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`);

--
-- 資料表索引 `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD PRIMARY KEY (`controlled_vocab_entry_id`),
  ADD KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`);

--
-- 資料表索引 `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`),
  ADD KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`);

--
-- 資料表索引 `custom_track_orders`
--
ALTER TABLE `custom_track_orders`
  ADD KEY `custom_track_orders_pkey` (`sched_conf_id`,`track_id`);

--
-- 資料表索引 `edit_assignments`
--
ALTER TABLE `edit_assignments`
  ADD PRIMARY KEY (`edit_id`),
  ADD KEY `edit_assignments_paper_id` (`paper_id`),
  ADD KEY `edit_assignments_director_id` (`director_id`);

--
-- 資料表索引 `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD PRIMARY KEY (`edit_decision_id`),
  ADD KEY `edit_decisions_paper_id` (`paper_id`),
  ADD KEY `edit_decisions_director_id` (`director_id`);

--
-- 資料表索引 `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`email_id`),
  ADD UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`),
  ADD KEY `email_templates_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `email_templates_data`
--
ALTER TABLE `email_templates_data`
  ADD UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`);

--
-- 資料表索引 `email_templates_default`
--
ALTER TABLE `email_templates_default`
  ADD PRIMARY KEY (`email_id`),
  ADD KEY `email_templates_default_email_key` (`email_key`);

--
-- 資料表索引 `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  ADD UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`);

--
-- 資料表索引 `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`),
  ADD KEY `groups_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `group_memberships`
--
ALTER TABLE `group_memberships`
  ADD UNIQUE KEY `group_memberships_pkey` (`user_id`,`group_id`);

--
-- 資料表索引 `group_settings`
--
ALTER TABLE `group_settings`
  ADD UNIQUE KEY `group_settings_pkey` (`group_id`,`locale`,`setting_name`),
  ADD KEY `group_settings_group_id` (`group_id`);

--
-- 資料表索引 `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `notifications_by_user` (`product`,`user_id`,`level`,`context`);

--
-- 資料表索引 `notification_settings`
--
ALTER TABLE `notification_settings`
  ADD PRIMARY KEY (`setting_id`);

--
-- 資料表索引 `oai_resumption_tokens`
--
ALTER TABLE `oai_resumption_tokens`
  ADD UNIQUE KEY `oai_resumption_tokens_pkey` (`token`);

--
-- 資料表索引 `papers`
--
ALTER TABLE `papers`
  ADD PRIMARY KEY (`paper_id`),
  ADD KEY `papers_user_id` (`user_id`),
  ADD KEY `papers_sched_conf_id` (`sched_conf_id`),
  ADD KEY `papers_track_id` (`track_id`);

--
-- 資料表索引 `paper_authors`
--
ALTER TABLE `paper_authors`
  ADD PRIMARY KEY (`author_id`),
  ADD KEY `paper_authors_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_author_settings`
--
ALTER TABLE `paper_author_settings`
  ADD UNIQUE KEY `paper_author_settings_pkey` (`author_id`,`locale`,`setting_name`),
  ADD KEY `author_settings_author_id` (`author_id`);

--
-- 資料表索引 `paper_comments`
--
ALTER TABLE `paper_comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `paper_comments_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_email_log`
--
ALTER TABLE `paper_email_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `paper_email_log_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_event_log`
--
ALTER TABLE `paper_event_log`
  ADD PRIMARY KEY (`log_id`),
  ADD KEY `paper_event_log_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_files`
--
ALTER TABLE `paper_files`
  ADD PRIMARY KEY (`file_id`,`revision`),
  ADD KEY `paper_files_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_galleys`
--
ALTER TABLE `paper_galleys`
  ADD PRIMARY KEY (`galley_id`),
  ADD KEY `paper_galleys_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_html_galley_images`
--
ALTER TABLE `paper_html_galley_images`
  ADD UNIQUE KEY `paper_html_galley_images_pkey` (`galley_id`,`file_id`);

--
-- 資料表索引 `paper_notes`
--
ALTER TABLE `paper_notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `paper_notes_paper_id` (`paper_id`),
  ADD KEY `paper_notes_user_id` (`user_id`),
  ADD KEY `paper_notes_file_id` (`file_id`);

--
-- 資料表索引 `paper_search_keyword_list`
--
ALTER TABLE `paper_search_keyword_list`
  ADD PRIMARY KEY (`keyword_id`),
  ADD UNIQUE KEY `paper_search_keyword_text` (`keyword_text`);

--
-- 資料表索引 `paper_search_objects`
--
ALTER TABLE `paper_search_objects`
  ADD PRIMARY KEY (`object_id`);

--
-- 資料表索引 `paper_search_object_keywords`
--
ALTER TABLE `paper_search_object_keywords`
  ADD UNIQUE KEY `paper_search_object_keywords_pkey` (`object_id`,`pos`),
  ADD KEY `paper_search_object_keywords_keyword_id` (`keyword_id`);

--
-- 資料表索引 `paper_settings`
--
ALTER TABLE `paper_settings`
  ADD UNIQUE KEY `paper_settings_pkey` (`paper_id`,`locale`,`setting_name`),
  ADD KEY `paper_settings_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_supplementary_files`
--
ALTER TABLE `paper_supplementary_files`
  ADD PRIMARY KEY (`supp_id`),
  ADD KEY `paper_supplementary_files_file_id` (`file_id`),
  ADD KEY `paper_supplementary_files_paper_id` (`paper_id`),
  ADD KEY `paper_supplementary_files_public_issue_id` (`public_supp_file_id`);

--
-- 資料表索引 `paper_supp_file_settings`
--
ALTER TABLE `paper_supp_file_settings`
  ADD UNIQUE KEY `paper_supp_file_settings_pkey` (`supp_id`,`locale`,`setting_name`),
  ADD KEY `paper_supp_file_settings_supp_id` (`supp_id`);

--
-- 資料表索引 `paypal_transactions`
--
ALTER TABLE `paypal_transactions`
  ADD PRIMARY KEY (`txn_id`);

--
-- 資料表索引 `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`locale`,`sched_conf_id`,`conference_id`,`setting_name`),
  ADD KEY `plugin_settings_plugin_name` (`plugin_name`);

--
-- 資料表索引 `published_papers`
--
ALTER TABLE `published_papers`
  ADD PRIMARY KEY (`pub_id`),
  ADD UNIQUE KEY `published_papers_paper_id` (`paper_id`),
  ADD KEY `published_papers_sched_conf_id` (`sched_conf_id`),
  ADD KEY `published_papers_public_paper_id` (`public_paper_id`);

--
-- 資料表索引 `queued_payments`
--
ALTER TABLE `queued_payments`
  ADD PRIMARY KEY (`queued_payment_id`);

--
-- 資料表索引 `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `registration_sched_conf_id` (`sched_conf_id`,`user_id`),
  ADD KEY `registration_domain` (`domain`);

--
-- 資料表索引 `registration_options`
--
ALTER TABLE `registration_options`
  ADD PRIMARY KEY (`option_id`);

--
-- 資料表索引 `registration_option_assoc`
--
ALTER TABLE `registration_option_assoc`
  ADD UNIQUE KEY `registration_option_assoc_pkey` (`option_id`,`registration_id`);

--
-- 資料表索引 `registration_option_costs`
--
ALTER TABLE `registration_option_costs`
  ADD UNIQUE KEY `registration_option_costs_pkey` (`type_id`,`option_id`);

--
-- 資料表索引 `registration_option_settings`
--
ALTER TABLE `registration_option_settings`
  ADD UNIQUE KEY `registration_option_settings_pkey` (`option_id`,`locale`,`setting_name`),
  ADD KEY `registration_option_settings_type_id` (`option_id`);

--
-- 資料表索引 `registration_types`
--
ALTER TABLE `registration_types`
  ADD PRIMARY KEY (`type_id`);

--
-- 資料表索引 `registration_type_settings`
--
ALTER TABLE `registration_type_settings`
  ADD UNIQUE KEY `registration_type_settings_pkey` (`type_id`,`locale`,`setting_name`),
  ADD KEY `registration_type_settings_type_id` (`type_id`);

--
-- 資料表索引 `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `review_assignments_paper_id` (`paper_id`),
  ADD KEY `review_assignments_reviewer_id` (`reviewer_id`),
  ADD KEY `review_assignments_form_id` (`review_form_id`);

--
-- 資料表索引 `review_forms`
--
ALTER TABLE `review_forms`
  ADD PRIMARY KEY (`review_form_id`);

--
-- 資料表索引 `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD PRIMARY KEY (`review_form_element_id`),
  ADD KEY `review_form_elements_review_form_id` (`review_form_id`);

--
-- 資料表索引 `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`),
  ADD KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`);

--
-- 資料表索引 `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`);

--
-- 資料表索引 `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`),
  ADD KEY `review_form_settings_review_form_id` (`review_form_id`);

--
-- 資料表索引 `review_stages`
--
ALTER TABLE `review_stages`
  ADD UNIQUE KEY `review_stages_pkey` (`paper_id`,`stage`),
  ADD KEY `review_stages_paper_id` (`paper_id`);

--
-- 資料表索引 `roles`
--
ALTER TABLE `roles`
  ADD UNIQUE KEY `roles_pkey` (`conference_id`,`sched_conf_id`,`user_id`,`role_id`),
  ADD KEY `roles_conference_id` (`conference_id`),
  ADD KEY `roles_sched_conf_id` (`sched_conf_id`),
  ADD KEY `roles_user_id` (`user_id`),
  ADD KEY `roles_role_id` (`role_id`);

--
-- 資料表索引 `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD KEY `room_building_id` (`building_id`);

--
-- 資料表索引 `room_settings`
--
ALTER TABLE `room_settings`
  ADD UNIQUE KEY `room_settings_pkey` (`room_id`,`locale`,`setting_name`),
  ADD KEY `room_settings_room_id` (`room_id`);

--
-- 資料表索引 `rt_contexts`
--
ALTER TABLE `rt_contexts`
  ADD PRIMARY KEY (`context_id`),
  ADD KEY `rt_contexts_version_id` (`version_id`);

--
-- 資料表索引 `rt_searches`
--
ALTER TABLE `rt_searches`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `rt_searches_context_id` (`context_id`);

--
-- 資料表索引 `rt_versions`
--
ALTER TABLE `rt_versions`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `rt_versions_conference_id` (`conference_id`),
  ADD KEY `rt_versions_version_key` (`version_key`);

--
-- 資料表索引 `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  ADD UNIQUE KEY `scheduled_tasks_pkey` (`class_name`);

--
-- 資料表索引 `sched_confs`
--
ALTER TABLE `sched_confs`
  ADD PRIMARY KEY (`sched_conf_id`),
  ADD KEY `sched_conf_path` (`path`),
  ADD KEY `sched_conf_conference_id` (`conference_id`),
  ADD KEY `sched_confs_start_end_date` (`start_date`,`end_date`);

--
-- 資料表索引 `sched_conf_settings`
--
ALTER TABLE `sched_conf_settings`
  ADD UNIQUE KEY `sched_conf_settings_pkey` (`sched_conf_id`,`locale`,`setting_name`),
  ADD KEY `sched_conf_settings_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_pkey` (`session_id`),
  ADD KEY `sessions_user_id` (`user_id`);

--
-- 資料表索引 `site_settings`
--
ALTER TABLE `site_settings`
  ADD UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`);

--
-- 資料表索引 `special_events`
--
ALTER TABLE `special_events`
  ADD PRIMARY KEY (`special_event_id`),
  ADD KEY `special_event_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `special_event_settings`
--
ALTER TABLE `special_event_settings`
  ADD UNIQUE KEY `special_event_settings_pkey` (`special_event_id`,`locale`,`setting_name`),
  ADD KEY `special_event_settings_special_event_id` (`special_event_id`);

--
-- 資料表索引 `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`static_page_id`);

--
-- 資料表索引 `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`),
  ADD KEY `static_page_settings_static_page_id` (`static_page_id`);

--
-- 資料表索引 `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `temporary_files_user_id` (`user_id`);

--
-- 資料表索引 `time_blocks`
--
ALTER TABLE `time_blocks`
  ADD PRIMARY KEY (`time_block_id`),
  ADD UNIQUE KEY `time_block_unique` (`sched_conf_id`,`start_time`,`end_time`);

--
-- 資料表索引 `time_block_settings`
--
ALTER TABLE `time_block_settings`
  ADD UNIQUE KEY `time_block_settings_pkey` (`time_block_id`,`locale`,`setting_name`),
  ADD KEY `time_block_settings_time_block_id` (`time_block_id`);

--
-- 資料表索引 `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`track_id`),
  ADD KEY `tracks_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `track_directors`
--
ALTER TABLE `track_directors`
  ADD UNIQUE KEY `track_directors_pkey` (`sched_conf_id`,`track_id`,`user_id`),
  ADD KEY `track_directors_sched_conf_id` (`sched_conf_id`),
  ADD KEY `track_directors_track_id` (`track_id`),
  ADD KEY `track_directors_user_id` (`user_id`);

--
-- 資料表索引 `track_settings`
--
ALTER TABLE `track_settings`
  ADD UNIQUE KEY `track_settings_pkey` (`track_id`,`locale`,`setting_name`),
  ADD KEY `track_settings_track_id` (`track_id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `users_username` (`username`),
  ADD UNIQUE KEY `users_email` (`email`);

--
-- 資料表索引 `user_settings`
--
ALTER TABLE `user_settings`
  ADD UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`),
  ADD KEY `user_settings_user_id` (`user_id`);

--
-- 在匯出的資料表使用 AUTO_INCREMENT
--

--
-- 使用資料表 AUTO_INCREMENT `access_keys`
--
ALTER TABLE `access_keys`
  MODIFY `access_key_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `announcements`
--
ALTER TABLE `announcements`
  MODIFY `announcement_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `announcement_types`
--
ALTER TABLE `announcement_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `auth_sources`
--
ALTER TABLE `auth_sources`
  MODIFY `auth_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `buildings`
--
ALTER TABLE `buildings`
  MODIFY `building_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `captchas`
--
ALTER TABLE `captchas`
  MODIFY `captcha_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `conferences`
--
ALTER TABLE `conferences`
  MODIFY `conference_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `conference_event_log`
--
ALTER TABLE `conference_event_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  MODIFY `controlled_vocab_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  MODIFY `controlled_vocab_entry_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `edit_assignments`
--
ALTER TABLE `edit_assignments`
  MODIFY `edit_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `edit_decisions`
--
ALTER TABLE `edit_decisions`
  MODIFY `edit_decision_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `email_templates`
--
ALTER TABLE `email_templates`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `email_templates_default`
--
ALTER TABLE `email_templates_default`
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `groups`
--
ALTER TABLE `groups`
  MODIFY `group_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `notification_settings`
--
ALTER TABLE `notification_settings`
  MODIFY `setting_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `papers`
--
ALTER TABLE `papers`
  MODIFY `paper_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_authors`
--
ALTER TABLE `paper_authors`
  MODIFY `author_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_comments`
--
ALTER TABLE `paper_comments`
  MODIFY `comment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_email_log`
--
ALTER TABLE `paper_email_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_event_log`
--
ALTER TABLE `paper_event_log`
  MODIFY `log_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_files`
--
ALTER TABLE `paper_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_galleys`
--
ALTER TABLE `paper_galleys`
  MODIFY `galley_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_notes`
--
ALTER TABLE `paper_notes`
  MODIFY `note_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_search_keyword_list`
--
ALTER TABLE `paper_search_keyword_list`
  MODIFY `keyword_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_search_objects`
--
ALTER TABLE `paper_search_objects`
  MODIFY `object_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `paper_supplementary_files`
--
ALTER TABLE `paper_supplementary_files`
  MODIFY `supp_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `published_papers`
--
ALTER TABLE `published_papers`
  MODIFY `pub_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `queued_payments`
--
ALTER TABLE `queued_payments`
  MODIFY `queued_payment_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `registrations`
--
ALTER TABLE `registrations`
  MODIFY `registration_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `registration_options`
--
ALTER TABLE `registration_options`
  MODIFY `option_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `registration_types`
--
ALTER TABLE `registration_types`
  MODIFY `type_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `review_assignments`
--
ALTER TABLE `review_assignments`
  MODIFY `review_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `review_forms`
--
ALTER TABLE `review_forms`
  MODIFY `review_form_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `review_form_elements`
--
ALTER TABLE `review_form_elements`
  MODIFY `review_form_element_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `rt_contexts`
--
ALTER TABLE `rt_contexts`
  MODIFY `context_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `rt_searches`
--
ALTER TABLE `rt_searches`
  MODIFY `search_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `rt_versions`
--
ALTER TABLE `rt_versions`
  MODIFY `version_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `sched_confs`
--
ALTER TABLE `sched_confs`
  MODIFY `sched_conf_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `special_events`
--
ALTER TABLE `special_events`
  MODIFY `special_event_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `static_page_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `temporary_files`
--
ALTER TABLE `temporary_files`
  MODIFY `file_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `time_blocks`
--
ALTER TABLE `time_blocks`
  MODIFY `time_block_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `tracks`
--
ALTER TABLE `tracks`
  MODIFY `track_id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- 使用資料表 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
