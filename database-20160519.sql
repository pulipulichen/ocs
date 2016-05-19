-- phpMyAdmin SQL Dump
-- version 4.3.11
-- http://www.phpmyadmin.net
--
-- 主機: 127.0.0.1
-- 產生時間： 2016 年 05 月 19 日 16:49
-- 伺服器版本: 5.5.27
-- PHP 版本： 5.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `announcement_types`
--

CREATE TABLE IF NOT EXISTS `announcement_types` (
  `type_id` bigint(20) NOT NULL,
  `assoc_type` smallint(6) NOT NULL,
  `assoc_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `buildings`
--

CREATE TABLE IF NOT EXISTS `buildings` (
  `building_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `captchas`
--

CREATE TABLE IF NOT EXISTS `captchas` (
  `captcha_id` bigint(20) NOT NULL,
  `session_id` varchar(40) NOT NULL,
  `value` varchar(20) NOT NULL,
  `date_created` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `conferences`
--

INSERT INTO `conferences` (`conference_id`, `path`, `seq`, `primary_locale`, `enabled`) VALUES
(1, 'iccisc', 1, 'zh_TW', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `conference_settings`
--

INSERT INTO `conference_settings` (`conference_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'itemsPerPage', '25', 'int'),
(1, '', 'numPageLinks', '10', 'int'),
(1, '', 'paymentMethodPluginName', 'ManualPayment', 'string'),
(1, '', 'rtAbstract', '1', 'bool'),
(1, '', 'rtAddComment', '1', 'bool'),
(1, '', 'rtAuthorBio', '1', 'bool'),
(1, '', 'rtCaptureCite', '1', 'bool'),
(1, '', 'rtDefineTerms', '1', 'bool'),
(1, '', 'rtEmailAuthor', '1', 'bool'),
(1, '', 'rtEmailOthers', '1', 'bool'),
(1, '', 'rtPrinterFriendly', '1', 'bool'),
(1, '', 'rtSupplementaryFiles', '1', 'bool'),
(1, '', 'rtViewMetadata', '1', 'bool'),
(1, '', 'supportedLocales', 'a:1:{i:0;s:5:"zh_TW";}', 'object'),
(1, 'zh_TW', 'archiveAccessPolicy', '##default.conferenceSettings.archiveAccessPolicy##', 'string'),
(1, 'zh_TW', 'authorInformation', '如果您有興趣投稿本研討會，請造訪 <a href="http://localhost/ocs/index.php/iccisc/index/about">關於研討會</a> 網頁了解相燈的策略與訊息，並訪問 <a href="http://localhost/ocs/index.php/iccisc/index">研討會首頁</a> 查看即將舉辦的研討會訊息。', 'string'),
(1, 'zh_TW', 'authorSelfArchivePolicy', '作者可以將自己的論文檔案放在自己或者所屬機構的網站上 (但需清楚標示該論文的出版資訊)。', 'string'),
(1, 'zh_TW', 'copyrightNotice', '作者在投稿前需先同意以下版權條款:<br/>\n<strong>a)</strong>&nbsp;當作者允許研討會安排尚未出版的作品在 <a href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution License</a>之下時，作者在執行工作時須保留版權，並允許研討會其他參加人員自由存取、使用、及分享其著作及介紹。<br/>\n<strong>b)</strong>&nbsp;作者能放棄CC執照並將其分開，並以最初在此研討會內的發表感言，另外?這尚未公開分配及之後的出版物來擬訂契約協議安排 (如：在期刊內出版一篇已修正的論文，將其張貼在學會的資料庫內或出版在ㄧ本書內)。<br/>\n<strong>c)</strong>&nbsp;除此之外，鼓勵作者在研討會前或後任何一時間點，在網路上張貼及分享他們的作品，(如：在學會的資料庫或他們的網站內)。', 'string'),
(1, 'zh_TW', 'description', '<p>人口老化是一種複雜與多面向的論題，也是一種社會趨勢變遷，高齡化社會所帶來的問題不僅是我國當前所面臨的重要問題之一，同時也是德國、法國等高齡化國家所面臨的問題，此現象提供我們重視並尋求活躍老化的新方式，增加生命量和質的改善。</p><p>Prof.Dr. Kessle是法國社會法與勞動法教授，對於高齡者健康和就業促進等議題有獨特見解；Dumeier先生則是德國高齡者健康照顧實務專家；李玉春次長則為國內公共衛生政策專家，對健康照護體系有深入的研究（或陳素春副署長為國內老人福利實務專家）；宋玫玫助理教授帶領國內外未來觀點工作坊多年，特從活躍老化和未來學的觀點引領我們思考規劃未來的老年生活。本研討會希望透過受邀來賓的演講、實務分享和工作坊，增加與會者對德國、法國和我國高齡者活躍老化相關制度與措施的認識。</p>', 'string'),
(1, 'zh_TW', 'lockssLicense', '本研討會使用 LOCKSS 系統由參與的圖書館建立分散式典藏系統，同時充許這些圖書館在維護與典藏的目的下建立永久性的典藏檔案庫。<a href="http://lockss.stanford.edu/">更多...</a>', 'string'),
(1, 'zh_TW', 'privacyStatement', '您在本網站所輸入的個人資料僅使用於本研討會的各項活動中，不會使用在其他非本研討會相關的活動中。', 'string'),
(1, 'zh_TW', 'readerInformation', '我們鼓勵讀者們登錄本站以收到有關本研討會論文的通知。同時建議您訪問 <a href="http://localhost/ocs/index.php/iccisc/index/about">關於研討會</a> 的網頁了解相關的策略，以及訪問 <a href="http://localhost/ocs/index.php/iccisc/index">研討會首頁</a> 查看即將舉辦的研討會訊息。', 'string'),
(1, 'zh_TW', 'title', '「2016社會變遷與當代議題-活躍老化」國際學術研討會', 'string');

-- --------------------------------------------------------

--
-- 資料表結構 `controlled_vocabs`
--

CREATE TABLE IF NOT EXISTS `controlled_vocabs` (
  `controlled_vocab_id` bigint(20) NOT NULL,
  `symbolic` varchar(32) NOT NULL,
  `assoc_type` bigint(20) NOT NULL DEFAULT '0',
  `assoc_id` bigint(20) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `controlled_vocab_entries`
--

CREATE TABLE IF NOT EXISTS `controlled_vocab_entries` (
  `controlled_vocab_entry_id` bigint(20) NOT NULL,
  `controlled_vocab_id` bigint(20) NOT NULL,
  `seq` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `custom_track_orders`
--

CREATE TABLE IF NOT EXISTS `custom_track_orders` (
  `sched_conf_id` bigint(20) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `seq` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `email_templates_default`
--

INSERT INTO `email_templates_default` (`email_id`, `email_key`, `can_disable`, `can_edit`, `from_role_id`, `to_role_id`) VALUES
(1, 'NOTIFICATION', 0, 1, NULL, NULL),
(2, 'NOTIFICATION_MAILLIST', 0, 1, NULL, NULL),
(3, 'NOTIFICATION_MAILLIST_WELCOME', 0, 1, NULL, NULL),
(4, 'NOTIFICATION_MAILLIST_PASSWORD', 0, 1, NULL, NULL),
(5, 'PASSWORD_RESET_CONFIRM', 0, 1, NULL, NULL),
(6, 'PASSWORD_RESET', 0, 1, NULL, NULL),
(7, 'USER_REGISTER', 0, 1, NULL, NULL),
(8, 'USER_VALIDATE', 0, 1, NULL, NULL),
(9, 'SUBMISSION_ACK', 1, 1, NULL, 4096),
(10, 'SUBMISSION_UPLOAD_ACK', 1, 1, NULL, 4096),
(11, 'SUBMISSION_UNSUITABLE', 1, 1, 128, 4096),
(12, 'SUBMISSION_COMMENT', 0, 1, NULL, NULL),
(13, 'SUBMISSION_DECISION_REVIEWERS', 0, 1, 128, 256),
(14, 'DIRECTOR_ASSIGN', 1, 1, 64, 128),
(15, 'REVIEW_CANCEL', 1, 1, 128, 256),
(16, 'REVIEW_REQUEST', 1, 1, 128, 256),
(17, 'REVIEW_REQUEST_ONECLICK', 1, 1, 128, 256),
(18, 'REVIEW_CONFIRM', 1, 1, 256, 128),
(19, 'REVIEW_CONFIRM_ACK', 1, 1, 128, 256),
(20, 'REVIEW_DECLINE', 1, 1, 256, 128),
(21, 'REVIEW_COMPLETE', 1, 1, 256, 128),
(22, 'REVIEW_ACK', 1, 1, 128, 256),
(23, 'REVIEW_REMIND', 0, 1, 128, 256),
(24, 'REVIEW_REMIND_AUTO', 0, 1, NULL, 256),
(25, 'REVIEW_REMIND_ONECLICK', 0, 1, 128, 256),
(26, 'REVIEW_REMIND_AUTO_ONECLICK', 0, 1, NULL, 256),
(27, 'SUBMISSION_ABSTRACT_ACCEPT', 0, 1, 128, 4096),
(28, 'SUBMISSION_ABSTRACT_DECLINE', 0, 1, 128, 4096),
(29, 'SUBMISSION_ABSTRACT_REVISE', 0, 1, 128, 4096),
(30, 'SUBMISSION_PAPER_ACCEPT', 0, 1, 128, 4096),
(31, 'SUBMISSION_PAPER_DECLINE', 0, 1, 128, 4096),
(32, 'SUBMISSION_PAPER_REVISE', 0, 1, 128, 4096),
(33, 'SUBMISSION_PAPER_INVITE', 0, 1, 128, 4096),
(34, 'REGISTRATION_NOTIFY', 0, 1, NULL, 32768),
(35, 'MANUAL_PAYMENT_RECEIVED', 0, 1, NULL, NULL),
(36, 'MANUAL_PAYMENT_NOTIFICATION', 0, 1, NULL, NULL),
(37, 'PAYPAL_INVESTIGATE_PAYMENT', 0, 1, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `email_templates_default_data`
--

INSERT INTO `email_templates_default_data` (`email_key`, `locale`, `subject`, `body`, `description`) VALUES
('DIRECTOR_ASSIGN', 'zh_TW', '主編任務', '{$editorialContactName}:\n\n投稿至 {$conferenceName} 的稿件 "{$paperTitle}" 將會分配給您來查看編輯過程，如同您擔任主題主編 (Track Director) 的角色。\n\n投稿網站: {$submissionUrl}\n使用者名稱: {$directorUsername}\n\n感謝您\n\n{$editorialContactSignature}', '這電子郵件是通知主題主編，主編分配了他們在編輯過程中監督投稿作業。它也提供關於投稿的資訊和如何進入研討會站點。'),
('OPEN_ACCESS_NOTIFY', 'zh_TW', '公佈現在開放進入', 'Readers:\n\n{$conferenceName}以依照下列問題在ㄧ個開放進入的格式內被製作利用。我們邀請您來查看表格內的內容並且參觀我們的網站({$conferenceUrl})來查閱論文及有趣的項目。\n\n感謝您對我們的作業持續感到有興趣，\n{$editorialContactSignature}', '此封電子郵件是寄給已註冊的讀者有關當問題變成開放通入時他們會被要求去接收一封電子通知信件。'),
('PASSWORD_RESET', 'zh_TW', '密碼重新設定', '您在 {$siteTitle} 網站的密碼已成功地被重新設定了。請保留這個使用者名稱和密碼，這組帳號與密碼是用來執行研討會的所有作業。\n\n您的使用者名稱: {$username}\n您的新密碼: {$password}\n\n{$principalContactSignature}', '當使用者成功地重新設定了他們的密碼時，所有的過程會被描述在密碼_ 被重新設定_ 確認電子郵件信件內，電子信件也會送到使用者的電子信箱內。'),
('PASSWORD_RESET_CONFIRM', 'zh_TW', '密碼重新設定確認', '我們收到了一個請求為網站重新設定您的密碼{$siteTitle} 。\n\n如果您沒有提出這個請求，請忽略此電子郵件，且您的密碼不會被改變。如果您希望重新設定您的密碼，請點選下面網址。\n\n重新設定我的密碼: {$url}\n\n{$principalContactSignature}', '當使用者表明忘記了他們的密碼或無法登錄時，此電子郵件會被寄送給使用者。它提供了ㄧ個網址讓使用者可以跟隨著步驟來重新設定密碼。'),
('REGISTRATION_NOTIFY', 'zh_TW', '註冊通知信函', '{$registrantName}:\n\n您已在我們的網上研討會管理系統{$conferenceName}內登記註冊，以下註冊為：\n \n\n{$registrationType}\n\n只有註冊者可以進入網站查看內容，簡單的使用您的使用者名稱登入，"{$username}"。\n\n每ㄧ次您登入此系統，您可以在任何時刻來變更您的簡介描述及密碼。\n\n請注意若您有學會的註冊紀錄，您不需要在學會內登入因為您的註冊內容此系統會自動幫您確認。\n\n如果您有任何問題，請隨時與我聯繫。\n\n{$registrationContactSignature}', '此電子郵件是通知已註冊的讀者管理員已位他們建立註冊登記。此封信件也提共有關研討會網站及進入網站的指示。'),
('REVIEW_ACK', 'zh_TW', '論文審查確認通知', '{$reviewerName}:\n\n感謝您完成論文審查作業。我們非常感謝您對於提昇我們的工作品質有所貢獻。\n{$conferenceName}\n{$paperTitle}\n\n\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄出有關完成審查的確認收據及感謝審查者的貢獻。'),
('REVIEW_CANCEL', 'zh_TW', '要求取消審查', '{$reviewerName}:\n\n我們決定在此時取消對您提出爲 {$conferenceName} 審查稿件 "{$paperTitle}" 的要求， 。造成您的不便深感抱歉，並希望未來您還能協助研討會的審查過程。\n\n倘若您有其他任何的的問題，請聯絡我。\n\n{$editorialContactSignature}', '這封信件是由研討會主編寄發通知給取消審查過程的審查者。'),
('REVIEW_COMPLETE', 'zh_TW', '論文審查已完成', '{$editorialContactName}:\n\n我已完成爲 {$conferenceName} 審查的 "{$paperTitle}" 稿件，並且已傳送我的建議：\n"{$recommendation}"\n\n{$reviewerName}', '此封電子郵件由審查者寄出給Track Director通知他們的審查作業已完成，並且評論及建議已被記錄在研討會網站內。'),
('REVIEW_CONFIRM', 'zh_TW', '接受番稿任務', '{$editorialContactName}:\n\n我能夠且很願意爲 {$conferenceName} 審查論文 "{$paperTitle}"。謝謝您的認同，我計劃在 {$reviewDueDate} 之前，或更早來完成審查作業。\n\n{$reviewerName}', '這封信件是由審查者寄給Track Director來對Track Director通知有關審查要求回應，表示接受審查請求並且將在指定日期之前完成。'),
('REVIEW_CONFIRM_ACK', 'zh_TW', '審查進行中的確認通知', '{$reviewerName}:\n\n感謝您同意爲 {$conferenceName} 審查投稿稿件 "{$paperTitle}" ，審查期限為 {$reviewDueDate}。\n\n{$editorialContactSignature}', '這封電子郵件是從Track Director寄給審查者感謝他們接受審查或鼓勵他們完成審查。'),
('REVIEW_DECLINE', 'zh_TW', '無法審查', '{$editorialContactName}:\n\n我很抱歉在這個時間點無法爲 {$conferenceName} 審查稿件 "{$paperTitle}" 。感謝您的認同，及希望往後隨時都能聯絡我。\n\n{$reviewerName}', '此封電子郵件由審查者寄出給Track Director來對審查要求做回應，告知Track Director審查要求被婉拒。'),
('REVIEW_REMIND', 'zh_TW', '稿件審查提醒', '{$reviewerName}:\n\n只是一個溫和的提醒我們對稿件審查者要求，您爲 {$conferenceName} 審查的文章為 "{$paperTitle}" 。我們期望這個審查在 {$reviewDueDate} 之前完成。\n\n倘若您尚未有此研討會網站的使用者名稱及密碼，您可使用此連結來重新設定您的密碼 (設定完後使用者名稱及密碼將會以電子郵件寄出給您)。{$passwordResetUrl}\n\n投稿網站: {$submissionReviewUrl}\n\n請確認您有能力完成對此研討會的重要貢獻。盼望收到您的來信。\n\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄出來提醒審查者他們的審查到期。'),
('REVIEW_REMIND_AUTO', 'zh_TW', '自動稿件審查提醒', '{$reviewerName}:\n\n是一個溫和提醒我們對稿件審查者要求，您爲 {$conferenceName} 審查的文章為 "{$paperTitle}" 。我們希望這個審查在 {$reviewDueDate} 之前完成，此電子郵件會自動產生並在會在截止日期後寄出。我們仍希望您能願意接受並盡快地準備好。\n\n倘若您尚未有此研討會網站的使用者名稱及密碼，您可使用此連結來重新設定您的密碼 (設定完後使用者名稱及密碼將會以電子郵件寄出給您)。{$passwordResetUrl}\n\n投稿網站: {$submissionReviewUrl}\n\n請確認您有能力完成對此研討會的重要貢獻。盼望收到您的來信。\n\n{$editorialContactSignature}', '當審查日期已過時，此封電子郵件將會自動寄出 (請參見研討會設定下的審查選擇，步驟2)並且審查者點選進入功能將會是無效的。已預定的任務必許已被啟動及安裝 (請詳見網站配置文件)。'),
('REVIEW_REMIND_AUTO_ONECLICK', 'zh_TW', '自動稿件審查提醒', '{$reviewerName}:\n\n是一個溫和提醒我們對稿件審查者要求，您爲 {$conferenceName} 審查的文章為 "{$paperTitle}" 。我們希望這個審查在 {$reviewDueDate} 之前完成，此電子郵件會自動產生並在會在截止日期後寄出。我們仍希望您能願意接受並盡快地準備好。\n\n倘若您尚未有此研討會網站的使用者名稱及密碼，您可使用此連結來重新設定您的密碼 (設定完後使用者名稱及密碼將會以電子郵件寄出給您)。{$passwordResetUrl}\n\n投稿網站: {$submissionReviewUrl}\n\n請確認您有能力完成對此研討會的重要貢獻。盼望收到您的來信。\n\n{$editorialContactSignature}', '當審查日期已過時，此封電子郵件將會自動寄出 (請參見研討會設定下的審查選擇，步驟2)並且審查者點選進入功能將會是無效的。已預定的任務必許已被啟動及安裝 (請詳見網站配置文件)。'),
('REVIEW_REMIND_ONECLICK', 'zh_TW', '稿件審查提醒', '{$reviewerName}:\n\n只是一個溫和的提醒我們對稿件審查者要求，您爲 {$conferenceName} 審查的文章為 "{$paperTitle}" 。我們期望這個審查在 {$reviewDueDate} 之前完成。\n\n倘若您尚未有此研討會網站的使用者名稱及密碼，您可使用此連結來重新設定您的密碼 (設定完後使用者名稱及密碼將會以電子郵件寄出給您)。{$passwordResetUrl}\n\n投稿網站: {$submissionReviewUrl}\n\n請確認您有能力完成對此研討會的重要貢獻。盼望收到您的來信。\n\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄出來提醒審查者他們的審查到期。'),
('REVIEW_REQUEST', 'zh_TW', '論文審查請求', '{$reviewerName}:\n\n本研討會認為您是一個優秀的論文審查者，可否請您協助審查  {$conferenceName} 的論文 "{$paperTitle}" 。\n\n\n請您於 {$weekLaterDate} 前登入研討會網站，表示您是否願意從事審查工作，並且進入投稿和記錄您的評論和建議。研討會的網址是 {$conferenceUrl}\n\n審查截止日期 {$reviewDueDate}.\n\n倘若您尚未有研討會的使用名稱及密碼， 您可以使用以下連結來重新設定您的密碼 (密碼將會與您的使用者名稱一起以電子郵件寄發給您)。 {$passwordResetUrl}\n\n審稿網址: {$submissionReviewUrl}\n\n感謝您關心這項請求。\n\n{$editorialContactSignature}\n\n\n\n"{$paperTitle}"\n\n摘要\n{$paperAbstract}', '從Track Director寄給審查者的電子郵件詢問審查者接受或拒絕審查稿件的任務。這提供有關投稿的資訊，如題目、摘要、審查截止日期、及如何存取投稿等等。'),
('REVIEW_REQUEST_ONECLICK', 'zh_TW', '論文審查請求', '{$reviewerName}:\n\n本研討會認為您是一個優秀的論文審查者，可否請您協助審查  {$conferenceName} 的論文 "{$paperTitle}" 。\n\n\n請您於 {$weekLaterDate} 前登入研討會網站，表示您是否願意從事審查工作，並且進入投稿和記錄您的評論和建議。研討會的網址是 {$conferenceUrl}\n\n審查截止日期 {$reviewDueDate}.\n\n倘若您尚未有研討會的使用名稱及密碼， 您可以使用以下連結來重新設定您的密碼 (密碼將會與您的使用者名稱一起以電子郵件寄發給您)。 {$passwordResetUrl}\n\n審稿網址: {$submissionReviewUrl}\n\n感謝您關心這項請求。\n\n{$editorialContactSignature}\n\n\n\n"{$paperTitle}"\n\n摘要\n{$paperAbstract}', '這封由研討會主編寄給審查者的電子郵件內容是要求審查者接受或婉拒審查論文的任務。他提供有關論文的資訊，如題目和摘要、審查截止日期、及如何進入審查。當標準的審查過程已被定案在研討會的設定，步驟2，及點選進入功能能被使用時，這個訊息則可開始使用。'),
('SUBMISSION_ABSTRACT_ACCEPT', 'zh_TW', '關於編輯論文決定', '{$authorName}:\n\n恭喜您，您的稿件{$paperTitle}已被接受並會在{$conferenceTitle}發表，研討會將會在{$conferenceDate}地點{$locationCity}舉行。 \n\n謝謝您和期盼您的參與。\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄給發表者，通知他們對於稿件已做出了決定。'),
('SUBMISSION_ABSTRACT_DECLINE', 'zh_TW', '關於編輯論文決定', '{$authorName}:\n\n我們已完成審查您的稿件"{$paperTitle}." 結果為...\n\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄給發表者，通知他們對於稿件已做出了決定。'),
('SUBMISSION_ABSTRACT_REVISE', 'zh_TW', '關於編輯論文決定', '{$authorName}:\n\n在我們小心仔細的審查您的稿件之後，"{$paperTitle}"，倘若以下的修正成功地被執行，將考慮將您的論文在{$conferenceTitle}發表。\n\n謝謝您和期盼您的參與。\n\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄給發表者，通知他們對於稿件已做出了決定。'),
('SUBMISSION_ACK', 'zh_TW', '投稿感謝函', '{$authorName}:\n\n感謝您投稿 "{$paperTitle}" 至 {$conferenceName}。我們所使用的線上研討會管理系統，在登入後您能夠透過編輯審查來追蹤作業進展以及通過審查的過程。請由下列網址登錄到會議網站:\n\n投稿網站: {$submissionUrl}\n使用者名稱: {$authorUsername}\n\n倘若您有任何的疑問，請聯絡我們。謝謝您將此研討會視為您的工作之一。\n\n{$editorialContactSignature}', '當發表者已完成繳交全文或摘要給研討會的過程，此電子郵件會自動地寄送給發表者。它提供關於投稿過程的資訊和感謝發表者投稿。'),
('SUBMISSION_COMMENT', 'zh_TW', '稿件評論', '{$name}:\n\n{$commentName} 有增加一個評論至 {$conferenceName} 的稿件 "{$paperTitle}" :\n\n{$comments}', '這封電子郵件通知所有人有關一個新評論被張貼在投稿編輯的過程。'),
('SUBMISSION_DECISION_REVIEWERS', 'zh_TW', '審查結果：{$paperTitle}', '感謝您協助審查 {$conferenceName},  的稿件：{$paperTitle}。\n該稿件已經完成審查，並寄發給發表者有關論文的評論和編輯決定。再次感謝您在這整個過程所付出的重要貢獻。\n\n \n{$editorialContactSignature}\n\n{$comments}', '這封電子郵件是通知稿件的審查者其審查過程已完成。這包括關於論文資訊及已作出的決定，及感謝審查者所付出的貢獻。'),
('SUBMISSION_PAPER_ACCEPT', 'zh_TW', '關於編輯論文決定', '{$authorName}:\n\n恭喜您，您的論文{$paperTitle}已被接受並會在{$conferenceTitle}發表，研討會將會在{$conferenceDate}地點{$locationCity}舉行。\n\n謝謝您和期盼您的參與。\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄給發表者，通知他們對於稿件已做出了決定。'),
('SUBMISSION_PAPER_DECLINE', 'zh_TW', '關於編輯論文決定', '{$authorName}:\n\n我們已完成審查您的稿件"{$paperTitle}." 結果為...\n\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄給發表者，通知他們對於稿件已做出了決定。'),
('SUBMISSION_PAPER_REVISE', 'zh_TW', '關於編輯論文決定', '{$authorName}:\n\n在我們小心仔細的審查您的稿件之後，"{$paperTitle}"，倘若以下的修正成功地被執行，將考慮將您的論文在{$conferenceTitle}發表。\n\n謝謝您和期盼您的參與。\n\n\n{$editorialContactSignature}', '此封電子郵件是由Track Director寄給發表者，通知他們對於稿件已做出了決定。'),
('SUBMISSION_UNSUITABLE', 'zh_TW', '不適當的投稿', '{$authorName}:\n\n您的文章 "{$paperTitle}" 經過初審發現其不符合 {$conferenceName} 的範圍和焦點。建議您查詢關於研討會的內容，及任何已預定的研討會來學習更多關於我們可以接受的作業。抑或您可以投稿您的論文或摘要至其他或更適當的研討會。\n\n{$editorialContactSignature}', ''),
('SUBMISSION_UPLOAD_ACK', 'zh_TW', '稿件上傳感謝函', '{$authorName}:\n\n感謝您上傳您的發表文章 "{$paperTitle}" 至 {$conferenceName}。我們所使用的線上研討會管理系統，在登入後您能夠透過編輯審查來追蹤作業進展以及通過審查的過程。請由下列網址登錄到會議網站:\n\n投稿網站: {$submissionUrl}\n使用者名稱: {$authorUsername}\n\n倘若您有任何的疑問，請聯絡我們。謝謝您將此研討會視為您的工作之一。\n\n{$editorialContactSignature}', '當發表者已完成繳交全文或摘要給研討會的過程，此電子郵件會自動地寄送給發表者。它提供關於投稿過程的資訊和感謝發表者投稿。'),
('USER_REGISTER', 'zh_TW', '新使用者註冊', '感謝您在 {$conferenceName} 註冊。請記錄您的使用者名稱和密碼，因所有和研討會有關的作業都需要使用此帳號名稱和密碼。\n\n使用者名稱: {$username}\n密碼: {$password}\n\n謝謝您,\n{$principalContactSignature}', '此電子郵件寄送給新的使用者包含歡迎他們加入及提供他們的使用者名稱和密碼紀錄。'),
('USER_VALIDATE', 'zh_TW', '確認您的帳號', '{$userFullName}\n\n您已經在 {$conferenceName} 申請帳號，在您正式使用本帳號前，需要點選下列連結進行電子郵件認證，以啟動您的帳號。請點選下列連結完成認證並啟動帳號：\n\n{$activateUrl}\n\n感謝您\n敬祝 大安\n{$principalContactSignature}', '本郵件是寄給新申請帳號者作為電子郵件認證與帳號啟動的通知。');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `group_memberships`
--

CREATE TABLE IF NOT EXISTS `group_memberships` (
  `user_id` bigint(20) NOT NULL,
  `group_id` bigint(20) NOT NULL,
  `about_displayed` tinyint(4) NOT NULL DEFAULT '1',
  `seq` double NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `oai_resumption_tokens`
--

CREATE TABLE IF NOT EXISTS `oai_resumption_tokens` (
  `token` varchar(32) NOT NULL,
  `expire` bigint(20) NOT NULL,
  `record_offset` int(11) NOT NULL,
  `params` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `comments_status` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_html_galley_images`
--

CREATE TABLE IF NOT EXISTS `paper_html_galley_images` (
  `galley_id` bigint(20) NOT NULL,
  `file_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_search_keyword_list`
--

CREATE TABLE IF NOT EXISTS `paper_search_keyword_list` (
  `keyword_id` bigint(20) NOT NULL,
  `keyword_text` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_search_objects`
--

CREATE TABLE IF NOT EXISTS `paper_search_objects` (
  `object_id` bigint(20) NOT NULL,
  `paper_id` bigint(20) NOT NULL,
  `type` int(11) NOT NULL,
  `assoc_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `paper_search_object_keywords`
--

CREATE TABLE IF NOT EXISTS `paper_search_object_keywords` (
  `object_id` bigint(20) NOT NULL,
  `keyword_id` bigint(20) NOT NULL,
  `pos` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `plugin_settings`
--

INSERT INTO `plugin_settings` (`plugin_name`, `locale`, `conference_id`, `sched_conf_id`, `setting_name`, `setting_value`, `setting_type`) VALUES
('AcronPlugin', '', 0, 0, 'crontab', 'a:2:{i:0;a:3:{s:9:"className";s:20:"tasks.ReviewReminder";s:9:"frequency";a:1:{s:4:"hour";s:1:"0";}s:4:"args";a:0:{}}i:1;a:3:{s:9:"className";s:32:"tasks.RegistrationExpiryReminder";s:9:"frequency";a:1:{s:4:"hour";s:1:"0";}s:4:"args";a:0:{}}}', 'object'),
('DevelopedByBlockPlugin', '', 0, 0, 'context', '2', 'int'),
('DevelopedByBlockPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('DevelopedByBlockPlugin', '', 0, 0, 'seq', '0', 'int'),
('DevelopedByBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('DevelopedByBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('DevelopedByBlockPlugin', '', 1, 0, 'seq', '0', 'int'),
('FontSizeBlockPlugin', '', 0, 0, 'context', '2', 'int'),
('FontSizeBlockPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('FontSizeBlockPlugin', '', 0, 0, 'seq', '6', 'int'),
('FontSizeBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('FontSizeBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('FontSizeBlockPlugin', '', 1, 0, 'seq', '6', 'int'),
('HelpBlockPlugin', '', 0, 0, 'context', '2', 'int'),
('HelpBlockPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('HelpBlockPlugin', '', 0, 0, 'seq', '1', 'int'),
('HelpBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('HelpBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('HelpBlockPlugin', '', 1, 0, 'seq', '1', 'int'),
('InformationBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('InformationBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('InformationBlockPlugin', '', 1, 0, 'seq', '7', 'int'),
('LanguageToggleBlockPlugin', '', 0, 0, 'context', '2', 'int'),
('LanguageToggleBlockPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('LanguageToggleBlockPlugin', '', 0, 0, 'seq', '4', 'int'),
('LanguageToggleBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('LanguageToggleBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('LanguageToggleBlockPlugin', '', 1, 0, 'seq', '4', 'int'),
('NavigationBlockPlugin', '', 0, 0, 'context', '2', 'int'),
('NavigationBlockPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('NavigationBlockPlugin', '', 0, 0, 'seq', '5', 'int'),
('NavigationBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('NavigationBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('NavigationBlockPlugin', '', 1, 0, 'seq', '5', 'int'),
('NotificationBlockPlugin', '', 0, 0, 'context', '2', 'int'),
('NotificationBlockPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('NotificationBlockPlugin', '', 0, 0, 'seq', '3', 'int'),
('NotificationBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('NotificationBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('NotificationBlockPlugin', '', 1, 0, 'seq', '3', 'int'),
('RoleBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('RoleBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('RoleBlockPlugin', '', 1, 0, 'seq', '3', 'int'),
('TinyMCEPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('TinyMCEPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('UserBlockPlugin', '', 0, 0, 'context', '2', 'int'),
('UserBlockPlugin', '', 0, 0, 'enabled', '1', 'bool'),
('UserBlockPlugin', '', 0, 0, 'seq', '2', 'int'),
('UserBlockPlugin', '', 1, 0, 'context', '2', 'int'),
('UserBlockPlugin', '', 1, 0, 'enabled', '1', 'bool'),
('UserBlockPlugin', '', 1, 0, 'seq', '2', 'int');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `special_requests` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_option_assoc`
--

CREATE TABLE IF NOT EXISTS `registration_option_assoc` (
  `option_id` bigint(20) NOT NULL,
  `registration_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `registration_option_costs`
--

CREATE TABLE IF NOT EXISTS `registration_option_costs` (
  `type_id` bigint(20) NOT NULL,
  `option_id` bigint(20) NOT NULL,
  `cost` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
  `review_form_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_form_responses`
--

CREATE TABLE IF NOT EXISTS `review_form_responses` (
  `review_form_element_id` bigint(20) NOT NULL,
  `review_id` bigint(20) NOT NULL,
  `response_type` varchar(6) DEFAULT NULL,
  `response_value` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `review_stages`
--

CREATE TABLE IF NOT EXISTS `review_stages` (
  `paper_id` bigint(20) NOT NULL,
  `stage` tinyint(4) NOT NULL,
  `review_revision` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `roles`
--

CREATE TABLE IF NOT EXISTS `roles` (
  `conference_id` bigint(20) NOT NULL,
  `sched_conf_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `roles`
--

INSERT INTO `roles` (`conference_id`, `sched_conf_id`, `user_id`, `role_id`) VALUES
(0, 0, 1, 1),
(1, 0, 1, 16);

-- --------------------------------------------------------

--
-- 資料表結構 `rooms`
--

CREATE TABLE IF NOT EXISTS `rooms` (
  `room_id` bigint(20) NOT NULL,
  `building_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=248 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `rt_contexts`
--

INSERT INTO `rt_contexts` (`context_id`, `version_id`, `title`, `abbrev`, `description`, `cited_by`, `author_terms`, `define_terms`, `geo_terms`, `seq`) VALUES
(1, 1, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(2, 1, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(3, 1, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(4, 1, 'Government policy', 'Gov Policy', 'Check various government resources.', 0, 0, 0, 0, 3),
(5, 1, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 4),
(6, 1, 'Portals', 'Portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 5),
(7, 1, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 6),
(8, 1, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(9, 1, 'Data sets', 'Data sets', 'Provides access to agricultural statistics.', 0, 0, 0, 0, 8),
(10, 1, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 9),
(11, 1, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(12, 1, 'Web search', 'Web search', 'Enter search terms for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(13, 2, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(14, 2, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(15, 2, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(16, 2, 'Government policy', 'Gov Policy', 'Check various government resources.', 0, 0, 0, 0, 3),
(17, 2, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 4),
(18, 2, 'Dissertations', 'Dissertations', 'Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.', 0, 0, 0, 0, 5),
(19, 2, 'Portals', 'Portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 6),
(20, 2, 'Databases', 'Databases', 'Art & Architecture Databases', 0, 0, 0, 0, 7),
(21, 2, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 8),
(22, 2, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 9),
(23, 2, 'Teaching files', 'Teaching files', 'Provide educators with quick and easy access to the learning objects and lesson materials found in these databases that would help with the teaching of concepts and materials in their field.', 0, 0, 0, 0, 10),
(24, 2, 'e-Journals', 'e-Journals', 'Electronic Journals', 0, 0, 0, 0, 11),
(25, 2, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 12),
(26, 2, 'Web search', 'Web search', 'Enter a search term for Internet resources through Google search engine.', 0, 0, 0, 0, 13),
(27, 3, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(28, 3, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(29, 3, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(30, 3, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 3),
(31, 3, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 4),
(32, 3, 'Multimedia', 'Multimedia', 'Multimedia Resources', 0, 0, 0, 0, 5),
(33, 3, 'Astro data', 'Astro data', 'Provide access to astronomy data.', 0, 0, 0, 0, 6),
(34, 3, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(35, 3, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(36, 3, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(37, 3, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(38, 3, 'Web search', 'Web search', 'Enter a search term for Internet resources through Google search engine.', 0, 0, 0, 0, 11),
(39, 4, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(40, 4, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(41, 4, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(42, 4, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 3),
(43, 4, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 4),
(44, 4, 'Portals', 'Portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 5),
(45, 4, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 6),
(46, 4, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 7),
(47, 4, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 8),
(48, 4, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 9),
(49, 4, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 10),
(50, 5, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(51, 5, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 1),
(52, 5, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 2),
(53, 5, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 3),
(54, 5, 'Portals', 'Portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 4),
(55, 5, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(56, 5, 'e-Journals', 'e-Journals', 'Provide pop-up window for entering open-access and full-text e-Journals relevant to your field.', 0, 0, 0, 0, 6),
(57, 5, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 7),
(58, 5, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 8),
(59, 5, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(60, 5, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(61, 5, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(62, 6, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(63, 6, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(64, 6, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(65, 6, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 3),
(66, 6, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 4),
(67, 6, 'Portals', 'Portals', 'Portals related to chemistry', 0, 0, 0, 0, 5),
(68, 6, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 6),
(69, 6, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(70, 6, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(71, 6, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(72, 6, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(73, 6, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(74, 7, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(75, 7, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(76, 7, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 2),
(77, 7, 'Cognitive theory', 'Cognitive theory', 'Check the encyclopedic entries to give you the foundationof cognitive theory.', 0, 0, 0, 0, 3),
(78, 7, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 4),
(79, 7, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(80, 7, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 6),
(81, 7, 'Multimedia', 'Multimedia', 'Multimedia resources for Cognitive Sciences', 0, 0, 0, 0, 7),
(82, 7, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(83, 7, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(84, 7, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(85, 7, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(86, 8, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(87, 8, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(88, 8, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(89, 8, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 3),
(90, 8, 'Databases', 'Databases', 'Databases containing information related to Computing Science', 0, 0, 0, 0, 4),
(91, 8, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(92, 8, 'Tech. reports', 'Tech. reports', 'Provide gateway to technical report collections.', 0, 0, 0, 0, 6),
(93, 8, 'Patents', 'Patents', 'Access to Canada, U.S. and Europe patent information.', 0, 0, 0, 0, 7),
(94, 8, 'Standards', 'Standards', 'Access to standards information that is frequently consulted by computer scientists.', 0, 0, 0, 0, 8),
(95, 8, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 9),
(96, 8, 'Multimedia', 'Multimedia', 'Multimedia resources', 0, 0, 0, 0, 10),
(97, 8, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 11),
(98, 8, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 12),
(99, 8, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 13),
(100, 8, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 14),
(101, 9, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(102, 9, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box.  You can also type or paste a word into the box.  Then use the search function to find a definition for the word.  These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(103, 9, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 2),
(104, 9, 'Working papers', 'Working papers', 'Search the largest online, free research paper collections in economics.', 0, 0, 0, 0, 3),
(105, 9, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 4),
(106, 9, 'Portals', 'Portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 5),
(107, 9, 'Nat''l statistics', 'Nat''l statistics', 'Provides access to statistics in economic studies.', 0, 0, 0, 0, 6),
(108, 9, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 7),
(109, 9, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 8),
(110, 9, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 9),
(111, 9, 'Government policy', 'Gov Policy', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(112, 9, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 11),
(113, 9, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 12),
(114, 10, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(115, 10, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(116, 10, 'Book searches', 'Book searches', 'Book-related Resources', 0, 0, 0, 0, 2),
(117, 10, 'e-Journals', 'e-Journals', 'Provide pop-up window for entering open-access and full-text e-Journals relevant to your field.', 0, 0, 0, 0, 3),
(118, 10, 'Related theory', 'Related theory', 'Access to published scholarly articles and studies in the foundations of education, and in related disciplines outside the field of education, which contribute to the advancement of educational theory.', 0, 0, 0, 0, 4),
(119, 10, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 5),
(120, 10, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 6),
(121, 10, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(122, 10, 'Multimedia', 'Multimedia', 'Multimedia Content', 0, 0, 0, 0, 8),
(123, 10, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 9),
(124, 10, 'Relevant portals', 'Relevant portals', 'Education-related Portals', 0, 0, 0, 0, 10),
(125, 10, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 11),
(126, 10, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 12),
(127, 10, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 13),
(128, 11, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(129, 11, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(130, 11, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(131, 11, 'Government policy', 'Gov Policy', 'Check various government resources.', 0, 0, 0, 0, 3),
(132, 11, 'Portals', 'Portals', 'Environmental resource portals', 0, 0, 0, 0, 4),
(133, 11, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 5),
(134, 11, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 6),
(135, 11, 'Data sets', 'Data sets', 'Provides access to statistics in environmental studies.', 0, 0, 0, 0, 7),
(136, 11, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 8),
(137, 11, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 9),
(138, 11, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 10),
(139, 12, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(140, 12, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(141, 12, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 2),
(142, 12, 'Portals', 'Portals', 'General Science resource portals', 0, 0, 0, 0, 3),
(143, 12, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 4),
(144, 12, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(145, 12, 'Directories', 'Directories', 'Access to information of research institutions', 0, 0, 0, 0, 6),
(146, 12, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(147, 12, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(148, 12, 'Multimedia', 'Multimedia', 'Multimedia content', 0, 0, 0, 0, 9),
(149, 12, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 10),
(150, 12, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 11),
(151, 12, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 12),
(152, 13, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(153, 13, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(154, 13, 'Government policy', 'Gov Policy', 'Check various government resources.', 0, 0, 0, 0, 2),
(155, 13, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 3),
(156, 13, 'Book reviews', 'Book reviews', 'Check online scholary book review resources.', 0, 0, 0, 0, 4),
(157, 13, 'Dissertations', 'Dissertations', 'Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.', 0, 0, 0, 0, 5),
(158, 13, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 6),
(159, 13, 'Quotations', 'Quotations', 'Search familiear or famous quotation resources on the Internet', 0, 0, 0, 0, 7),
(160, 13, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 8),
(161, 13, 'Resources', 'Resources', 'General Resources', 0, 0, 0, 0, 9),
(162, 13, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(163, 13, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(164, 14, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(165, 14, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(166, 14, 'Gov''t policy', 'Gov''t policy', 'Check various government resources.', 0, 0, 0, 0, 2),
(167, 14, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 3),
(168, 14, 'Lit critics', 'Literary Critics', 'Search critical and biographical websites about authors and their works that can be browsed by author, by title, or by nationality and literary period.', 0, 0, 0, 0, 4),
(169, 14, 'Book reviews', 'Book reviews', 'Click on the search urls to check for book reviews.', 0, 0, 0, 0, 5),
(170, 14, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 6),
(171, 14, 'Dissertations', 'Dissertations', 'Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.', 0, 0, 0, 0, 7),
(172, 14, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 8),
(173, 14, 'Portals', 'Portals', 'Portals', 0, 0, 0, 0, 9),
(174, 14, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 10),
(175, 14, 'Related texts', 'Related texts', 'Provide online access to full text resources in Humanities.', 0, 0, 0, 0, 11),
(176, 14, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 12),
(177, 14, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 13),
(178, 14, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 14),
(179, 14, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 15),
(180, 15, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(181, 15, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(182, 15, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(183, 15, 'Multimedia', 'Multimedia', 'Multimedia content', 0, 0, 0, 0, 3),
(184, 15, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 4),
(185, 15, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(186, 15, 'Government health sites', 'Gov Health Sites', 'Access to health information resources provided by govenment.', 0, 0, 0, 0, 6),
(187, 15, 'Portals', 'Portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 7),
(188, 15, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 8),
(189, 15, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 9),
(190, 15, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(191, 15, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 11),
(192, 15, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 12),
(193, 15, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 13),
(194, 16, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(195, 16, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(196, 16, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 2),
(197, 16, 'Databases', 'Databases', 'Databases', 0, 0, 0, 0, 3),
(198, 16, 'Math theory', 'Math theory', 'Access to glossary of terms ranges from undergraduate to research level.', 0, 0, 0, 0, 4),
(199, 16, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 5),
(200, 16, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 6),
(201, 16, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 7),
(202, 16, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 8),
(203, 16, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 9),
(204, 16, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 10),
(205, 16, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 11),
(206, 17, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(207, 17, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(208, 17, 'e-Journals', 'e-Journals', 'Electronic Journals', 0, 0, 0, 0, 2),
(209, 17, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 3),
(210, 17, 'Government policy', 'Gov Policy', 'Check various government resources.', 0, 0, 0, 0, 4),
(211, 17, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 5),
(212, 17, 'Dissertations', 'Dissertations', 'Provides access to a repository of rich graduate educational material contributed by a number of member institutions worldwide.', 0, 0, 0, 0, 6),
(213, 17, 'Databases', 'Databases', 'Provide access to open-access abstract and/or full-text databases.', 0, 0, 0, 0, 7),
(214, 17, 'Portals', 'Portals', 'Offer an entry point to other websites.', 0, 0, 0, 0, 8),
(215, 17, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 9),
(216, 17, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 10),
(217, 17, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 11),
(218, 17, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 12),
(219, 18, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(220, 18, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(221, 18, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(222, 18, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 3),
(223, 18, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 4),
(224, 18, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 5),
(225, 18, 'Multimedia', 'Multimedia', 'Multimedia content', 0, 0, 0, 0, 6),
(226, 18, 'Teaching files', 'Instructional', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 7),
(227, 18, 'Databases', 'Databases', 'Databases', 0, 0, 0, 0, 8),
(228, 18, 'Portals', 'Portals', 'Portals', 0, 0, 0, 0, 9),
(229, 18, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 10),
(230, 18, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 11),
(231, 18, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 12),
(232, 19, 'Author''s work', 'Other Works', 'Identify other works by the article''s author(s) by using OAI engines.', 0, 1, 0, 0, 0),
(233, 19, 'Look up terms', 'Look up terms', 'Double click on any word in the text and it will appear in the "Definition of terms" box. You can also type or paste a word into the box. Then use the search function to find a definition for the word. These resources have been selected because of their relevance and their open (free) access to all or part of their contents.', 0, 0, 1, 0, 1),
(234, 19, 'Related studies', 'Related studies', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 2),
(235, 19, 'Book reviews', 'Book reviews', 'Click on the search urls to check for book reviews.', 0, 0, 0, 0, 3),
(236, 19, 'Pay-per-view', 'Pay-per-view', 'A pay-per-view service is for those who do not have direct access to electronic journal articles via subscriptions. The service allows customers to gain direct access to an article by paying by credit card using the RSC''s secure payment mechanism. Immediately the payment details have been validated, the customer can gain access to the required article file for a period of 30 days.', 0, 0, 0, 0, 4),
(237, 19, 'Surveys', 'Surveys', 'Access to important surveys in social science.', 0, 0, 0, 0, 5),
(238, 19, 'Soc sci data', 'Soc sci data', 'Provides access to a vast archive of social science data for research and instruction.', 0, 0, 0, 0, 6),
(239, 19, 'Social theories', 'Social theories', 'Search sites contain information on social theories.', 0, 0, 0, 0, 7),
(240, 19, 'Book', 'Book', 'Book-related Resources', 0, 0, 0, 0, 8),
(241, 19, 'Databases', 'Databases', 'Access to related studies by establishing a working link with an open-access (free) database, with abstracts and/or full texts related to your topic.', 0, 0, 0, 0, 9),
(242, 19, 'Portals', 'Portals', 'Portals', 0, 0, 0, 0, 10),
(243, 19, 'Online forums', 'Online forums', 'Choose online, open-access online forums that would enrich the context of the research studies on your site.', 0, 0, 0, 0, 11),
(244, 19, 'Legal materials', 'Legal materials', 'Porvides free Internet access to legal materials of major countries.', 0, 0, 0, 0, 12),
(245, 19, 'Government policy', 'Gov Policy', 'Access to Information and services gateway run by the Government of the United States and Canada.', 0, 0, 0, 0, 13),
(246, 19, 'Media reports', 'Media reports', 'Immediately initiates a search based on the subject of the article or paper that connects users to free current and archival articles in the field from leading newspapers around the world.', 0, 0, 0, 0, 14),
(247, 19, 'Web search', 'Web search', 'Enter a search term for Internet resources through various search engines.', 0, 0, 0, 0, 15);

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
) ENGINE=InnoDB AUTO_INCREMENT=1295 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `rt_searches`
--

INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(1, 1, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(2, 1, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(3, 1, 'Rice bibliography', 'The Rice Bibliography was begun in 1961 and is now the world''s largest source of scientific information about rice. Almost 8,000 new references are added each year and these cover all subjects related to rice culture.', 'http://ricelib.irri.cgiar.org:81/search/w', 'http://ricelib.irri.cgiar.org:81/search/?searchtype=w&searcharg={$formKeywords}', NULL, 2),
(4, 1, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 3),
(5, 1, 'AgEcon Search: Research in agricultural Economics', 'AgEcon Search is designed to electronically distribute reports of scholarly research in the field of agricultural economics.', 'http://agecon.lib.umn.edu/', 'http://agecon.lib.umn.edu/cgi-bin/view.pl?bool=AND&fields=author&detail=0&keywords={$formKeywords}', NULL, 4),
(6, 1, 'The Digital Library of the Commons (DLC)', 'DLC is a gateway to the international literature on the commons . This site contains a Working Paper Archive of author-submitted papers, as well as full-text conference papers, dissertations, working papers and pre-prints, and reports.', 'http://dlc.dlib.indiana.edu/', 'http://dlc.dlib.indiana.edu/perl/search?abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear_srchtype=ALL&_action_search=Search&abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear={$formKeywords}', NULL, 5),
(7, 1, 'PESTIS document database', 'The Pesticide Information Service (PESTIS) is an on-line database for the pesticide use reform and sustainable agriculture communities, made available on the EcoNet computer network. It contains over 400 news items, action alerts, newsletter articles and fact sheets.', 'http://www.panna.org/resources/pestis.html', 'http://www.panna.org/system/searchResults.html?p=1&lang=en&include=&exclude=&penalty=.05&mode=&searchScope=all&q={$formKeywords}', NULL, 6),
(8, 1, 'Common Names for Plant Diseases', 'This resource is an electronic version of: Common names for plant diseases, 1994. Published: St. Paul, Minn.: APS Press, 1994. This compilation provides an updated, combined version of lists of names published in Phytopathology News and Plant Disease.', 'http://www.apsnet.org/online/common/', 'http://www.apsnet.org/online/common/query.asp', 'scope=/online/common/names/&FreeText=on&SearchString={$formKeywords}', 7),
(9, 1, 'Vegetable MD online', 'Vegetable MD Online was developed to provide access to the many Vegetable Disease Fact Sheets produced over the years by Media Services at Cornell. The addition of color photographs enhances the use of these sheets for plant disease diagnosis. The fact sheets also include information about planting methods, irrigation, weed control, insects, handling, field selection, and other issues related to vegetables and their cultivation.', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp?target={$formKeywords}', NULL, 8),
(10, 1, 'VITIS-VEA', 'VITIS-VEA, Viticulture and Enology Abstracts is an international German or English-language publications database in the field of viticulture and enology. It covers grapevine morphology, physiology, and biochemistry, soil science, genetics and grapevine breeding, phytopathology and grapevine protection, cellar techniques, economics of viticulture and enology, and the microbiology of wine.', 'http://vitis-vea.zadi.de/stichwortsuche_eng.htm', 'http://vitis-vea.zadi.de/VITISVEA_ENG/SDF?STICHWORT_O=includes&FORM_F1=AUT1&FORM_SO=Ascend&STICHWORT={$formKeywords}', NULL, 9),
(11, 1, 'World Agricultural Information Centre (WAICENT)', 'This site contains information management and dissemination on desertification, gender and sustainable development, food standards, animal genetic resources, post-harvest operations, agro-biodiversity and food systems in urban centres.', 'http://www.fao.org/waicent/index_en.asp', 'http://www.fao.org/waicent/search/simple_s_result.asp?publication=1&webpage=2&photo=3&press=5&CGIAR=1&QueryString={$formKeywords}', NULL, 10),
(12, 1, 'FAO document repository', 'FAO Document Repository collects and disseminates on the Internet full FAO documents and publications as well as selected non-FAO publications. Three types of searches are provided and several language options are available.', 'http://www.fao.org/documents/', 'http://www.fao.org/documents/advanced_s_result.asp?form_c=AND&RecordsPerPage=50&QueryString={$formKeywords}', NULL, 11),
(13, 2, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(14, 2, 'FAO Glossary of Biotechnology for Food and Agriculture', 'This site provides a tabbed list of words and their definitions, but no search function.  Online searches are free.  There is a bound book version of the dictionary available for sale.', 'http://www.fao.org/biotech/index_glossary.asp', 'http://www.fao.org/biotech/find-form-n.asp', 'terms={$formKeywords}', 1),
(15, 2, 'NAL Agricultural Thesaurus', 'NAL Agricultural Thesaurus was created to meet the needs of the United States Department of Agriculture (USDA), Agricultural Research Service (ARS), for an agricultural thesaurus. NAL Agricultural Thesaurus is for anyone describing, organizing and classifying agricultural resources such as: books, articles, catalogs, databases, patents, games, educational materials, pictures, slides, film, videotapes, software, other electronic media, or websites. It is organized into 17 subject categories.', 'http://agclass.nal.usda.gov/agt/agt.htm', 'http://agclass.nal.usda.gov/agt/mtw.exe?k=default&p=A&l=60&s=2&t=1&n=100&w={$formKeywords}', NULL, 2),
(16, 2, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(17, 2, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(18, 2, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(19, 2, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(20, 3, 'AgEcon Search: Research in agricultural Economics', 'AgEcon Search is designed to electronically distribute reports of scholarly research in the field of agricultural economics.', 'http://agecon.lib.umn.edu/', 'http://agecon.lib.umn.edu/cgi-bin/view.pl?bool=AND&fields=key&detail=0&keywords={$formKeywords}', NULL, 0),
(21, 3, 'CropSEARCH', 'Index to plant lists of hundreds of crop species.', 'http://www.hort.purdue.edu/newcrop/SearchEngine.html', 'http://index.cc.purdue.edu:8765/query.html?col=pumerge&charset=iso-8859-1&ht=0&qp=%2Bsite%3Ahort.purdue.edu&qs=&qc=&pw=100%25&ws=0&la=en&qm=0&st=1&nh=10&lk=1&rf=0&rq=0&si=0&puhead=header.html&pufoot=footer.html&qt={$formKeywords}', NULL, 1),
(22, 3, 'The Digital Library of the Commons (DLC)', 'DLC is a gateway to the international literature on the commons . This site contains a Working Paper Archive of author-submitted papers, as well as full-text conference papers, dissertations, working papers and pre-prints, and reports.', 'http://dlc.dlib.indiana.edu/', 'http://dlc.dlib.indiana.edu/perl/search?abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear_srchtype=ALL&_action_search=Search&abstract%2Fagency%2Fauthors%2Fconfdates%2Fconference%2Fconfloc%2Fcountry%2Fdiscipline%2Feditors%2Fkeywords%2Flanguage%2Fresearch%2Fseries%2Fsubjecttext%2Fthesistype%2Ftitle%2Fyear={$formKeywords}', NULL, 2),
(23, 3, 'FAS online', 'The Foreign Agricultural Service (FAS) of the U.S. Department of Agriculture (USDA) produces hundreds of documents each year that chart and analyze production, consumption, trade flows, and market opportunities for about 100 agricultural products. Includes market-and commodity-specific reports, data and statistics, news, trade leads, information on export and import programs, and more.', 'http://www.fas.usda.gov/fassearch.asp', 'http://www.fas.usda.gov/FASSearch_results_H.asp?SearchString={$formKeywords}', NULL, 3),
(24, 3, 'PESTIS document database', 'The Pesticide Information Service (PESTIS) is an on-line database for the pesticide use reform and sustainable agriculture communities, made available on the EcoNet computer network. It contains over 400 news items, action alerts, newsletter articles and fact sheets.', 'http://www.panna.org/resources/pestis.html', 'http://www.panna.org/system/searchResults.html?p=1&lang=en&include=&exclude=&penalty=.05&mode=&searchScope=all&q={$formKeywords}', NULL, 4),
(25, 3, 'PlantFacts', 'PlantFacts includes guides for answering plant-related questions from 46 different universities and government institutions across the United States and Canada. Over 20,000 pages of Extension fact sheets and bulletins provide a concentrated source of plant-related information. PlantFacts has merged several digital collections developed at Ohio State University to become an international knowledge bank and multimedia learning center.', 'http://plantfacts.osu.edu/', 'http://plantfacts.osu.edu/action.lasso?-Layout=input&-Search=-nothing&-Response=results_list2.lasso&-AnyError=error.lasso&searchitem={$formKeywords}', NULL, 5),
(26, 3, 'National PLANTS database', 'Focuses on the vascular and nonvascular plants of the United States and its territories. The PLANTS database includes checklists, distributional data, crop information, plants symbols, plant growth data, references and other plant information.', 'http://plants.usda.gov/', 'http://www.nrcs.usda.gov/search.asp?site=NPDC&ct=ALL&qu={$formKeywords}', NULL, 6),
(27, 3, 'Common Names for Plant Diseases', 'This resource is an electronic version of: Common names for plant diseases, 1994. Published: St. Paul, Minn.: APS Press, 1994. This compilation provides an updated, combined version of lists of names published in Phytopathology News and Plant Disease.', 'http://www.apsnet.org/online/common/', 'http://www.apsnet.org/online/common/query.asp', 'scope=/online/common/names/&FreeText=on&SearchString={$formKeywords}', 7),
(28, 3, 'Rice bibliography', 'The Rice Bibliography was begun in 1961 and is now the world''s largest source of scientific information about rice. Almost 8,000 new references are added each year and these cover all subjects related to rice culture.', 'http://ricelib.irri.cgiar.org:81/search/w', 'http://ricelib.irri.cgiar.org:81/search/w?SEARCH={$formKeywords}', NULL, 8),
(29, 3, 'Vegetable MD online', 'Vegetable MD Online was developed to provide access to the many Vegetable Disease Fact Sheets produced over the years by Media Services at Cornell. The addition of color photographs enhances the use of these sheets for plant disease diagnosis. The fact sheets also include information about planting methods, irrigation, weed control, insects, handling, field selection, and other issues related to vegetables and their cultivation.', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp', 'http://vegetablemdonline.ppath.cornell.edu/Vegmd.asp?target={$formKeywords}', NULL, 9),
(30, 3, 'VITIS-VEA', 'VITIS-VEA, Viticulture and Enology Abstracts is an international German or English-language publications database in the field of viticulture and enology. It covers grapevine morphology, physiology, and biochemistry, soil science, genetics and grapevine breeding, phytopathology and grapevine protection, cellar techniques, economics of viticulture and enology, and the microbiology of wine.', 'http://vitis-vea.zadi.de/stichwortsuche_eng.htm', 'http://vitis-vea.zadi.de/VITISVEA_ENG/SDF?STICHWORT_O=includes&FORM_F1=AUT1&FORM_SO=Ascend&STICHWORT={$formKeywords}', NULL, 10),
(31, 4, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(32, 4, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(33, 4, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(34, 4, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(35, 4, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(36, 4, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(37, 4, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(38, 5, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(39, 5, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(40, 5, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(41, 5, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(42, 5, 'E-STREAMS', 'E-STREAMS: Electronic reviews of Science & Technology References covering Engineering, Agriculture, Medicine and Science. Each issue contains 30+ STM reviews, covering new titles in Engineering, Agriculture, Medicine and Science. Each review is signed, and includes the email address of the reviewer. The reviews feature short TOCs, a list of contributors and bibliographic information.', 'http://www.e-streams.com/', 'http://www.e-streams.com/c3/cgi-bin/search.pl', 'boolean=AND&case=Insensitive&terms={$formKeywords}', 4),
(43, 6, 'AgNIC', 'AgNIC is a guide to quality agricultural information on the Internet as selected by the National Agricultural Library, Land-Grant Universities, and other institutions.', 'http://www.agnic.org/', 'http://www.agnic.org/advsearch/?submitted=1&searchtype=AgResource&keywords={$formKeywords}', NULL, 0),
(44, 6, 'AGRICOLA articles (NAL Web: 1982- )', 'AGRICOLA covers the areas of agriculture, agricultural administration, agricultural laws and legislation, agricultural regulations, agricultural economics, agricultural education and training, agricultural extension and advisory work, agricultural engineering, agricultural products, animal science, entomology, aquatic science, fisheries, feed science, food science, food products, forestry, geography, meteorology, climatology, history, home economics, human ecology, household textiles and clothing, human nutrition, natural resources, pesticides, plant science, pollution, soil science, rural sociology, rural development, and human parasitology. It indexes journal articles and other publications as well as audiovisual materials, maps, books, software, conference proceedings, theses, research reports and government documents.', 'http://agricola.nal.usda.gov/', 'http://agricola.nal.usda.gov/cgi-bin/Pwebrecon.cgi?BOOL1=all+of+these&FLD1=Keyword+Anywhere+%28GKEY%29&GRP1=AND+with+next+set&SAB2=&BOOL2=any+of+these&FLD2=Subject+%28SKEY%29&GRP2=AND+with+next+set&SAB3=&BOOL3=as+a+phrase&FLD3=Title+%28TKEY%29&GRP3=AND+with+next+set&SAB4=&BOOL4=as+a+phrase&FLD4=Author+Name+%28NKEY%29&PID=4294&SEQ=20060511212523&CNT=25&HIST=1&SAB1={$formKeywords}', NULL, 1),
(45, 6, 'AgriSurf! - The Farmers Search Engine', 'From family farms to agribusiness, almost 20,000 sites "hand picked by agricultural experts" are arranged in categories, indexed, rated for speed and reliability of access, labeled with the flag of their country of origin, and may be searched using keywords. Annotations are taken from the sites'' self-descriptions.', 'http://www.agrisurf.com/agrisurfscripts/agrisurf.asp?index=_25', 'http://www.agrisurf.com/?cx=009099332680230023402%3Asp1yugldxek&cof=FORID%3A10&q={$formKeywords}', NULL, 2),
(46, 6, 'Farms.com', 'Established in 1995, Farms.com has been instrumental in the development of the Agricultural Internet. Now recognized throughout North America as the leading Agriculture Internet resource, Farms.com has successfully combined agri-business experience with the vast power of the Internet to provide producers with the information, services, and markets they need to make sound business decisions and increase profitability.', 'http://canada.eharvest.com/', 'http://www.agrisurf.com/agrisurfscripts/inc/farms/search.asp?index=_25&rbtn=ALL&ft=on&SearchString={$formKeywords}', NULL, 3),
(47, 6, 'Scirus', 'Scirus is the most comprehensive science-specific search engine on the Internet. Driven by the latest search engine technology, Scirus searches over 150 million science-specific Web pages.', 'http://www.scirus.com/srsapp/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 4),
(48, 6, 'World Agricultural Information Centre (WAICENT)', 'This site contains information management and dissemination on desertification, gender and sustainable development, food standards, animal genetic resources, post-harvest operations, agro-biodiversity and food systems in urban centres.', 'http://www.fao.org/waicent/index_en.asp', 'http://www.fao.org/waicent/search/simple_s_result.asp?publication=1&webpage=2&photo=3&press=5&CGIAR=1&QueryString={$formKeywords}', NULL, 5),
(49, 6, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 6),
(50, 6, 'Agriculture 21', 'Contains news and features on agricultural and food-supply issues worldwide, as well as downloadable publications, links to databases, subject guides, and access to divisions of the FAO Agriculture Department. Includes search engine.', 'http://www.fao.org/ag/', 'http://www.fao.org/ag/search/agfind.asp?Find=Find&SortBy=rank[d]&Scope=/ag&CiuserParam3=agfind.asp&lang=en&FMMod=any&FSRest=<&FSRestval=any&Action=Execute&SearchString={$formKeywords}', NULL, 7),
(51, 7, 'FAO document repository', 'FAO Document Repository collects and disseminates on the Internet full FAO documents and publications as well as selected non-FAO publications. Three types of searches are provided and several language options are available.', 'http://www.fao.org/documents/', 'http://www.fao.org/documents/advanced_s_result.asp?form_c=AND&RecordsPerPage=50&QueryString={$formKeywords}', NULL, 0),
(52, 7, 'National Ag Safety Databases (NASD)', 'The National Ag Safety Databases (NASD) is a database of materials devoted to increased safety, health and injury prevention in agriculture, listed by topic and state. Video resources are indexed, there are special listings for conference proceedings, posters and other materials.', 'http://www.cdc.gov/search.htm', 'http://www.cdc.gov/search.do?action=search&x=0&y=0&queryText={$formKeywords}', NULL, 1),
(53, 7, 'E-Answers', 'A collection of over 250,000 pages of full text electronic documents from the Extension Services and Agricultural Experiment Stations of over fifteen states of the United States, searchable by keyword and by region of the country. A single-stop access to a large number of useful and reputable publications on topics in agriculture, family topics, consumer issues, environment, economics, and public policy.', 'http://e-answers.adec.edu/', 'http://e-answers.adec.edu/cgi-bin/htsearch?config=ea-all&words={$formKeywords}', NULL, 2),
(54, 7, 'National Plants Databases', 'From the U.S. Department of Agriculture Natural Resources Conservation Service, "The PLANTS Databases is a single source of standardized information about plants. . . focuse[d] on vascular plants, mosses, liverworts, hornworts, and lichens of the U.S. and its territories. The PLANTS Databases includes names, checklists, automated tools, identification information, species abstracts, distributional data, crop information, plant symbols, plant growth data, plant materials information, plant links, references, and other plant information." An FAQ section linked to the banner provides additional information.', 'http://plants.usda.gov/', 'http://www.nrcs.usda.gov/search.asp?site=NPDC&ct=ALL&qu={$formKeywords}', NULL, 3),
(55, 8, 'Agricultural Conferences, Meetings, Seminars Calendar', 'This calendar strives to include all major national and international agricultural meetings and others of apparent scientific importance. We will incorporate local level meetings only when they seem to be scientifically significant. Meetings outside our purview will be left to appropriate local, regional, or organization-specific calendars. We do plan to create links to such calendars when they are available. Provides a central repository for information and links to information concerning upcoming agricultural conferences, with emphasis on those of scientific significance.', 'http://www.agnic.org/mtg/', 'http://www.agnic.org/events/index.html?submitted=1&searchtype=keyword&keywords={$formKeywords}', NULL, 0),
(56, 8, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in biology.', 'http://lists.topica.com/dir/?cid=187', 'http://www.liszt.com/search/?search_type=cat&query={$formKeywords}', NULL, 1),
(57, 8, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+{$formKeywords}', NULL, 2),
(58, 8, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 3),
(59, 9, 'Breeds of Livestock', 'Web site allows users to search for information on livestock by world region or by species name. Data is available on cattle, horses, swine, goats, and sheep and organized as encyclopedia entries.', 'http://www.ansi.okstate.edu/breeds/', 'http://www.google.com/search?q=site%3Aansi.okstate.edu+breeds+', NULL, 0),
(60, 9, 'USDA Economics and Statistics System', 'USDA Economics and Statistics System contains more than 400 reports and datasets from the economics agencies of the U.S. Department of Agriculture. These materials cover U.S. and international agriculture and related topics. Most reports are text files that contain time-sensitive information. Most data sets are in spreadsheet format and include time-series data that are updated yearly.', 'http://usda.mannlib.cornell.edu/', 'http://usda.mannlib.cornell.edu/MannUsda/search.do?action=fullKeywordSearch&titlesearch=titlesearch&includeAMS=includeAMS&simple_search_term={$formKeywords}', NULL, 1),
(61, 10, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(62, 10, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&frm=smp.x&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&p00={$formKeywords}', NULL, 1),
(63, 10, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is raning from 19.05 per month to 119.95 per year.', 'http://www.questia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(64, 10, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(65, 11, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(66, 11, 'Agriculture 21', 'This site contains news and features on agricultural and food-supply issues worldwide, as well as downloadable publications, links to databases, subject guides, and access to divisions of the FAO Agriculture Department. Includes search engine.', 'http://www.fao.org/ag/', 'http://www.fao.org/ag/search/agfind.asp?SortBy=rank%5Bd%5D&Scope=%2Fag&FSRestVal=any&Action=Execute&SearchString={$formKeywords}', NULL, 1),
(67, 11, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(68, 11, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 3),
(69, 11, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 4),
(70, 11, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 5),
(71, 11, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=past30days&submit.x=11&submit.y=12&query={$formKeywords}', NULL, 6),
(72, 11, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 7),
(73, 11, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 8),
(74, 11, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 9),
(75, 11, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 10),
(76, 12, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(77, 12, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(78, 12, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(79, 12, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(80, 13, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(81, 13, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(82, 13, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(83, 13, 'SPIRO (Architecture Slide Library, University of California - Berkeley)', 'SPIRO (slide & photograph image retrieval online) provides access to images and descriptive information about 20% of the Library''s collection of 200,000 35mm slides.', 'http://www.mip.berkeley.edu/query_forms/browse_spiro_form.html', 'http://www.mip.berkeley.edu/cgi-bin/browse_spiro_new/tmp?db_handle=browse_spiro&object=&place=&aat_term=&aat_term2=&source=&image_id=&kw=&from_date=&period=any&result_type=thumbnail_with_descr&name={$formKeywords}', NULL, 3),
(84, 13, 'GreatBuildings.com', 'This gateway to architecture around the world and across history documents a thousand buildings and hundreds of leading architects, with 3D models, photographic images and architectural drawings, commentaries, bibliographies, web links, and more, for famous designers and structures of all kinds.', 'http://www.greatbuildings.com/search.html', 'http://www.greatbuildings.com/cgi-bin/gbc-search.cgi?search=architect&architect={$formKeywords}', NULL, 4),
(85, 13, 'Intute: Arts & Humanities', 'Intute: Arts & Humanities is a free online service providing you with access to the best Web resources for education and research, selected and evaluated by a network of subject specialists. There are over 18,000 Web resources listed here that are freely available by keyword searching and browsing.', 'http://www.intute.ac.uk/artsandhumanities/ejournals.html', 'http://www.intute.ac.uk/artsandhumanities/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=artsandhumanities&term1={$formKeywords}', NULL, 5),
(86, 14, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(87, 14, 'Columbia Encyclopedia', 'Serving as a "first aid" for those who read, the sixth edition of the Columbia Encyclopedia contains over 51,000 entries with 80,000 hypertext links.', 'http://www.bartleby.com/65/', 'http://www.bartleby.com/cgi-bin/texis/webinator/65search?search_type=full&query={$formKeywords}', NULL, 1),
(88, 14, 'WordWeb Online', 'WordWeb is an international dictionary and word finder with more than 280 000 possible lookup words and phrases. It is also available as Windows software.\n\nWordWeb fully covers American, British, Australian, Canadian and Asian English spellings and words.', 'http://www.wordwebonline.com/', 'http://www.wordwebonline.com/search.pl?w={$formKeywords}', NULL, 2),
(89, 14, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(90, 14, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(91, 14, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(92, 14, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(93, 15, 'SPIRO (Architecture Slide Library, University of California - Berkeley)', 'SPIRO (slide & photograph image retrieval online) provides access to images and descriptive information about 20% of the Library''s collection of 200,000 35mm slides.', 'http://www.mip.berkeley.edu/query_forms/browse_spiro_form.html', 'http://www.mip.berkeley.edu/cgi-bin/browse_spiro_new/tmp?db_handle=browse_spiro&object=&place=&aat_term=&aat_term2=&source=&image_id=&from_date=&period=any&result_type=thumbnail_with_descr&name=&kw={$formKeywords}', NULL, 0),
(94, 15, 'Intute: Arts & Humanities', 'Intute: Arts & Humanities is a free online service providing you with access to the best Web resources for education and research, selected and evaluated by a network of subject specialists. There are over 18,000 Web resources listed here that are freely available by keyword searching and browsing.', 'http://www.intute.ac.uk/artsandhumanities/ejournals.html', 'http://www.intute.ac.uk/artsandhumanities/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=artsandhumanities&term1={$formKeywords}', NULL, 1),
(95, 15, 'GreatBuildings.com', 'This gateway to architecture around the world and across history documents a thousand buildings and hundreds of leading architects, with 3D models, photographic images and architectural drawings, commentaries, bibliographies, web links, and more, for famous designers and structures of all kinds.', 'http://www.greatbuildings.com/search.html', 'http://www.greatbuildings.com/cgi-bin/gbc-search.cgi?search=building&building={$formKeywords}', NULL, 2),
(96, 16, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(97, 16, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(98, 16, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(99, 16, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(100, 16, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(101, 16, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(102, 16, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(103, 17, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(104, 17, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(105, 17, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(106, 17, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(107, 18, 'Networked Digital Library of Theses and Dissertations Union Catalog', 'This Union Catalog serves as a repository of rich graduate educational material contributed by a number of member institutions worldwide.  This project is a joint development with NDLTD and VTLS Inc.  It is hoped that this project will increase the availability of student research for scholars, empowere students to convey a richer message through the use of multimedia and hypermedia technologies and advance digital library technology worldwide.', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon?sessionid=2006051219043826835&skin=ndltd&submittheform=Search&usersrch=1&beginsrch=1&elementcount=3&function=INITREQ&search=SCAN&lng=en&pos=1&conf=.%2Fchameleon.conf&u1=4&host=localhost%2B3668%2BDEFAULT&t1={$formKeywords}', NULL, 0),
(108, 18, 'CRL Foreign Doctoral Dissertation Databases', 'The CRL''s (Center For Research Libraries) database for dissertations published outside of the United States and Canada is still in the construction phase.  At this point, a total of 15,000 of 750,000 records are loaded into the database.  Searchable by author, institution name, title, year, translated title, subject keywords, language, and country, the database also provides instructions for interlibrary loan procedure.', 'http://www.crl.edu/default.asp', 'http://www.crl.edu/DBSearch/catalogSearchNew.asp?sort=R&req_type=X&search={$formKeywords}', NULL, 1),
(109, 18, 'Scirus ETD Search', 'NDLTD offers a search service provided by Scirus, which is based on data harvested from the Union Archive hosted by OCLC.', 'http://www.ndltd.org/info/description.en.html', 'http://www.scirus.com/srsapp/search?rep=ndl&q={$formKeywords}', NULL, 2),
(110, 18, 'Dissertation.com', 'Academic publishers of masters theses and doctoral PhD dissertations. Search 1000s of dissertation abstracts in dissertation database.', 'http://dissertation.com/', 'http://dissertation.com/browse.php?criteria=all&submit.x=23&submit.y=5&keyword={$formKeywords}', NULL, 3),
(111, 19, 'The Art, Design, Architecture & Media Information Gateway (ADAM)', 'ADAM is being developed to provide a gateway to information about fine art, design, architecture, applied arts, media, theory, museum studies and conservation and professional practice related to any of the above. It is one of the eLib Access to Network Resources (ANR) projects and received its funding from JISC. A user survey to measure information needs and search methods, annual reports, and service usage statistics are published at the site.', 'http://www.adam.ac.uk/index.html', 'http://www.adam.ac.uk/ixbin/hixserv?_IXDB_=adam&%7BUPPER%7D%24%3Fany%3A+IX_MODE+rel%3D1+%28%24any%29+INDEX+res_keywords=.&%24+with+res_pub=.&%24sort+@descending+%24%24relevance=.&%24%3F%21x%3A%28%28collection+or+item%29+in+res_granularity%29=.&_IXSPFX_=s&submit-button=SUMMARY&%24%3Dany%3D%24={$formKeywords}', NULL, 0),
(112, 19, 'Akropolis.net', 'The premier architecture resource on the Internet, including Architects, Interior Designers, Landscapers, employment, free web sites, free portfolios, search engine, and more.', 'http://www.akropolis.net/', 'http://www.akropolis.net/search/index.ahtml?referredby=home&action=SEARCH&words={$formKeywords}', NULL, 1),
(113, 20, 'Artcyclopedia.com', 'This site has compiled a comprehensive index of every artist represented at hundreds of museum sites, image archives, and other online resources.  The site has started out by covering the biggest and best sites around, and has links for most well-known artists:  contains 1800 art sites, and offers over 60,000 links to an estimated 150,000 artworks by 8,100 renowned artists.', 'http://www.artcyclopedia.com/', 'http://www.artcyclopedia.com/scripts/tsearch.pl?type=2&t={$formKeywords}', NULL, 0),
(114, 20, 'Union List of Artists Names', 'Contains biographical information about artists and architects, including variant names, pseudonyms, and language variants.', 'http://www.getty.edu/research/tools/vocabulary/ulan/', 'http://www.getty.edu/vow/ULANServlet?nation=&english=Y&role=&page=1&find={$formKeywords}', NULL, 1),
(115, 21, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in biology.', 'http://www.liszt.com/dir/?cid=30', 'http://www.liszt.com/search/?search_type=cat&query={$formKeywords}', NULL, 0),
(116, 21, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com/mind/+{$formKeywords}', NULL, 1),
(117, 22, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(118, 22, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&frm=smp.x&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&p00={$formKeywords}', NULL, 1),
(119, 22, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is raning from 19.05 per month to 119.95 per year.', 'http://www.questia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(120, 22, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(121, 23, 'ARTSEDGE', 'ARTSEDGE supports the place of arts education at the center of the curriculum through the creative and appropriate uses of technology. ARTSEDGE helps educators to teach in, through and about the arts.', 'http://artsedge.kennedy-center.org/', 'http://artsedge.kennedy-center.org/search/search_perform.cfm?advanced=false&contentTypes=&artsSubjects=&x=31&y=9&keywords={$formKeywords}', NULL, 0),
(122, 23, 'ArtsEdNet', 'ArtsEdNet, an online service developed by the Getty Education Institute for the Arts, supports the needs of the K-12 arts education community. It focuses on helping arts educators, general classroom teachers using the arts in their curriculum, museum educators, and university', 'http://www.getty.edu/artsednet/home.html', 'http://www.google.com/search?hl=en&btnG=Search&q=site%3Awww.getty.edu%2Feducation%2F+{$formKeywords}', NULL, 1),
(123, 24, 'Arts Journal', 'Arts Journal is a weekday digest of some of the best arts and cultural journalism. Each day Arts Journal combs through more than 100 English-language newspapers, magazines and publications featuring writing about arts and culture. Direct links to the most interesting or important stories are posted every weekday on the Arts Journal news pages. Stories from sites that charge for access are excluded as are sites which require visitors to register, with the exception of the New York Times.', 'http://www.artsjournal.com/', 'http://www.google.com/custom?domains=artsjournal.com&sitesearch=artsjournal.com&sa=GoogleSearch&cof=LW:240;L:http://www.artsjournal.com/img/logo.gif;LH:52;AH:left;S:http://www.artsjournal.com;AWFID:edabed9eb3afda60;&q={$formKeywords}', NULL, 0),
(124, 24, 'Aesthetics On-line', 'In Aesthetics On-line you''ll find articles about aesthetics, philosophy of art, art theory and art criticism, as well as information about aesthetics events worldwide, and links to other aesthetics-related resources on the internet, including the Aesthetics-L email discussion list.', 'http://www.aesthetics-online.org/', 'http://www.aesthetics-online.org/tech/search.cgi?context=Site&terms={$formKeywords}', NULL, 1),
(125, 24, 'Architronic', 'Architronic is a scholarly refereed journal, exploring the new ranges of architectural communication available through digital media. It is a platform for both presenting and reviewing research as a journal, and a forum for stimulating dialogue on emerging ideas.', 'http://architronic.saed.kent.edu/', 'http://www.google.com/search?q=site:architronic.saed.kent.edu+', NULL, 2),
(126, 25, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(127, 25, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(128, 25, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(129, 25, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(130, 25, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(131, 25, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=past30days&submit.x=11&submit.y=12&query={$formKeywords}', NULL, 5),
(132, 25, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(133, 25, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(134, 25, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(135, 25, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 9),
(136, 25, 'The ArchNewsNow', 'The ArchNewsNow (ANN) newsletter, launched in February 2002, is delivered daily to subscribers -- free of charge -- via e-mail by 9:30AM (New York time). It hyperlinks directly to the latest news and commentary gleaned from sources around the world.', 'http://www.archnewsnow.com/', 'http://www.archnewsnow.com/cgi-local/search.pl?Required={$formKeywords}', NULL, 10),
(137, 26, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(138, 26, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(139, 26, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(140, 26, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(141, 27, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(142, 27, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(143, 27, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(144, 27, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(145, 27, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(146, 27, 'AstroLinks', 'AstroLinks provides links that will lead you to a voluminous amount of astronomical data and information.', 'http://www.astro.univie.ac.at/', 'http://www.google.com/search?q=site%3Aastro.univie.ac.at+{$formKeywords}', NULL, 5),
(147, 27, 'Astronomy Resources from STScI', 'Astronomical Internet resources by the Space Telescope Science Institute.', 'http://www.stsci.edu/science/net-resources.html', 'http://www.stsci.edu/resources/WebSearch?uq=&notq=&command=Submit&query={$formKeywords}', NULL, 6),
(148, 27, 'Astrophysics Data System', 'Astrophysics Data System contains abstracts from hundreds of publications, colloquia, symposia, proceedings, and internal NASA reports, and provides free and unrestricted access to scanned images of journals, conference proceedings and books in Astronomy and Astrophysics.', 'http://adsabs.harvard.edu/abstract_service.html', 'http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?db_key=AST&sim_query=YES&aut_xct=NO&aut_logic=OR&obj_logic=OR&object=&start_mon=&start_year=&end_mon=&end_year=&ttl_logic=OR&txt_logic=OR&text=&nr_to_return=100&start_nr=1&start_entry_day=&start_entry_mon=&start_entry_year=&min_score=&jou_pick=ALL&ref_stems=&data_and=ALL&group_and=ALL&sort=SCORE&aut_syn=YES&ttl_syn=YES&txt_syn=YES&aut_wt=1.0&obj_wt=1.0&ttl_wt=0.3&txt_wt=3.0&aut_wgt=YES&obj_wgt=YES&ttl_wgt=YES&txt_wgt=YES&ttl_sco=YES&txt_sco=YES&version=1&title=&author={$formKeywords}', NULL, 7),
(149, 27, 'Fermilab Preprint Server search engine', 'Fermilab Preprint Server search engine maintains a searchable archive of preprints since 1972. Full-text of preprints from 1995 to present are currently available.', 'http://fnalpubs.fnal.gov/preprints.html', 'http://www-spires.fnal.gov/spires/find/hep/wwwscan?subfile=wwwhepau&submit=Browse&rawcmd=', NULL, 8),
(150, 27, 'NASA Technical Reports Server', 'NASA Technical Reports Server allows users to search available online NASA published documents, including meeting presentations, journal articles, conference proceedings, and technical reports. Many documents are available in compressed PostScript and PDF formats. All documents are unclassified and publicly available.', 'http://ntrs.nasa.gov/?method=aboutntrs', 'http://ntrs.nasa.gov/search.jsp?N=0&Ntk=all&Ntx=mode%20matchall&Ntt={$formKeywords}', NULL, 9),
(151, 27, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&src=hw&fulltext=&pubdate_year=&volume=&firstpage=&disp_type=&author1={$formKeywords}', NULL, 10),
(152, 28, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(153, 28, 'Encyclopedia of Astronomy and Astrophysics', 'Encyclopedia of Astronomy and Astrophysics is the most comprehensive reference on astronomy and astrophysics ever published. Comprising more than 2.5 million words, the site provides 24-hour free trial and 30 day free institutional trial.', 'http://www.ency-astro.com/', 'http://eaa.iop.org/index.cfm?action=search.home&quick=1&field1=&newsearch=1&coll=ft&query1={$formKeywords}', NULL, 1),
(154, 28, 'Encyclopedia Astronautica', 'Encyclopedia Astronautica is likely the best source for international space flight information.', 'http://www.astronautix.com/', 'http://www.google.com/custom?sa=Search&cof=L%3Ahttp%3A%2F%2Fwww.astronautix.com%2Fgraphics%2Fl%2Flogo.gif%3BAH%3Acenter%3BGL%3A0%3BAWFID%3A3cf675793eb3c420%3B&sitesearch=www.astronautix.com&domains=www.astronautix.com&q={$formKeywords}', NULL, 2),
(155, 28, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(156, 28, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(157, 28, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(158, 28, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(159, 29, 'AstroLinks', 'AstroLinks provides links that will lead you to a voluminous amount of astronomical data and information.', 'http://www.astro.univie.ac.at/', 'http://www.google.com/search?q=site%3Aastro.univie.ac.at+', NULL, 0),
(160, 29, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(161, 29, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 2),
(162, 29, 'Astronomy Resources from STScI', 'Astronomical Internet resources by the Space Telescope Science Institute.', 'http://www.stsci.edu/science/net-resources.html', 'http://www.stsci.edu/resources/WebSearch?uq=&notq=&command=Submit&query={$formKeywords}', NULL, 3),
(163, 29, 'Astrophysics Data System', 'Astrophysics Data System contains abstracts from hundreds of publications, colloquia, symposia, proceedings, and internal NASA reports, and provides free and unrestricted access to scanned images of journals, conference proceedings and books in Astronomy and Astrophysics.', 'http://adsabs.harvard.edu/abstract_service.html', 'http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?db_key=AST&sim_query=YES&aut_xct=NO&aut_logic=OR&obj_logic=OR&author=&object=&start_mon=&start_year=&end_mon=&end_year=&ttl_logic=OR&txt_logic=OR&text=&nr_to_return=100&start_nr=1&start_entry_day=&start_entry_mon=&start_entry_year=&min_score=&jou_pick=ALL&ref_stems=&data_and=ALL&group_and=ALL&sort=SCORE&aut_syn=YES&ttl_syn=YES&txt_syn=YES&aut_wt=1.0&obj_wt=1.0&ttl_wt=0.3&txt_wt=3.0&aut_wgt=YES&obj_wgt=YES&ttl_wgt=YES&txt_wgt=YES&ttl_sco=YES&txt_sco=YES&version=1&title={$formKeywords}', NULL, 4),
(164, 29, 'Fermilab Preprint Server search engine', 'Fermilab Preprint Server search engine maintains a searchable archive of preprints since 1972. Full-text of preprints from 1995 to present are currently available.', 'http://fnalpubs.fnal.gov/preprints.html', 'http://www-spires.fnal.gov/spires/find/hep/www?AUTHOR=&C=&REPORT-NUM=&AFFILIATION=&cn=&k=&cc=&eprint=+&eprint=&topcit=&url=&J=+&*=&ps=+&DATE=&*=+&FORMAT=WWW&SEQUENCE=&TITLE={$formKeywords}', NULL, 5),
(165, 29, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?author1=&pubdate_year=&volume=&firstpage=&src=hw&hits=10&hitsbrief=25&resourcetype=1&andorexactfulltext=and&fulltext={$formKeywords}', NULL, 6),
(166, 29, 'NASA Technical Reports Server', 'NASA Technical Reports Server allows users to search available online NASA published documents, including meeting presentations, journal articles, conference proceedings, and technical reports. Many documents are available in compressed PostScript and PDF formats. All documents are unclassified and publicly available.', 'http://ntrs.nasa.gov/?method=aboutntrs', 'http://ntrs.nasa.gov/search.jsp?N=0&Ntk=all&Ntx=mode%20matchall&Ntt={$formKeywords}', NULL, 7),
(167, 30, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(168, 30, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(169, 30, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(170, 30, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(171, 31, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(172, 31, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&frm=smp.x&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&p00={$formKeywords}', NULL, 1),
(173, 31, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is raning from 19.05 per month to 119.95 per year.', 'http://www.questia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(174, 31, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(175, 31, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(176, 32, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(177, 33, 'HEASARC', 'HEASARC is a source of gamma-ray, X-ray, and extreme ultraviolet observations of cosmic (non-solar) sources. This site provides access to archival data, associated analysis software, data format standards, documentation, expertise in how to use them, as well as relevant educational and outreach material.', 'http://heasarc.gsfc.nasa.gov/', 'http://heasarc.gsfc.nasa.gov/cgi-bin/search/search.pl?tquery={$formKeywords}', NULL, 0),
(178, 33, 'UK Astronomy Data Centre', 'UK Astronomy Data Centre houses a good selection of data from the UK''s ground based telescopes as well as a number of catalogues.', 'http://archive.ast.cam.ac.uk/', 'http://archive.ast.cam.ac.uk/cgi-bin/wdb/wfsurvey/wfsurvey/query?tab_date_obs=on&date_obs=&tab_utstart=on&utstart=&tab_object=on&object=&tab_runno=on&runno=&tab_fband=on&fband=&tab_fsys=on&fsys=&tab_exposure=on&exposure=&box=00+30+00&tab_ra=on&ra=&tab_dec=on&scionly=on&max_rows_returned=1500&dec={$formKeywords}', NULL, 1),
(179, 34, 'International Astronomy Meetings List', 'International Astronomy Meetings List provides links to the meeting web page, contact e-mail addresses, and abstracts provided by NASA''s Astrophysics Data System (ADS) if, and when they are available.', 'http://cadcwww.dao.nrc.ca/meetings/meetings.html', 'http://cadcwww.dao.nrc.ca/cadcbin/wdb/cadcmisc/meetings/query?tab_meeting_no=on&meeting_no=&tab_title=on&web=&tab_location=on&location=&contact=&email=&address=&tab_date_start=on&date_start=&tab_end_date=on&end_date=&max_rows_returned=10&title=&keywords={$formKeywords}', NULL, 0),
(180, 34, 'Scholarly Societies Project Meeting/Conference Announcement List', 'Scholarly Societies Project Meeting/Conference Announcement List is a searchable service provided by the University of Waterloo (Canada) Scholarly Societies Project.', 'http://www.lib.uwaterloo.ca/society/meetings.html', 'http://ssp-search.uwaterloo.ca/cd.cfm', 'search_type=advanced&field1=any&boolean1=and&operator1=and&field2=any&textfield2=&boolean2=and&operator2=and&field3=any&textfield3=&boolean3=and&operator3=and&founded=none&after=&before=&Go8=Search&textfield1={$formKeywords}', 1),
(181, 35, 'Space Science Education Resource Directory', 'Space Science Education Resource Directory is a convenient way to find NASA space science products for use in classrooms, science museums, planetariums, and other settings.', 'http://teachspacescience.org/cgi-bin/ssrtop.plex', 'http://teachspacescience.org/cgi-bin/search.plex?mode=basic&bgrade=allgrades&btopic=alltopics&submit.x=47&submit.y=14&keywords={$formKeywords}', NULL, 0),
(182, 35, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 1),
(183, 35, 'Space Science Education Home Page -- Goddard Space Flight Center', 'Data from several NASA missions, student activities, teacher resources', 'http://gsfc.nasa.gov/education/education_home.html', 'http://search.nasa.gov/nasasearch/search/search.jsp?nasaInclude={$formKeywords}', NULL, 2),
(184, 36, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(185, 36, 'Government of Canada Publicatons', 'The Government of Canada Publications Web site provides a single window access to free and priced publications authored by Government of Canada departments. The database does not have every publication published from all departments. It does however, have over 100,000 publications listed and this number is increasing on a daily basis as this site continues to collaborate with author departments.', 'http://www.canada.gc.ca/main_e.html', 'http://publications.gc.ca/control/quickPublicSearch?searchAction=2&termValue={$formKeywords}', NULL, 1),
(186, 36, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(187, 36, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(188, 36, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(189, 36, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(190, 36, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(191, 36, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(192, 36, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(193, 37, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(194, 37, 'ASTRONOMY magazine', 'ASTRONOMY magazine, the world''s best selling English magazine, offers visitors a wide variety of information for both hobbyist and armchair astronomers alike.', 'http://www.astronomy.com/home.asp', 'http://www.astronomy.com/asy/default.aspx?c=se&outsideHidden=Yes&searchStr={$formKeywords}', NULL, 1),
(195, 37, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 2),
(196, 37, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 3);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(197, 37, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/search.asp', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 4),
(198, 37, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 5),
(199, 37, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 6),
(200, 38, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(201, 38, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(202, 38, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(203, 38, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(204, 39, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(205, 39, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(206, 39, 'ClinicalTrials.gov', 'ClinicalTrials.gov provides patients, family members, health care professionals, and members of the public, easy and free access to information on clinical studies for a wide range of diseases and conditions.', 'http://www.clinicaltrials.gov/', 'http://www.clinicaltrials.gov/ct/search;jsessionid=6EC2379952077D66434C74BCF3542697?&submit=Search&term={$formKeywords}', NULL, 2),
(207, 39, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(208, 39, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(209, 39, 'Animal Info: Information on Rare, Threatened and Endangered Mammals', 'Animal Info offers information on the biology and ecology of various species as well as current status of rare and endangered mammals. Also provides links to animal interest organizations and publications. Users can search an individual species index by common and scientific name, a species group index and a country index.', 'http://www.animalinfo.org/', 'http://search.atomz.com/search/?sp-a=00081051-sp00000000&sp-q={$formKeywords}', NULL, 5),
(210, 39, 'BioMed Central (Requires Registration)', 'BioMed Central publishes original, peer-reviewed research in all areas of biomedical research, with immediate, barrier-free access for all. BioMed Central is structured into journals, each of which covers a broad area of biology or medicine.', 'http://www.biomedcentral.com/', 'http://www.google.com/search?q=site%3Abiomedcentral.com+{$formKeywords}', NULL, 6),
(211, 39, 'PubMed', 'This is an experimental interface to several databases published by the NLM. Included are Medline and Pre-Medline, Popline, Toxline, GenBank DNA sequences, GenBank Protein Sequences, BioMolecule 3D structures, and Complete Genomes. This resource contains links to the full text of the articles when available.', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 7),
(212, 39, 'PubMed Central: an archive of life science journals', 'PubMed Central is a digital archive of life sciences journal literature managed by the National Center', 'http://www.pubmedcentral.nih.gov/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?search=Search&db=pmc&cmd=search&pmfilter_Fulltext=on&pmfilter_Relevance=on&term={$formKeywords}', NULL, 8),
(213, 40, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(214, 40, 'Life Sciences Dictionary from BioTech', 'Life Sciences Dictionary from BioTech comprises 8,300+ terms relating to biochemistry, biotechnology, botany, cell biology and genetics, as well as selective entries on ecology, limnology, pharmacology, toxicology and medicine.', 'http://biotech.icmb.utexas.edu/search/dict-search.html', 'http://biotech.icmb.utexas.edu/search/dict-search2.html?bo1=AND&search_type=normal&def=&&word={$formKeywords}', NULL, 1),
(215, 40, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(216, 40, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(217, 40, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(218, 40, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(219, 41, 'Animal Info: Information on Rare, Threatened and Endangered Mammals', 'Animal Info offers information on the biology and ecology of various species as well as current status of rare and endangered mammals. Also provides links to animal interest organizations and publications. Users can search an individual species index by common and scientific name, a species group index and a country index.', 'http://www.animalinfo.org/', 'http://search.atomz.com/search/?sp-a=00081051-sp00000000&sp-q={$formKeywords}', NULL, 0),
(220, 41, 'ClinicalTrials.gov', 'ClinicalTrials.gov provides patients, family members, health care professionals, and members of the public, easy and free access to information on clinical studies for a wide range of diseases and conditions.', 'http://www.clinicaltrials.gov/', 'http://www.clinicaltrials.gov/ct/search;jsessionid=6EC2379952077D66434C74BCF3542697?&submit=Search&term={$formKeywords}', NULL, 1),
(221, 41, 'FishBase', 'The FishBase Databases contains information on over 27,000 species, over 76,000 synonyms, 137,930 common names, over 35,000 pictures, and over 30,000 references. Entries include family, order, class, English name, distribution, biology, environment, climate zone, and additional information. Entries also offer a number of links for more specific data such as synonyms, countries, key facts, pictures, FAO areas, spawning, reproduction, predators, diet composition, and more.', 'http://www.fishbase.org/home.htm', 'http://www.fishbase.org/ComNames/CommonNameSearchList.cfm?Crit1_FieldName=COMNAMES.ComName&Crit1_FieldType=CHAR&Crit1_Operator=CONTAINS&CommonName_required=Common name can not be blank&CommonName={$formKeywords}', NULL, 2),
(222, 41, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(223, 41, 'BioMed Central (Requires Registration)', 'BioMed Central publishes original, peer-reviewed research in all areas of biomedical research, with immediate, barrier-free access for all. BioMed Central is structured into journals, each of which covers a broad area of biology or medicine.', 'http://www.biomedcentral.com/', 'http://www.google.com/search?q=site%3Abiomedcentral.com+{$formKeywords}', NULL, 4),
(224, 41, 'MEDLINEplus: health information', 'MEDLINEplus presents up-to-date, quality health care information from the National Library of Medicine at the National Institutes of Health. Both health professionals and consumers can depend on MEDLINEplus for accurate, current medical information. This service provides access to extensive information about specific diseases and conditions and also has links to consumer health information from the National Institutes of Health, dictionaries, news, lists of hospitals and physicians, health information in Spanish and other languages, and clinical trials.', 'http://medlineplus.gov/', 'http://search.nlm.nih.gov/medlineplus/query?DISAMBIGUATION=true&FUNCTION=search&SERVER2=server2&SERVER1=server1&x=25&y=7&PARAMETER={$formKeywords}', NULL, 5),
(225, 41, 'PubMed', 'This is an experimental interface to several databases published by the NLM. Included are Medline and Pre-Medline, Popline, Toxline, GenBank DNA sequences, GenBank Protein Sequences, BioMolecule 3D structures, and Complete Genomes. This resource contains links to the full text of the articles when available.', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(226, 41, 'PubMed Central: an archive of life science journals', 'PubMed Central is a digital archive of life sciences journal literature managed by the National Center', 'http://www.pubmedcentral.nih.gov/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?search=Search&db=pmc&cmd=search&pmfilter_Fulltext=on&pmfilter_Relevance=on&term={$formKeywords}', NULL, 7),
(227, 42, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(228, 42, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(229, 42, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(230, 42, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(231, 43, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(232, 43, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(233, 43, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(234, 43, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(235, 43, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&amp;mode=quicksearch&amp;WISindexid1=WISall&amp;WISsearch1={$formKeywords}', 4),
(236, 44, 'Nature Biotechnology Directory', 'Nature Biotechnology Directory Website, a global information resource listing over 8,000 organizations, product and service providers in the biotechnology industry.', 'http://www.guide.nature.com/', 'http://www.biocompare.com/nature/search.asp?contentid=1&maxrecords=50&search={$formKeywords}', NULL, 0),
(237, 44, 'Scirus', 'Scirus is the most comprehensive science-specific search engine on the Internet. Driven by the latest search engine technology, Scirus searches over 150 million science-specific Web pages.', 'http://www.scirus.com/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 1),
(238, 44, ' National Library of Medicine Gateway', 'NLM Gateway allows users to search in multiple retrieval systems at the U.S. National Library of Medicine (NLM). The current Gateway searches MEDLINE/PubMed, OLDMEDLINE, LOCATORplus, MEDLINEplus, ClinicalTrials.gov, DIRLINE, Meeting Abstracts, and HSRProj. Useful to physicians, researchers, students and the general public for an overall search of NLM''s information resources.', 'http://gateway.nlm.nih.gov/gw/Cmd', 'http://gateway.nlm.nih.gov/gw/Cmd?GM2K_FORM=GMBasicSearch&enterKey=&ORBagentPort=14610&Perform_Search.x=19&Perform_Search.y=13&UserSearchText={$formKeywords}', NULL, 2),
(239, 44, 'BiologyBrowser', 'BiologyBrowser, produced by BIOSIS, is a free web site offering resources for the life sciences information community. An interactive portal designed "to connect life sciences researchers with free, useful resources and other like-minded scientists from all around the world." Includes annotated links to news and life science Web sites, a nomenclatural glossary for zoology, a zoological thesaurus, a forum for biologists and scientists to discuss findings, and more. Searchable.', 'http://www.biologybrowser.org/', 'http://www.biologybrowser.org/cgi-bin/search/hyperseek.cgi?howmuch=ALL&Terms={$formKeywords}', NULL, 3),
(240, 44, 'Bioresearch Online', 'Virtual community for the bioresearch and life sciences industry featuring daily news, product updates, discussion forums, and online chat with information on manufacturing, technology, equipment, supplies, software, and careers.', 'http://www.bioresearchonline.com/', 'http://www.bioresearchonline.com/IndustrySearch/SearchResults.aspx?TabIndex=3&keyword={$formKeywords}', NULL, 4),
(241, 44, 'Biospace', 'BioSpace is a provider of web-based resources and information to the life science industry. For 20 years BioSpace has helped to accelerate communication and discovery among business and scientific leaders in the biopharmaceutical market. With a well-established site infrastructure and loyal online audience of over 1 million unique monthly visitors, BioSpace.com offers an unparalleled distribution channel for recruitment, investment, product, event and other life science industry messages.', 'http://www.biospace.com', 'http://www.google.com/search?q=site:www.biospace.com+{$formKeywords}', NULL, 5),
(242, 45, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in biology.', 'http://www.liszt.com/dir/?cid=191', 'http://www.liszt.com/search/?search_type=cat&query={$formKeywords}', NULL, 0),
(243, 45, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com/mind/+{$formKeywords}', NULL, 1),
(244, 46, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 0),
(245, 47, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(246, 47, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(247, 47, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(248, 47, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(249, 47, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(250, 47, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(251, 47, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(252, 47, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(253, 47, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(254, 48, 'Biospace', 'BioSpace is a provider of web-based resources and information to the life science industry. For 20 years BioSpace has helped to accelerate communication and discovery among business and scientific leaders in the biopharmaceutical market. With a well-established site infrastructure and loyal online audience of over 1 million unique monthly visitors, BioSpace.com offers an unparalleled distribution channel for recruitment, investment, product, event and other life science industry messages.', 'http://www.biospace.com', 'http://www.biospace.com/Default.aspx', 'ctl00$DropDownList1=News&ctl00$TextBox1={$formKeywords}', 0),
(255, 48, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 1),
(256, 48, 'The Scientist', 'The Scientist is the online resource for the printed magazine, The Scientist. Provides access to information useful to those working in or studying the life sciences.', 'http://www.the-scientist.com/', 'http://www.the-scientist.com/search/dosearch/', 'box_type=toolbar&search_restriction=all&order_by=date&search_terms={$formKeywords}', 2),
(257, 48, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 3),
(258, 48, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=TITLE_CHAR&FullText_CHAR={$formKeywords}', NULL, 4),
(259, 48, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 5),
(260, 49, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(261, 49, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(262, 49, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(263, 49, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(264, 50, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(265, 50, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(266, 50, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(267, 50, 'The Corporate Library', 'The Corporate Library is intended to serve as a central repository for research, study and critical thinking about the nature of the modern global corporation, with a special focus on corporate governance and the relationship between company management, their boards and their shareowners. Use this site to retrieve biographies for the companies in the S&P 1500 Supercomposite Index. Screen on a variety of features to identify matching directors (e.g. company name, age, attendance problems, # shares held, etc.) The site also contains research reports on trends in corporate governance.', 'http://www.thecorporatelibrary.com/', 'http://thecorporatelibrary.master.com/texis/master/search/?s=SS&q={$formKeywords}', NULL, 3),
(268, 50, 'Find articles', 'Provides citations, abstracts and fulltext articles for over 300 magazines and journals on topics such as business, health, society, entertainment and sports.', 'http://www.findarticles.com/PI/index.jhtml', 'http://www.findarticles.com/cf_0/PI/search.jhtml?magR=all+magazines&key={$formKeywords}', NULL, 4),
(269, 50, 'Intute: Social Sciences', 'Intute: Social Sciences is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 5),
(270, 50, 'Brint.com', 'Extensive information portal with news, analysis and links related to business, commerce, economics, information technology, and information resources.', 'http://www.brint.com/', 'http://portal.brint.com/cgi-bin/cgsearch/cgsearch.cgi?query={$formKeywords}', NULL, 6),
(271, 51, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(272, 51, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(273, 51, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(274, 51, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(275, 52, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(276, 52, 'Online Dictionary of the Social Sciences', 'Online Dictionary of the Social Sciences is a searchable dictionary of terms commonly used in the social sciences. Both phrase and keyword searches are facilitated.', 'http://bitbucket.icaap.org/', 'http://bitbucket.icaap.org/dict.pl?definition={$formKeywords}', NULL, 1),
(277, 52, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(278, 52, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(279, 52, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(280, 52, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(281, 53, 'The Corporate Library', 'The Corporate Library is intended to serve as a central repository for research, study and critical thinking about the nature of the modern global corporation, with a special focus on corporate governance and the relationship between company management, their boards and their shareowners. Use this site to retrieve biographies for the companies in the S&P 1500 Supercomposite Index. Screen on a variety of features to identify matching directors (e.g. company name, age, attendance problems, # shares held, etc.) The site also contains research reports on trends in corporate governance.', 'http://www.thecorporatelibrary.com/', 'http://thecorporatelibrary.master.com/texis/master/search/?s=SS&q={$formKeywords}', NULL, 0),
(282, 53, 'Find articles', 'Provides citations, abstracts and fulltext articles for over 300 magazines and journals on topics such as business, health, society, entertainment and sports.', 'http://www.findarticles.com/PI/index.jhtml', 'http://www.findarticles.com/cf_0/PI/search.jhtml?magR=all+magazines&key={$formKeywords}', NULL, 1),
(283, 53, 'Intute: Social Sciences', 'Intute: Social Sciences is  a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 2),
(284, 54, 'Brint.com', 'Extensive information portal with news, analysis and links related to business, commerce, economics, information technology, and information resources.', 'http://www.brint.com/', 'http://portal.brint.com/cgi-bin/cgsearch/cgsearch.cgi?query={$formKeywords}', NULL, 0),
(285, 54, 'SMEALSearch', 'SMEALSearch is a publicly available vertical digital library and search engine hosted at Penn State''s Smeal College of Business that focuses on academic business documents. SmealSearch crawls the web and harvests, catalogs, and indexes academic business documents. It is based on the computer and information science engine, CiteSeer, initially developed at NEC Research Institute by Kurt Bollacker, Lee Giles and Steve Lawrence. The search engine crawls websites of academia, commerce, research institutes, government agencies, etc. for academic business documents, including published articles, working papers, white papers, consulting reports, etc. For certain documents, SmealSearch only indexes and stores the hyperlinks to those documents. SMEALSearch generates a citation analysis for all the academic articles harvested and ranks them in order of their citation rates (the most cited articles are listed first) similar to the ranking of CiteSeer and the Google Scholar.', 'http://130.203.133.125/SMEALSearchAbout.html', 'http://130.203.133.125/cs?submit=Search+Documents&q={$formKeywords}', NULL, 1),
(286, 54, 'Roubini Global Economics (RGE) Montor', 'Includes daily economic analysis for individual countries, and information on emerging markets, financial markets, banking, and other topics. Contains original content and links to government and news sources. Searchable.', 'http://www.rgemonitor.com/', 'http://www.rgemonitor.com/?option=com_content&task=search&kwd={$formKeywords}', NULL, 2),
(287, 55, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(288, 55, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(289, 55, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(290, 55, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(291, 56, 'Business Week', 'Business Week''s Web site provides the full text of the current issue, plus selected articles from earlier editions. There is also a searchable archive covering three years of articles from the print magazine, although charges apply for retrieving the full articles. Other features include updated news in the Daily Briefing section and BW Plus!, offering archive articles and other content on such topics as the computer industry, women in business, and business book reviews.', 'http://www.businessweek.com/', 'http://search.businessweek.com/search97cgi/s97_cgi?action=FilterSearch&ServerKey=Primary&filter=bwfilt.hts&command=GetMenu&ResultMaxDocs=500&ResultCount=25&resulttemplate=bwarchiv.hts&querytext={$formKeywords}', NULL, 0),
(292, 56, 'businesswire.com', 'Offers company press releases, searchable by company name, industry, region, or keyword/concept. Each company''s releases are broken down by topic, i.e., earnings, management changes, mergers/acquisitions, products, etc.', 'http://www.businesswire.com/', 'http://home.businesswire.com/portal/site/home/?epi_menuItemID=e23d7f2be635f4725e0fa455c6908a0c&epi_menuID=887566059a3aedb6efaaa9e27a808a0c&epi_baseMenuID=384979e8cc48c441ef0130f5c6908a0c&searchHereRadio=false&ndmHsc=v2*A0*J2*L1*N-1002313*Z{$formKeywords}', NULL, 1);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(293, 56, 'Fortune', 'Fortune magazine''s Web site offers the full text of the print publication back to September 1995, plus links to special features like the Fortune 500, Best Cities for Business, Investor''s Guide, and others.', 'http://www.fortune.com/fortune/', 'http://search.money.cnn.com/pages/search.jsp?Coll=moneymag_xml&QuerySubmit=true&Page=1&LastQuery=&magazine=fort&QueryText={$formKeywords}', NULL, 2),
(294, 56, 'The McKinsey Quarterly', 'The McKinsey Quarterly, a unique print and online publication published by McKinsey & Company, the leading global management consultancy, has long been a trusted source of strategic thinking, industry scenarios, and real-world market analysis.', 'http://www.mckinseyquarterly.com/home.aspx', 'http://www.mckinseyquarterly.com/search_result.aspx', 'search_query={$formKeywords}', 3),
(295, 56, 'Inc.com', 'Inc.com, the website for Inc. magazine, delivers advice, tools, and services, to help business owners and CEOs start, run, and grow their businesses more successfully.  Inc. magazine archives date back to 1988 and are fully searchable. Site also features products, services, and online tools for virtually every business or management task.', 'http://www.inc.com/home/', 'http://www.inc.com/cgi-bin/finder.cgi?query={$formKeywords}', NULL, 4),
(296, 56, 'Business Finance Magazine', 'Trade magazine for finance executives. Subject areas include Budgeting & Reporting; Cost Management; Performance Management; Risk Management; E-Business; Technology & Software; more. Also includes full article archives; Webcasts; Salary Central; an events & vendor directory; Web links; Research Reports; e-Newsletters. Visitors can participate in a regularly updated slate of research projects.', 'http://www.businessfinancemag.com/', 'http://www.businessfinancemag.com/site/search/search.cfm?site=BF&qs={$formKeywords}', NULL, 5),
(297, 57, 'Free EDGAR database of corporate information', 'EDGAR, the Electronic Data Gathering, Analysis, and Retrieval system, performs automated collection, validation, indexing, acceptance, and forwarding of submissions by companies and others who are required by law to file forms with the U.S. Securities and Exchange Commission (SEC).', 'http://sec.freeedgar.com/', 'http://sec.freeedgar.com/resultsCompanies.asp?searchfrom=new&searchtype=name&x=27&y=3&searchvalue={$formKeywords}', NULL, 0),
(298, 57, 'ThomasRegister', '"Free access to: over 168,000 companies; 68,000 product and service categories; thousands of online suppliers catalogs and web site links; over 2 million line items available for secvure online ordering; and, over 1 million downloadable CAD drawings."', 'http://www.thomasregister.com/', 'http://www.thomasnet.com/prodsearch.html?cov=NA&which=prod&navsec=search&what={$formKeywords}', NULL, 1),
(299, 57, 'Microsoft Investor', 'Microsoft''s investor information page -- free. Has links to information on all of the companies that it covers.', 'http://moneycentral.msn.com/investor/home.asp', 'http://moneycentral.msn.com/money.search?q={$formKeywords}', NULL, 2),
(300, 57, 'BPubs.com', 'Business Publications Search Engine', 'http://www.bpubs.com/', 'http://www.bpubs.com/cgi/search.cgi?bool=or&query={$formKeywords}', NULL, 3),
(301, 57, 'Global Edge', 'International business information include Country Insights'' information on all countries, along with extensive links to research resources.', 'http://globaledge.msu.edu/ibrd/ibrd.asp', 'http://globaledge.msu.edu/ibrd/busresmain.asp?search=1&SearchTerms={$formKeywords}', NULL, 4),
(302, 57, 'Bond Markets Online', 'Bond Market Association, association for bond market professionals, provides information and education resources for bond market professionals that underwrite, trade and sell debt securities. Includes policy issues, advocacy, news, research and statistics for bond professionals and investors.', 'http://www.bondmarkets.com/', 'http://www.bondmarkets.com/search/search.pl?nocpp=1&Match=1&Realm=bondmarkets&sort-method=1&Terms={$formKeywords}', NULL, 5),
(303, 57, 'TaxLinks', 'A link and data aggregator focusing on tax payers and tax professionals. Its strength lies in its free databases of IRS Revenue Rulings since 1960 and Revenue Procedures since 1995. TaxLinks links up with tax sites above. Again, the content of the databases may not be totally complete, but they''re free and easily accessible from the home page.', 'http://www.taxlinks.com/', 'http://www.taxlinks.com/_vti_bin/shtml.dll/search.htm', 'VTI-GROUP=0&search={$formKeywords}', 6),
(304, 57, 'Hoover''s Online! Company Info', 'Databases of information on tens of thousands of the largest or fastest-growing public and private U.S. companies. Information provided includes company address, number of employees, key people, financial data, news items and selected Web links to company Web site, SEC filings, and current stock prices. Some information is fee-based, but quite a bit of content is still freely available.', 'http://www.hoovers.com/free/?abforward=true', 'http://www.hoovers.com/free/search/simple/xmillion/index.xhtml?page=1&which=company&query_string={$formKeywords}', NULL, 7),
(305, 58, 'H-Net Humanities and Social Sciences Online', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www.h-net.msu.edu/', 'http://www.h-net.org/logsearch/index.cgi?type=keyword&order=relevance&list=All+lists&hitlimit=25&smonth=00&syear=1989&emonth=11&eyear=2004&phrase={$formKeywords}', NULL, 0),
(306, 58, 'Intute: Social Sciences - Conferences and Events', 'Intute: Social Sciences - Conferences and Events provides search of conferences and events for social sciences.', 'http://www.intute.ac.uk/socialsciences/conferences.html', 'http://www.intute.ac.uk/socialsciences/cgi-bin/conferences.pl?type=All+events&subject=All%7CAll+subjects&submit.x=0&submit.y=0&submit=Go&term={$formKeywords}', NULL, 1),
(307, 58, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in business.', 'http://www.liszt.com/dir/?cid=2', 'http://www.liszt.com/search/?search_type=cat&query={$formKeywords}', NULL, 2),
(308, 58, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+{$formKeywords}', NULL, 3),
(309, 58, 'TechCalendar', 'TechCalendar is a searchable/browseable event directory, with categories such as: Internet/Online, Communications, Software & Services, Vertical Markets, Computing Platforms, and Computing Industry.', 'http://www.techweb.com/calendar/', 'http://www.tsnn.com/partner/results/results_techweb.cfm?city=&select=-1&country=-1&classid=0&Month=-1&subject={$formKeywords}', NULL, 4),
(310, 59, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(311, 59, 'Government of Canada Publicatons', 'The Government of Canada Publications Web site provides a single window access to free and priced publications authored by Government of Canada departments. The database does not have every publication published from all departments. It does however, have over 100,000 publications listed and this number is increasing on a daily basis as this site continues to collaborate with author departments.', 'http://www.canada.gc.ca/main_e.html', 'http://publications.gc.ca/control/quickPublicSearch?searchAction=2&termValue={$formKeywords}', NULL, 1),
(312, 59, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(313, 59, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/searchresults.asp?formname=frmAdvanced&keywordstype=1&month=&year=&pub=1&news=1&links=1&allsubjects=1&alldepts=1&alldoctypes=1&keywords={$formKeywords}', NULL, 3),
(314, 59, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(315, 59, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/engine/search/query.pl?action=FilterSearch&filter=europaflt.hts&Collection=fullEUROPA&ResultTemplate=europarslt_ascii.hts&ResultCount=25&ResultMaxDocs=200&DefaultLG=en&ViewTemplate=europaview.hts&QueryText={$formKeywords}', NULL, 5),
(316, 59, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(317, 59, 'Business.gov', 'Business.gov is  an online resource guide designed to provide legal and regulatory information to America''s small businesses. Entrepreneurs can use this gateway to federal, state and local information in order to quickly define their problems and find solutions on topics ranging from federal advertising laws to local zoning codes. In addition to self-help articles, interactive guides, and the ability to complete transactions on line such as applying for a Federal EIN, the site also connects users with sources of in-person help from government officials, attorneys and business counselors in their local area.', 'http://www.business.gov/', 'http://www.business.gov:80/appmanager/bg/main?_nfpb=true&_windowLabel=T209963971174660224846&_urlType=action&_pageLabel=bg_page_home&siteId=&view=search=fromSearchBox=1&numHitsPerPage=10&query={$formKeywords}', NULL, 7),
(318, 59, 'Organization for Economic Co-operation and Development', 'The OECD groups 30 member countries sharing a commitment to democratic government and the market economy. With active relationships with some 70 other countries, NGOs and civil society, it has a global reach. Best known for its publications and its statistics, its work covers economic and social issues from macroeconomics, to trade, education, development and science and innovation.', 'http://www.oecd.org/', 'http://www.oecd.org/searchResult/0,2665,en_2649_201185_1_1_1_1_1,00.html?fpSearchExact=3&fpSearchText={$formKeywords}', NULL, 8),
(319, 59, 'E-Commerce Information from the European Union', 'Statistics, research, and discussion lists.', 'http://europa.eu.int/information_society/ecowor/ebusiness/index_en.htm', 'http://europa.eu.int/geninfo/query/engine/search/query.pl?action=FilterSearch&filter=europaflt.hts&collection=fullEUROPA&ResultTemplate=europarslt_ascii.hts&ResultCount=25&ResultMaxDocs=200&DefaultLG=en&ViewTemplate=europaview.hts&QueryText={$formKeywords}', NULL, 9),
(320, 59, 'Country Studies: Area Handbook Series', 'From the Library of Congress, this site provides extensive information on foreign countries.  The Country Studies Series presents a description and analysis of the historical setting and the social, economic, political, and national security systems and institutions of countries throughout the world.', 'http://lcweb2.loc.gov/frd/cs/cshome.html', 'http://search.loc.gov:8765/query.html?col=loc&qp=url%3A%2Frr%2Ffrd%2F&submit.x=11&submit.y=9&qt={$formKeywords}', NULL, 10),
(321, 59, 'Strategis', 'This site was developed by Industry Canada and provides a searchable database of Canadian companies, business information for each sector, a list of business support services, and a guide to business laws and regulations.  Trade Data Online provides Canadian and US trade data.', 'http://strategis.ic.gc.ca/engdoc/main.html', 'http://strategis.ic.gc.ca/cio/search-recherche/search.do?language=eng&V_SEARCH.command=search&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.date.modified&searchCriteriaArray%28V_SEARCH__returnedField%29=site_product_code&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.description&searchCriteriaArray%28V_SEARCH__returnedField%29=description&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.type&searchCriteriaArray%28V_SEARCH__returnedField%29=dc.creator&searchCriteriaArray%28V_SEARCH__returnedField%29=vdksummary&searchCriteria%28V_SEARCH__charMap%29=8859&searchCriteria%28V_SEARCH__resultsJSP%29=%2FsiteResults.do&searchCriteria%28V_SEARCH__customSearchJSP%29=%2FcustomSearch.do&searchCriteria%28V_SEARCH__documentJSP%29=%2Fdocument.do&searchCriteria%28V_SEARCH__locale%29=en_CA&searchCriteria%28V_SEARCH__baseURL%29=search.do&searchCriteria%28V_CUSTOM__searchWithin%29=false&searchCriteria%28V_CUSTOM__collection%29=industry&searchCriteria%28V_CUSTOM__details%29=show&searchCriteria%28V_SEARCH__sortSpec%29=score+desc&searchCriteria%28V_CUSTOM__operator%29=AND&searchCriteria%28V_CUSTOM__column%29=FULLTEXT&searchCriteria%28V_CUSTOM__userInput%29={$formKeywords}', NULL, 11),
(322, 59, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www-fed-all&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=5&y=16&mw0={$formKeywords}', NULL, 12),
(323, 59, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 13),
(324, 59, 'THOMAS: Legislative Information on the Internet', 'Through Thomas, the Library of Congress offers the text of bills in the United States Congress, the full text of the Congressional Record, House and Senate committee reports, and historical documents.', 'http://thomas.loc.gov/', 'http://thomas.loc.gov/cgi-bin/thomas', 'congress=109&database=text&MaxDocs=1000&querytype=phrase&Search=SEARCH&query={$formKeywords}', 14),
(325, 60, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(326, 60, 'Businesswire', 'Offers company press releases, searchable by company name, industry, region, or keyword/concept. Each company''s releases are broken down by topic, i.e., earnings, management changes, mergers/acquisitions, products, etc.', 'http://www.businesswire.com/', 'http://home.businesswire.com/portal/site/home/?epi_menuItemID=e23d7f2be635f4725e0fa455c6908a0c&epi_menuID=887566059a3aedb6efaaa9e27a808a0c&epi_baseMenuID=384979e8cc48c441ef0130f5c6908a0c&searchHereRadio=false&ndmHsc=v2*A0*J2*L1*N-1002313*Z{$formKeywords}', NULL, 1),
(327, 60, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 2),
(328, 60, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(329, 60, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 4),
(330, 60, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 5),
(331, 60, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 6),
(332, 60, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 7),
(333, 60, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 8),
(334, 60, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 9),
(335, 60, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 10),
(336, 60, 'CNN Finance', 'Headline financial news and markets: keep up with what''s going on in the world of finance.', 'http://cnnfn.com/', 'http://search.money.cnn.com/pages/search.jsp?QueryText={$formKeywords}', NULL, 11),
(337, 60, 'Nikkei Business Publications Asia', 'Japan BizTech is a source for technology and business news from Japan and Asia developed by Nikkei Business Publications. It covers the latest news and research breakthroughs in the communications, electronics and computer industries in Japan and other Asian countries. An online directory for technology and business contacts throughout Asia in banking, communications, transport equipment and wholesale is available at the site.', 'http://neasia.nikkeibp.com/', 'http://neasia.nikkeibp.com/cgi-bin/search.pl?stype=&lang=eng&b=1&t=1&u=0&alt=1&l=0&default=1&d=0&k=0&au=0&terms={$formKeywords}', NULL, 12),
(338, 61, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(339, 61, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(340, 61, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(341, 61, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(342, 62, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(343, 62, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(344, 62, 'OAIster (Open Archives Initaitive research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(345, 62, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(346, 62, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(347, 62, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'app=allGRAYLIT&INTERFACE=1WINDOW&FORM=/DistributedSearch.html&$$AUTHOR=&$$QTITLE=&$$SUBJECT=&$$ABSTRACT=&$$START_YEAR=&$$END_YEAR=&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&COLLECTION=nepis&MAXDOCS=50&QUERY={$formKeywords}', 5),
(348, 62, 'MEDLINE/PubMed', 'MEDLINE is the National Library of Medicine''s database of\nreferences to more than 11 million articles published in 4300 biomedical\njournals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(349, 63, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(350, 63, 'General Chemistry Online: Glossary', 'Searchable and browsable by topic or letter. Part of General Chemistry Online.', 'http://antoine.frostburg.edu/chem/senese/101/glossary.shtml', 'http://antoine.frostburg.edu/cgi-bin/senese/searchglossary.cgi?shtml=%2Fchem%2Fsenese%2F101%2Fglossary.shtml&query={$formKeywords}', NULL, 1),
(351, 63, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(352, 63, 'NIST Chemistry WebBook', 'This site provides thermochemical, thermophysical, and ion energetics data \ncompiled by NIST under the Standard Reference Data Program.', 'http://webbook.nist.gov/chemistry/', 'http://webbook.nist.gov/cgi/cbook.cgi?Units=SI&Name={$formKeywords}', NULL, 3),
(353, 63, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(354, 63, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(355, 63, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(356, 64, 'chemdex.org', 'Searchable directory of more than 7,000 chemistry related\nsites. Includes general chemistry, organizations, Web portals, biography,\nsoftware, standards, and more. Users may rate and review sites. Some features\nrequire free registration. Based at the Department of Chemistry, University of\nSheffield, England.', 'http://www.chemdex.org/', 'http://www.chemdex.org/action.php?action=search', 'current_cat_id=&table=link&form_input_search_keyword={$formKeywords}', 0),
(357, 64, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(358, 64, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 2),
(359, 64, 'Eric Weisstein''s World of Science--Chemistry', 'Includes extensive encyclopedias of astronomy, chemistry, mathematics, physics, and scientific biography. Entries include definitions, diagrams, formulas, cross-references, and related resources. Searchable, and browsable alphabetically or by topic. Also has a "random entry" feature. The author is a scientist with advanced degrees in physics and planetary science.', 'http://scienceworld.wolfram.com/chemistry/', 'http://scienceworld.wolfram.com/search/index.cgi?sitesearch=scienceworld.wolfram.com%2Fchemistry&q={$formKeywords}', NULL, 3),
(360, 64, 'General Chemistry Online', 'An introduction that includes hyperlinked notes, guides,\nand articles for first semester chemistry. There is a glossary, FAQs and a\ntrivia quiz. The Toolbox provides interactive graphing, a pop-up periodic table,\nand calculators. Additionally, Tutorials contains self-guided tutorials,\nquizzes, and drills on specific topics. There is one database of 800 common\ncompound names, formulas, structures, and properties, and another for over 400\nannotated Web sites. From a chemistry professor at Frostburg State University,\nMaryland. Searchable.', 'http://antoine.frostburg.edu/chem/senese/101/', 'http://marie.frostburg.edu/cgi-bin/htsearch?method=and&config=htdig&restrict=101&exclude=print-&format=builtin-long&sort=score&words={$formKeywords}', NULL, 4),
(361, 64, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 5),
(362, 64, 'MEDLINE/PubMed', 'MEDLINE is the National Library of Medicine''s database of\nreferences to more than 11 million articles published in 4300 biomedical\njournals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(363, 64, 'TOXNET', 'TOXNET provides a searchable collection of databases on toxicology, hazardous chemicals, and related areas.', 'http://toxnet.nlm.nih.gov/', 'http://toxnet.nlm.nih.gov/cgi-bin/sis/search', 'submit2=&amp;basicsearch=/cgi-bin/sis/htmlgen?index.html&revisesearch=/home/httpd/htdocs/index.html&revisesearch=/home/httpd/htdocs/html/index.html&second_search=1&chemsyn=1&database=toxline&database=dart&database=hsdb&database=iris&database=iter&database=genetox&database=ccris&database=tri2003&database=chemid&database=hpd&database=hazmap&Stemming=1&and=1&xfile=1&queryxxx={$formKeywords}', 7),
(364, 65, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(365, 65, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(366, 65, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(367, 65, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(368, 66, 'ChemFinder (Requires Registration)', 'This site enabling searching of the CS database by chemical name, CAS Number, molecular formula, or molecular weight. Also provides links to many chemical information web sites.', 'http://chemfinder.cambridgesoft.com/', 'http://chemfinder.cambridgesoft.com/result.asp?polyQuery={$formKeywords}', NULL, 0),
(369, 66, 'Scirus', 'Scirus is the most comprehensive science-specific search engine on the Internet. Driven by the latest search engine technology, Scirus searches over 150 million science-specific Web pages.', 'http://www.scirus.com/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 1),
(370, 66, 'Chemistry.Org', 'chemistry.org is the online gateway to ACS resources, products, and services for members, chemists, scientists, chemical industry professionals, educators, students, children and science enthusiasts.', 'https://portal.chemistry.org/portal/acs/corg/memberapp', 'http://google.acs.org/search?site=americanchemical&client=americanchemical&proxystylesheet=americanchemical&output=xml_no_dtd&q={$formKeywords}', NULL, 2),
(371, 66, 'Hazardous Chemical Databases', 'This database, created at the University of Akron, will allow the user to retrieve information for any of 23,495 hazardous chemicals or ''generic'' entries based on a keyword search.', 'http://ull.chemistry.uakron.edu/erd/', 'http://ull.chemistry.uakron.edu/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&config=DEFAULT&restrict=&exclude=&words={$formKeywords}', NULL, 3),
(372, 67, 'ChemCenter', 'This is a pooling of Web resources from the American Chemical Society and Chemical Abstracts Service, including STNEasy, the ACS Graduate School Finder, Chemcyclopedia and more. It will eventually feature unique resources as well.', 'http://www.chemistry.org/portal/a/c/s/1/home.html', 'http://google.acs.org/search?by=&site=americanchemical&client=americanchemical&proxystylesheet=americanchemical&output=xml_no_dtd&q={$formKeywords}', NULL, 0),
(373, 68, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(374, 68, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(375, 68, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(376, 68, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(377, 68, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(378, 69, 'chemistry.org Meeting Locator', 'chemistry.org’s Meeting Locator will allow you to find details about meetings, workshops, short courses, and symposia of interest to practitioners of the chemical-related sciences.', 'http://acswebapplications.acs.org/applications/meetinglocator/home.cfm', 'http://google.acs.org/search?site=americanchemical&client=americanchemical&proxystylesheet=americanchemical&output=xml_no_dtd&q=meetings+{$formKeywords}', NULL, 0),
(379, 69, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+', NULL, 1),
(380, 69, 'All Conferences Directory', 'All Conferences Directory is a searchable database of Computer Science and Technology conferences that organizes conferences by category and offers information regarding paper submission deadlines.', 'http://all-conferences.com/Computers/', 'http://www.allconferences.com/Search/output.php?Title={$formKeywords}', NULL, 2),
(381, 70, 'General Chemistry Online', 'An introduction that includes hyperlinked notes, guides,\nand articles for first semester chemistry. There is a glossary, FAQs and a\ntrivia quiz. The Toolbox provides interactive graphing, a pop-up periodic table,\nand calculators. Additionally, Tutorials contains self-guided tutorials,\nquizzes, and drills on specific topics. There is one database of 800 common\ncompound names, formulas, structures, and properties, and another for over 400\nannotated Web sites. From a chemistry professor at Frostburg State University,\nMaryland. Searchable.', 'http://antoine.frostburg.edu/chem/senese/101/', 'http://marie.frostburg.edu/cgi-bin/htsearch?method=and&config=htdig&restrict=101&exclude=print-&format=builtin-long&sort=score&words={$formKeywords}', NULL, 0),
(382, 70, 'Science Learning Network', 'Science Learning Network is a community of educators, students, schools, science museums, and other institutions demonstrating a new model for inquiry into. Contains a variety of inquiry-posed problems, information, demonstrations, and labs.', 'http://www.sln.org/', 'http://192.231.162.154:8080/query.html?col=first&ht=0&qp=&qs=&qc=&pw=600&ws=1&la=&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&si=0&qt={$formKeywords}', NULL, 1),
(383, 70, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 2),
(384, 71, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(385, 71, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as \n\nprovincial, territorial and municipal governments. There is a Departments and Agencies link, and \n\nthe A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which \n\noutlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian \n\nGovernment, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together \n\ninformation from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(386, 71, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(387, 71, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(388, 71, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(389, 71, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(390, 71, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(391, 71, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(392, 71, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(393, 72, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(394, 72, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/news/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 1),
(395, 72, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 2),
(396, 72, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 3),
(397, 72, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 4),
(398, 73, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(399, 73, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(400, 73, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(401, 73, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(402, 74, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(403, 74, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(404, 74, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(405, 74, 'Behavior and Brain Sciences', 'Behavior and Brain Sciences is running on eprints.org open archive software, a freely distributable archive system available from eprints.org.', 'http://www.bbsonline.org/perl/search', 'http://www.bbsonline.org/perl/search?title_abstract_keywords_srchtype=all&authors_srchtype=all&year=&_satisfyall=ALL&_order=order0&submit=Search&.cgifields=publication&title_abstract_keywords=&authors={$formKeywords}', NULL, 3),
(406, 74, 'CogPrints', 'CogPrints is an electronic archive for papers in any area of Psychology, Neuroscience, and Linguistics, and many areas of Computer Science and Biology, which uses the self-archiving software of eprints.org. This archive can be searched by author, title or keyword. Both preprints and published refereed articles are included, with full contact details for each author.', 'http://cogprints.soton.ac.uk/', 'http://cogprints.ecs.soton.ac.uk/perl/search/simple?meta=&meta_merge=ALL&full=&full_merge=ALL&person_merge=ALL&date=&_satisfyall=ALL&_order=bytitle&_action_search=Search&person={$formKeywords}', NULL, 4),
(407, 74, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/lists/freeart.dtl', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&src=hw&fulltext=&pubdate_year=&volume=&firstpage=&disp_type=&author1={$formKeywords}', NULL, 5),
(408, 74, 'Medline', 'MEDLINE is the National Library of Medicine''s database of references to more than 11 million articles published in 4,300 biomedical journals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(409, 75, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(410, 75, 'Dictionary of Philosophy of Mind', 'Dictionary of Philosophy of Mind is a searchable database of peer-reviewed articles on concepts and individuals in the field of philosophy.', 'http://www.artsci.wustl.edu/~philos/MindDict/', 'http://search.yahoo.com/search?vp=dictionary&vs=artsci.wustl.edu&va={$formKeywords}', NULL, 1),
(411, 75, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(412, 75, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(413, 75, 'Wordnet', 'Wordnet is an online lexical reference system whose design is inspired by current psycholinguistic theories of human lexical memory. English nouns, verbs, adjectives and adverbs are organized into synonym sets, each representing one underlying lexical concept. Different relations link the synonym sets.', 'http://www.cogsci.princeton.edu/~wn/', 'http://wordnet.princeton.edu/perl/webwn?sub=Search+WordNet&o2=&o0=1&o7=&o5=&o1=1&o6=&o4=&o3=&h=&s={$formKeywords}', NULL, 4),
(414, 75, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(415, 75, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(416, 76, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(417, 76, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(418, 76, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(419, 76, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(420, 77, 'Stanford Encyclopedia of Philosophy', 'The Stanford Encyclopedia of Philosophy is a dynamic reference work that has been rapidly growing.  The goal of this project is  to produce an authoritative and comprehensive dynamic reference work devoted to the academic discipline of philosophy that will be kept up to date dynamically so as to remain useful to those in academia and the general public.', 'http://plato.stanford.edu/about.html', 'http://plato.stanford.edu/cgi-bin/webglimpse.cgi?ID=1&nonascii=on&maxfiles=50&maxlines=30&maxchars=10000&query={$formKeywords}', NULL, 0),
(421, 77, 'MITECS: The MIT Encyclopedia of the Cognitive Sciences', 'MITECS: The MIT Encyclopedia of the Cognitive Sciences is a free online access to abstracts, bibliographies, and links from this comprehensive reference work. (To read the full-length entries you have to pay.)', 'http://cognet.mit.edu/library/erefs/mitecs/', 'http://gb-server.mit.edu/search?btnG=Search&site=mit&client=mit&proxyreload=1&proxystylesheet=http%3A%2F%2Fcognet.mit.edu%2Fgoogle-mithome.xsl&output=xml_no_dtd&as_dt=i&as_sitesearch=cognet.mit.edu&q={$formKeywords}', NULL, 1),
(422, 78, 'Institut des Sciences Cognitives', 'The National Center for Scientific Research in France promoting study of cognition, especially in humans. Many of the working papers and links to other websites are in English.', 'http://www.isc.cnrs.fr/index_en.htm', 'http://www.google.com/custom?cof=T%3Ablack%3BLW%3A118%3BALC%3Ared%3BL%3Ahttp%3A%2F%2Fwww.isc.cnrs.fr%2Flogoisc.gif%3BLC%3Ablue%3BLH%3A76%3BBGC%3Awhite%3BAH%3Acenter%3BVLC%3Apurple%3BAWFID%3Abbb9fffe574108ac%3B&domains=www.isc.cnrs.fr&sitesearch=www.isc.cnrs.fr&q={$formKeywords}', NULL, 0),
(423, 78, 'The Encyclopedia of Psychology', 'The Encyclopedia of Psychology is intended to facilitate browsing in any area of psychology.', 'http://www.psychology.org/', 'http://www.psychology.org/cgi-bin/links2/search.cgi?query={$formKeywords}', NULL, 1),
(424, 78, 'Enpsychlopedia', 'Enpsychlopedia - Provides a search of psychcentral and several other mental health sites. You can access every time you want Provides a search of psychcentral and several other mental health sites. ', 'http://www.enpsychlopedia.com/', 'http://www.enpsychlopedia.com/index.php?subber=&site=&qq={$formKeywords}', NULL, 2),
(425, 78, 'CogWeb', 'CogWeb is a research tool for exploring the relevance of the study of human cognition to communication and the arts. It is edited by Francis Steen, assistant professor in Communication Studies at UCLA. CogWeb contains several hundred items and is continually under construction.', 'http://cogweb.ucla.edu/', 'http://search.atomz.com/search/?sp-advanced=1&sp-w-control=1&sp-a=00070a1a-sp00000000&sp-c=100&sp-p=any&sp-q={$formKeywords}', NULL, 3),
(426, 78, 'Behavior and Brain Sciences', 'Behavior and Brain Sciences is running on eprints.org open archive software, a freely distributable archive system available from eprints.org.', 'http://www.bbsonline.org/perl/search', 'http://www.bbsonline.org/perl/search?title_abstract_keywords_srchtype=all&authors=&authors_srchtype=all&year=&_satisfyall=ALL&_order=order0&submit=Search&.cgifields=publication&title_abstract_keywords={$formKeywords}', NULL, 4),
(427, 78, 'CogPrints', 'CogPrints is an electronic archive for papers in any area of Psychology, Neuroscience, and Linguistics, and many areas of Computer Science and Biology, which uses the self-archiving software of eprints.org. This archive can be searched by author, title or keyword. Both preprints and published refereed articles are included, with full contact details for each author.', 'http://cogprints.soton.ac.uk/', 'http://cogprints.ecs.soton.ac.uk/perl/search/simple?meta=&meta_merge=ALL&full_merge=ALL&person=&person_merge=ALL&date=&_satisfyall=ALL&_order=bytitle&_action_search=Search&full={$formKeywords}', NULL, 5),
(428, 78, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/lists/freeart.dtl', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&author1=&src=ml&disp_type=&fulltext={$formKeywords}', NULL, 6),
(429, 78, 'Medline', 'MEDLINE is the National Library of Medicine''s database of references to more than 11 million articles published in 4,300 biomedical journals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 7),
(430, 78, 'Psycoloquy', 'An Open Archive of refereed reprints of all target articles, commentaries and responses from Psycoloquy, a peer-reviewed journal of Open Peer Commentary, sponsored by the American Psychological Association, indexed in PsycINFO, and published since 1990 (Archive is complete)', 'http://psycprints.ecs.soton.ac.uk/', 'http://psycprints.ecs.soton.ac.uk/perl/search?_order=bytitle&abstract%2Fkeywords%2Ftitle_srchtype=ALL&_satisfyall=ALL&abstract%2Fkeywords%2Ftitle={$formKeywords}', NULL, 8),
(431, 79, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(432, 79, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(433, 79, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(434, 79, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(435, 79, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(436, 80, 'COGSCI Cognitive Science Discussion List', 'COGSCI Cognitive Science Discussion List is a website for the International Cognitive Science Discussion List.', 'http://cogsci.weenink.com/', 'https://listserv.surfnet.nl/scripts/wa.exe?S2=COGSCI&0=S&s=&f=&a=&I=-3&q={$formKeywords}', NULL, 0),
(437, 80, 'Intute: Social Sciences - Conferences and Events', 'Intute: Social Sciences - Conferences and Events provides search of conferences and events for social sciences.', 'http://www.intute.ac.uk/socialsciences/conferences.html', 'http://www.intute.ac.uk/socialsciences/cgi-bin/conferences.pl?type=All+events&subject=All%7CAll+subjects&submit.x=0&submit.y=0&submit=Go&term={$formKeywords}', NULL, 1),
(438, 80, 'Medical Conferences.com', 'Medical Conferences.com is the Internet''s leading conference portal for medical and health-care professionals along with the associated supporting business community. This searchable database of over 7,000 medical conferences and CME events is an invaluable resource for all healthcare professionals.', 'http://www.medicalconferences.com/', 'http://www.medicalconferences.com/scripts/search_partner.pl?PID=234523&L=&Q_DATE_STARTD=-&Q_DATE_STARTM=-&Q_DATE_STARTY=-&Q_DATE_ENDD=-&Q_DATE_ENDM=-&Q_DATE_ENDY=-&x=4&y=11&&K={$formKeywords}', NULL, 2),
(439, 80, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in Cognitive science.', 'http://www.liszt.com/dir/?cid=1564', 'http://www.liszt.com/search/?search_type=cat&query={$formKeywords}', NULL, 3),
(440, 81, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(441, 82, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 0),
(442, 83, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(443, 83, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. In addition to Department web sites, the government has been creating Portals which bring together \ninformation from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(444, 83, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(445, 83, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(446, 83, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(447, 83, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(448, 83, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(449, 83, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(450, 83, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(451, 84, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(452, 84, 'The Scientist', 'The Scientist is the online resource for the printed magazine, The Scientist, and provides access to information useful to those working in or studying the life sciences.', 'http://www.the-scientist.com/', 'http://www.the-scientist.com/search/dosearch/', 'box_type=toolbar&search_restriction=all&order_by=date&search_terms={$formKeywords}', 1),
(453, 84, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 2),
(454, 84, 'Newsdirectory', 'Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 3),
(455, 85, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(456, 85, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(457, 85, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(458, 85, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(459, 86, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(460, 86, 'Collection of Computer Science Bibliographies', 'Contains about 1,200 bibliographies with over 1 million references, including over 100,000 web links to the full text of the article.', 'http://liinwww.ira.uka.de/bibliography/index.html#about', 'http://liinwww.ira.uka.de/csbib?online=&maxnum=200&sort=year&query={$formKeywords}', NULL, 1),
(461, 86, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(462, 86, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(463, 86, 'NCSTRL', 'NCSTRL is an international collection of computer science research reports and papers made available for non-commercial use from a number of participating institutions and archives. NCSTRL provides access to over 20,000 technical reports in computer science.', 'http://www.ncstrl.org:8900/ncstrl/index.html', 'http://www.ncstrl.org:8900/ncstrl/servlet/search?formname=simple&group=archive&sort=rank&fulltext={$formKeywords}', NULL, 4),
(464, 86, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 5),
(465, 86, 'arXiv.org', 'ArXiv is an e-print service in the fields of physics, mathematics, non-linear science and computer science.', 'http://arxiv.org/', 'http://arxiv.org/search?searchtype=all&query={$formKeywords}', NULL, 6),
(466, 86, 'devx', 'devx provides full text of more than 100,000 indexed and searchable articles, reviews, and more.', 'http://www.devx.com/', 'http://www.google.com/custom?cof=T%3A%23000000%3BLW%3A70%3BBIMG%3Ahttp%3A%2F%2Fwww.devxcom%2Fimages%2Fredesign%2Fbackground2.gif%3BALC%3A%23000099%3BL%3Ahttp%3A%2F%2Fwww.devx.com%2Fimages%2Fredesign%2Fnewlogosm2.gif%3BLC%3A%23000099%3BLH%3A70%3BBGC%3AFAFAE6%3BAH%3Aleft%3BVLC%3A%23000099%3BGL%3A0%3BAWFID%3Aaf259f950e64cb71%3B&domains=devx.com%3Bprojectcool.com%3Bvb2themax.com&sitesearch=devx.com&sa.x=16&sa.y=25&q={$formKeywords}', NULL, 7),
(467, 86, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 8),
(468, 87, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(469, 87, 'Webopedia', 'Webopedia is an online dictionary with definitions of technical terms related to computers and the Internet.', 'http://www.webopedia.com/', 'http://search.internet.com/www.webopedia.com?IC_QueryDatabases=www.webopedia.com&IC_QueryText={$formKeywords}', NULL, 1),
(470, 87, 'WhatIs.com', 'WhatIs.com is an online encyclopedia of information technology terms.', 'http://whatis.techtarget.com/', 'http://whatis.techtarget.com/wsearchResults/1,290214,sid9,00.html?query={$formKeywords}', NULL, 2),
(471, 87, 'Free On-Line Dictionary of Computing', 'FOLDOC is a searchable dictionary of acronyms, jargon, programming languages, tools, architecture, operating systems, networking, theory, conventions, standards, mathematics, telecoms, electronics, institutions, companies, projects, products, and history related to computing.', 'http://foldoc.org/', 'http://foldoc.org/{$formKeywords}', NULL, 3),
(472, 87, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 4),
(473, 87, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language \nword or acronym, and OneLook will search its index of 5,292,362 words in 934 \ndictionaries indexed in general and special interest dictionaries for the \ndefinition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 5),
(474, 87, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 6),
(475, 87, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 7),
(476, 88, 'arXiv.org', 'ArXiv is an e-print service in the fields of physics, mathematics, non-linear science and computer science.', 'http://arxiv.org/', 'http://arxiv.org/search?searchtype=all&query={$formKeywords}', NULL, 0),
(477, 88, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 1),
(478, 88, 'Collection of Computer Science Bibliographies', 'Contains about 1,200 bibliographies with over 1 million references, including over 100,000 web links to the full text of the article.', 'http://liinwww.ira.uka.de/bibliography/index.html#about', 'http://liinwww.ira.uka.de/csbib?online=&maxnum=200&sort=year&query={$formKeywords}', NULL, 2),
(479, 88, 'NCSTRL', 'NCSTRL is an international collection of computer science research reports and papers made available for non-commercial use from a number of participating institutions and archives. NCSTRL provides access to over 20,000 technical reports in computer science.', 'http://www.ncstrl.org:8900/ncstrl/index.html', 'http://www.ncstrl.org:8900/ncstrl/servlet/search?formname=simple&group=archive&sort=rank&fulltext={$formKeywords}', NULL, 3),
(480, 88, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 4),
(481, 88, 'devx', 'devx provides full text of more than 100,000 indexed and searchable articles, reviews, and more.', 'http://www.devx.com/', 'http://www.google.com/custom?cof=T%3A%23000000%3BLW%3A70%3BBIMG%3Ahttp%3A%2F%2Fwww.devxcom%2Fimages%2Fredesign%2Fbackground2.gif%3BALC%3A%23000099%3BL%3Ahttp%3A%2F%2Fwww.devx.com%2Fimages%2Fredesign%2Fnewlogosm2.gif%3BLC%3A%23000099%3BLH%3A70%3BBGC%3AFAFAE6%3BAH%3Aleft%3BVLC%3A%23000099%3BGL%3A0%3BAWFID%3Aaf259f950e64cb71%3B&domains=devx.com%3Bprojectcool.com%3Bvb2themax.com&sitesearch=devx.com&sa.x=16&sa.y=25&q={$formKeywords}', NULL, 5),
(482, 88, 'HCI Bibliography: : Human-Computer Interaction Resources', 'The HCI Bibliography (HCIBIB) is a free-access bibliography on Human-Computer Interaction, with over 28,5000 records in a searchable database.', 'http://www.hcibib.org/', 'http://www.hcibib.org/gs.cgi?highlight=checked&action=Search&terms={$formKeywords}', NULL, 6),
(483, 89, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(484, 89, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(485, 89, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(486, 89, 'O''Reilly Search', 'Search for books, articles, weblogs, conferences, and other resources published or maintained by O''Reilly & Associates, world-renowned publishers.', 'http://www.oreillynet.com/search/', 'http://catsearch.atomz.com/search/catsearch/?sp-a=sp1000a5a9&sp-f=ISO-8859-1&sp-t=cat_search&sp-advanced=1&sp-p=any&sp-d=custom&sp-date-range=-1&sp-q-1=&sp-x-1=collection&sp-c=10&sp-m=1&sp-s=0&sp-q={$formKeywords}', NULL, 3),
(487, 89, 'Safari Tech Books Online', 'O''Reilly''s online technical reference library.', 'http://safari.oreilly.com', 'http://safari.oreilly.com/search?_formName=searchForm&searchlistbox=Entire Site&searchtextbox={$formKeywords}', NULL, 4),
(488, 89, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 5),
(489, 90, 'Collection of Computer Science Bibliographies', 'Collection of Computer Science Bibliographies - A searchable collection of bibliographies from various sources, covering most aspects of computer science. Access references to journal articles, conference papers, & technical reports. The collection currently contains more than 2 millions of references (mostly to journal articles, conference papers and technical reports), clustered in about 1500 bibliographies, and consists of more than 2.3 GBytes (530MB gzipped) of BibTeX entries. More than 600 000 references contain cross references to citing or cited publications. More than 1 million of references contain URLs to an online version of the paper. Abstracts are available for more than 800 000 entries. There are more than 2000 links to other sites carrying bibliographic information.', 'http://liinwww.ira.uka.de/bibliography/index.html', 'http://liinwww.ira.uka.de/mpsbib?field=&year=&sincd=&before=&results=citation&maxnum=40&online=on&query={$formKeywords}', NULL, 0),
(490, 90, 'Engineering E-journal Search Engine (EESE)', 'The Engineering E-journal Search Engine (EESE) searches the full text of over 100 free and full text engineering e-Journals.', 'http://www.eevl.ac.uk/eese/index.html', 'http://www.eevl.ac.uk/eevl-cross-results.htm?tab=all&eevl_sect=eevl&exact=on&method=All&searchst={$formKeywords}', NULL, 1),
(491, 90, 'CompuScience', '"CompuScience" is a bibliographic database covering literature in the field of computer science and computer technology. Dating back to 1936, the database comprises about 656.378 citations.  CompuScience is integrated in io-port.net, the portal for computer science in Germany and Europe.  CompuScience contains the abstracts of the ACM Computing Reviews and the Computer Science Section of Zentralblatt für Mathematik (MATH database) and the abstracts of over 95 selected journals in this area. Citations contain bibliographic information and indexing terms. Many records also include an abstract. Most citations are classified according to the Computing Reviews Classification Scheme of ACM.', 'http://www.fiz-informationsdienste.de/en/DB/compusci/index.html', 'http://www.io-port.net/ioport2004/singlefieldSearch.do?feld1=fulltext&eingabe2=&eingabe3=&eingabe4=&eingabe5=&sortierung=jahr&query=&Abschicken=Suchen&eingabe1={$formKeywords}', NULL, 2);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(492, 91, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(493, 91, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(494, 91, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(495, 91, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(496, 92, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 0),
(497, 93, 'Canadian Patents Database', 'Canadian Patent Database lets you access over 75 years of patent descriptions and images. You can search, retrieve and study more than 1,500,000 patent documents', 'http://patents1.ic.gc.ca/intro-e.html', 'http://patents1.ic.gc.ca/fcgi-bin/patquery_eo_el?-t=_&-l=ibm.html&-m=50&-c=/cpoti/prod/verity/coll/cpd&ERROR_MSG=Query failed with rc =&GENERAL={$formKeywords}', NULL, 0),
(498, 93, 'Europe''s Network of Patent Databases (Esp@cenet)', 'Europe''s Network of Patent Databases (Esp@cenet) is a free service for accessing patent information. Four database files may be searched: (1)European Patents (most recent 24 months, with PDF files); (2) PCT(WO) patents (most recent 24 months, with PDF files); (3) worldwide patents (coverage depends on country, mostly back to 1960s or 1970s); and (4) Japanese patents (1976-present). Since 1970, each patent family in the collection has a representative document with a searchable English-language title and abstract.', 'http://ep.espacenet.com', 'http://v3.espacenet.com/results?AB=fiber&sf=q&FIRST=1&CY=ep&LG=en&DB=EPODOC&st=AB&Submit=SEARCH&=&=&=&=&=&kw={$formKeywords}', NULL, 1),
(499, 93, 'USPTO', 'USPTO databases cover the period from 1 January 1976 to the most recent weekly issue date (usually each Tuesday). Also has the ability to order patents within this system.', 'http://www.uspto.gov/', 'http://patft.uspto.gov/netacgi/nph-Parser?Sect1=PTO2&Sect2=HITOFF&p=1&u=%2Fnetahtml%2Fsearch-bool.html&r=0&f=S&l=50&FIELD1=&co1=AND&TERM2=&FIELD2=&d=ptxt&TERM1={$formKeywords}', NULL, 2),
(500, 94, 'The International Organization for Standardization (ISO)', 'The International Organization for Standardization (ISO) is a worldwide federation of national standards bodies from some 140 countries. ISO''s work has resulted in some 12,000 International Standards, representing more than 300,000 pages in English and French.', 'http://www.iso.ch/iso/en/CatalogueListPage.CatalogueList', 'http://www.iso.ch/iso/en/CombinedQueryResult.CombinedQueryResult?queryString={$formKeywords}', NULL, 0),
(501, 94, 'Request For Comments (RFCs)', 'The Requests for Comments (RFC) document series is a set of technical and organizational notes about the Internet (originally the ARPANET), beginning in 1969. Memos in the RFC series discuss many aspects of computer networking, including protocols, procedures, programs, and concepts, as well as meeting notes, opinions, and sometimes humor.', 'http://www.rfc-editor.org/rfcsearch.html', 'http://www.rfc-editor.org/cgi-bin/rfcsearch.pl?opt=All+Fields&num=25&filefmt=txt&search_doc=search_all&match_method=prefix&sort_method=newer&abstract=absoff&keywords=keyoff&format=ftp&searchwords={$formKeywords}', NULL, 1),
(502, 94, 'XML.com', 'An exhaustive site on all things XML (Extensible Markup Language), from schemas and style to the Semantic Web. Largely oriented toward power users, but includes useful FAQs for newcomers. Searchable. From the O''Reilly & Associates publishing house. ', 'http://www.xml.com/', 'http://search.atomz.com/search/?sp-a=sp1000a5a9&sp-f=ISO-8859-1&sp-t=cat_search&sp-x-1=collection&sp-q-1=xml&sp-q={$formKeywords}', NULL, 2),
(503, 95, 'All Conferences Directory', 'All Conferences Directory is a searchable database of Computer Science and Technology conferences that organizes conferences by category and offers information regarding paper submission deadlines.', 'http://all-conferences.com/Computers/', 'http://www.allconferences.com/Search/search.php3?Search={$formKeywords}', NULL, 0),
(504, 95, 'DB and LP: Conferences and Workshops', 'DB and LP: Conferences and Workshops contains a list of computer science conferences and Workshops: past, present and future.', 'http://www.informatik.uni-trier.de/~ley/db/conf/index.a.html', 'http://www.google.com/search?hl=en&lr=&q=site%3Awww.informatik.uni-trier.de%2F+conf+{$formKeywords}', NULL, 1),
(505, 95, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in computer science.', 'http://www.liszt.com/dir/?cid=3', 'http://www.liszt.com/search/?search_type=cat&query={$formKeywords}', NULL, 2),
(506, 95, 'Netlib Conferences Databases', 'The Netlib Conferences Databases contains information about upcoming conferences, lectures, and other meetings relevant to the fields of mathematics and computer science.', 'http://www.netlib.org/confdb/confsearch.html', 'http://netlib2.cs.utk.edu/cgi-bin/csearch/confdisp.pl?ip_address=160.36.58.108&ip_name=netlib-old.cs.utk.edu&tcp_port=8123&database_name=%2Fusr%2Flocal%2Fwais%2Findexes%2Fconfdb&search_term={$formKeywords}', NULL, 3),
(507, 95, 'TechCalendar', 'TechCalendar is a searchable/browseable event directory, with categories such as: Internet/Online, Communications, Software & Services, Vertical Markets, Computing Platforms, and Computing Industry.', 'http://www.techweb.com/calendar/', 'http://www.tsnn.com/partner/results/results_techweb.cfm?city=&select=-1&country=-1&classid=120&Month=-1&subject={$formKeywords}', NULL, 4),
(508, 96, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(509, 97, 'National Science Digital Library', 'The National Science Digital Library (NSDL) was created by the National Science Foundation to provide organized access to high quality resources and tools that support innovations in teaching and learning at all levels of science, technology, engineering, and mathematics education.', 'http://nsdl.org/about', 'http://nsdl.org/search/?formview=searchresults&verb=Search&s=0&n=10&boost%5B%5D=compoundTitle&boost%5B%5D=compoundDescription&q={$formKeywords}', NULL, 0),
(510, 97, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 1),
(511, 98, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(512, 98, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(513, 98, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(514, 98, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(515, 98, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(516, 98, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(517, 98, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(518, 98, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(519, 98, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(520, 99, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(521, 99, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/news/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 1),
(522, 99, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 2),
(523, 99, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/search.asp', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 3),
(524, 99, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 4),
(525, 99, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 5),
(526, 100, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(527, 100, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(528, 100, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(529, 100, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(530, 101, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(531, 101, 'Intute: Social Sciences', 'Intute is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 1),
(532, 101, 'Intute: Repository Search', 'Use this service to find descriptions from over 152,000 working papers, journal articles, reports, conference papers, and other scholarly items that have been deposited into UK eprints repositories. Search results will link to original items where these have been made available by the originating institution.', 'http://irs.ukoln.ac.uk/', 'http://irs.ukoln.ac.uk/search/?view=&submit.x=0&submit.y=0&submit=Go&query={$formKeywords}', NULL, 2),
(533, 101, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 3),
(534, 101, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(535, 101, 'IDEAc', 'IDEA: the complete RePEc database at your disposal. Working papers, journal articles, software components, author information, directory of institutions.', 'http://ideas.repec.org/', 'http://ideas.repec.org/cgi-bin/htsearch?restrict=http://ideas.repec.org/p/&config=htdig&restrict=&exclude=&sort=score&format=long&method=and&search_algorithm=exact:1&words={$formKeywords}', NULL, 5),
(536, 101, 'World Bank Group Documents & Reports', 'The World Bank Group makes more than 14,000 documents available through the Documents & Reports website. Documents include Project appraisal reports, Economic and Sector Works, Evaluation reports and studies and working papers.', 'http://www-wds.worldbank.org/', 'http://www-wds.worldbank.org/servlet/WDS_IBank_Servlet?all=&stype=AllWords&dname=&rc=&ss=&dt=&dr=range&bdt=&edt=&rno=&lno=&cno=&pid=&tno=&sortby=D&sortcat=D&psz=20&x=34&y=8&ptype=advSrch&pcont=results&auth={$formKeywords}', NULL, 6),
(537, 101, 'NBER', 'NBER (The National Bureau of Economic Research, Inc) is a private, nonprofit, nonpartisan research organization dedicated to promoting a greater understanding of how the economy works. Nearly 500 NBER Working papers are published each year, and many subsequently appear in scholarly journals.', 'http://papers.nber.org/', 'http://papers.nber.org/papers?module=search&action=query&default_conjunction=and&keywords={$formKeywords}', NULL, 7),
(538, 102, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(539, 102, 'Online Glossary of Research Economics', 'An online glossary of terms in research economics.', 'http://econterms.com/', 'http://econterms.com/glossary.cgi?query={$formKeywords}', NULL, 1),
(540, 102, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(541, 102, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(542, 102, 'AmosWeb GLOSS*arama', 'The AmosWEB GLOSS*arama, a glossary for principles students, is a searchable database of 1800 economic terms and concepts.', 'http://amosweb.com/gls/', 'http://amosweb.com/cgi-bin/gls.pl?fcd=dsp&key={$formKeywords}', NULL, 4),
(543, 102, 'Concise Encyclopedia of Economics (CEE)', 'Concise Encyclopedia of Economics (CEE) - tutorials on various economic topics', 'http://www.econlib.org/library/CEE.html', 'http://www.econlib.org/cgi-bin/search.pl?results=0&book=Encyclopedia&andor=and&sensitive=no&query={$formKeywords}', NULL, 5),
(544, 102, 'EH.Net Encyclopedia of Economic and Business History', 'Directed by a distinguished board, articles in this encyclopedia on both business and economic history "are written by experts, screened by a group of authorities, and carefully edited."', 'http://eh.net/encyclopedia/', 'http://eh.net/encyclopedia/search/?Search.x=37&Search.y=10& q={$formKeywords}', NULL, 6),
(545, 102, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 7),
(546, 102, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 8),
(547, 102, 'bizterms.net', 'Bizterms.net provides a comprehensive dictionary of business and financial terms. Start browsing for your financial term, either by search, most popular terms, random term or simply view terms by letter.', 'http://www.bizterms.net', 'http://www.bizterms.net/index.php', 'query={$formKeywords}', 9),
(548, 103, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(549, 103, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(550, 103, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(551, 103, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(552, 104, 'EconPapers', 'EconPapers use the RePEc bibliographic and author data, providing access to the largest collection of online Economics working papers and journal articles.  As of May 2006, there is a total of 375,364 searchable working papers, articles and software items with 273,186 items available on-line. \n\nThe majority of the full text files are freely available, but some (typically journal articles) require that you or your organization subscribe to the service providing the full text file.', 'http://econpapers.repec.org/about.htm', 'http://econpapers.repec.org/scripts/search.asp?ft={$formKeywords}', NULL, 0),
(553, 104, 'NBER', 'NBER (The National Bureau of Economic Research, Inc) is a private, nonprofit, nonpartisan research organization dedicated to promoting a greater understanding of how the economy works. Nearly 500 NBER Working papers are published each year, and many subsequently appear in scholarly journals.', 'http://papers.nber.org/', 'http://papers.nber.org/papers?module=search&action=query&default_conjunction=and&keywords={$formKeywords}', NULL, 1),
(554, 105, 'EDIRC', 'EDIRC: Economics Departments, Institutes and Research Centers in the World currently contains 6,321 institutions in 207 countries and territories.', 'http://edirc.repec.org/', 'http://edirc.repec.org/cgi-bin/search.cgi?boolean=AND&keyword1={$formKeywords}', NULL, 0),
(555, 105, 'Intute: Social Sciences', 'Intute is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 1),
(556, 105, 'Intute: Repository Search', 'Use this service to find descriptions from over 152,000 working papers, journal articles, reports, conference papers, and other scholarly items that have been deposited into UK eprints repositories. Search results will link to original items where these have been made available by the originating institution.', 'http://irs.ukoln.ac.uk/', 'http://irs.ukoln.ac.uk/search/?view=&submit.x=0&submit.y=0&submit=Go&query={$formKeywords}', NULL, 2),
(557, 105, 'World Bank Group Documents & Reports', 'The World Bank Group makes more than 14,000 documents available through the Documents & Reports website. Documents include Project appraisal reports, Economic and Sector Works, Evaluation reports and studies and working papers.', 'http://www-wds.worldbank.org/', 'http://www-wds.worldbank.org/servlet/WDS_IBank_Servlet?stype=AllWords&ptype=sSrch&pcont=results&sortby=D&sortcat=D&x=17&y=3&all={$formKeywords}', NULL, 3),
(558, 106, 'WebEC: World Wide Web Resources in Economics', 'WebEC provides links to a variety of resources on economics. Topics include: economics and teaching; methodology and history; mathematical and quantitative methods; economics and computing; economics data; microeconomics; macroeconomics; international economics; financial economics; public economics; health, education and welfare; labor and demographics; law and economics; industrial organization; business economics; economic history; development, technological change and growth; economic systems; agriculture and natural resources; regional economics; and economics of networks.', 'http://www.helsinki.fi/WebEc/', 'http://www.google.com/search?hl=en&lr=&q=site%3Awww.helsinki.fi%2F WebEc%2F+{$formKeywords}', NULL, 0),
(559, 107, 'Office for National Statistics (UK)', 'National Statistics is the official UK statistics site. You can view and download a wealth of economic and social data free.', 'http://www.statistics.gov.uk/', 'http://www.statistics.gov.uk/CCI/SearchRes.asp?term={$formKeywords}', NULL, 0),
(560, 107, 'Statistics Canada', 'Statistics Canada is the official source for Canadian social and economic statistics and products.', 'http://www.statcan.ca/', 'http://www.statcan.ca:8081/english/clf/query.html?GO%21=GO%21&ht=0&qp=&qs=&qc=0&pw=100%25&la=en&qm=1&st=1&oq=&rq=0&si=0&rf=0&col=alle&qt={$formKeywords}', NULL, 1),
(561, 108, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(562, 108, 'ebrary', 'Independent researchers who do not have access to ebrary_ databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(563, 108, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page.  The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(564, 108, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(565, 109, 'H-Net', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www2.h-net.msu.edu/lists/', 'http://www2.h-net.msu.edu/logsearch/index.cgi?type=keyword&list=All+lists&hitlimit=100&field=&nojg=on&smonth=00&syear=1989&emonth=11&eyear=2004&order=relevance&phrase={$formKeywords}', NULL, 0),
(566, 109, 'Intute: Social Sciences - Conferences and Events', 'Providing search of conferences and events for social sciences.', 'http://www.intute.ac.uk/socialsciences/conferences.html', 'http://www.intute.ac.uk/socialsciences/cgi-bin/conferences.pl?type=All+events&subject=All%7CAll+subjects&submit.x=0&submit.y=0&submit=Go&term={$formKeywords}', NULL, 1),
(567, 109, 'INOMICS', 'INOMICS provides searches in indexes of other Web pages related to Economics.', 'http://www.conference-board.org/', 'http://www.conference-board.org/cgi-bin/MsmFind.exe?AND_ON=N&ALLCATS=X&AGE_WGT=0&EN=X&ES=X&NO_DL=X&x=57&y=11&QUERY={$formKeywords}', NULL, 2),
(568, 110, 'Tutor 2U Economics', 'Tutor 2U Economics includes study resources, revision guides, relevant links, an updated dataroom, and a discussion forum.', 'http://www.tutor2u.com/', 'http://www.tutor2u.net/search.asp?func=search&tree=0&submit=Search+Tutor2u&myquery={$formKeywords}', NULL, 0),
(569, 110, 'biz/ed', 'Business Education on the Internet (biz/ed) is a free information service available via the World-Wide Web which allows users to search and retrieve targeted information about business and economics held on computers around the world. The service offers a one-stop information gateway for the one million economics, business and management students and staff as well as the general public in the UK and overseas.', 'http://www.bized.co.uk/', 'http://www.bized.co.uk/cgi-bin/htsearch?config=htdig&method=and&sort=score&format=builtin-long&restrict=&exclude=&words={$formKeywords}', NULL, 1),
(570, 110, 'EcEdWeb', 'Economic Education Website: The purpose of the Economic Education Website is to provide support for economic education in all forms and at all levels.', 'http://ecedweb.unomaha.edu/search.cfm', 'http://www.google.com/u/ecedweb?q={$formKeywords}', NULL, 2),
(571, 111, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(572, 111, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(573, 111, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(574, 111, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(575, 111, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(576, 111, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(577, 111, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(578, 111, 'The OECD (Organisation for Economic Co-operation and Development)', 'The OECD groups 30 member countries sharing a commitment to democratic government and the market economy. With active relationships with some 70 other countries, NGOs and civil society, it has a global reach. Best known for its publications and its statistics, its work covers economic and social issues from macroeconomics, to trade, education, development and science and innovation.', 'http://www.oecd.org/home/', 'http://www.oecd.org/searchResult/0,2665,en_2649_201185_1_1_1_1_1,00.html?fpSearchExact=3&fpSearchText={$formKeywords}', NULL, 7),
(579, 111, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 8),
(580, 111, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 9),
(581, 112, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(582, 112, 'The Economist', 'The Economist is the online version of the famous magazine with articles and a searchable archive.', 'http://www.economist.com/', 'http://www.economist.com/search/search.cfm?cb=46&area=1&page=index&keywords=1&frommonth=01&fromyear=1997&tomonth=02&toyear=2002&rv=2&qr={$formKeywords}', NULL, 1),
(583, 112, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(584, 112, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 3),
(585, 112, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 4),
(586, 112, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 5),
(587, 112, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 6),
(588, 112, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 7),
(589, 112, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 8),
(590, 112, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 9),
(591, 112, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 10),
(592, 113, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(593, 113, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(594, 113, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(595, 113, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(596, 114, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(597, 114, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://www.oaister.org/', 'http://quod.lib.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&rgn1=entire+record&rgn2=entire+record&rgn3=entire+record&c=oaister&sid=f4f5644c4d1d4282010da7f16b531fb9&searchfield=Entire+Record&op2=And&searchfield=Entire+Record&q2=&op3=And&searchfield=Entire+Record&q3=&op6=And&rgn6=norm&restype=all+types&sort=title&submit2=search&q1={$formKeywords}', NULL, 1),
(598, 114, 'SearchERIC', 'Tools to search the abstracts and Digests produced by the ERICSM system.', 'http://www.eric.ed.gov/', 'http://www.google.com/custom?domains=www.eric.ed.gov&sa=Google+Search&sitesearch=www.eric.ed.gov&q={$formKeywords}', NULL, 2),
(599, 114, 'ERIC - Education Resources Information Center', 'ERIC - the Education Resources Information Center - is an internet-based digital library of education research and information sponsored by the Institute of Education Sciences (IES) of the U.S. Department of Education. \n\nERIC provides access to bibliographic records of journal and non-journal literature indexed from 1966 to the present. \n\nThe ERIC collection includes bibliographic records (citations, abstracts, and other pertinent data) for more than 1.2 million items indexed since 1966, including journal articles, books,  research syntheses, conference papers, technical reports, \npolicy papers, and other education-related materials.\n\nERIC currently indexes more than 600 journals, the majority of which are indexed comprehensively — every article in each issue is included in ERIC. Some journals are indexed selectively — only those articles that are education-related are selected for indexing. \n\nIn addition, contributors have given ERIC permission to display more than 115,000 full-text materials in PDF format - at no charge. These materials are generally part of the recent "grey literature" such as conference papers and reports, rather than journal articles and books. Most materials published 2004 and forward include links to other sources, including publishers'' Web sites.', 'http://eric.ed.gov/', 'http://eric.ed.gov/ERICWebPortal/Home.portal?_nfpb=true&ERICExtSearch_Operator_2=and&ERICExtSearch_SearchType_0=au&ERICExtSearch_SearchValue_2=&ERICExtSearch_SearchValue_1=&ERICExtSearch_Operator_1=and&ERICExtSearch_SearchType_1=kw&ERICExtSearch_PubDate_To=2006&ERICExtSearch_SearchType_2=kw&ERICExtSearch_SearchCount=2&ERICExtSearch_PubDate_From=0&_pageLabel=ERICSearchResult&newSearch=true&rnd=1137305171346&searchtype=advanced&ERICExtSearch_SearchValue_0={$formKeywords}', NULL, 3),
(600, 114, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(601, 114, 'Education-Line: Electronic Texts in Education and Training', 'Education-Line: Electronic Texts in Education and Training (UK) is a searchable "electronic archive of ''gray'' (report, conference, working paper) and ''pre-print'' literature in the field of education and training." Provided by the British Education Index (BEI), this database provides access to over 1,000 papers presented at British research conferences and elsewhere. Provides links to searchable paper files from conferences sponsored by the British Educational Research Association, the European Conference on Educational Research, and others.', 'http://www.leeds.ac.uk/educol/', 'http://brs.leeds.ac.uk/cgi-bin/brs_engine?*ID=1&*DB=BEID&*PT=50&*FT=BEID&*HI=Y&TITL=&SUBJ=&*SO=TITL&SUBMIT_BUTTON=search%20button&*QQ=&AUTH={$formKeywords}', NULL, 5),
(602, 115, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(603, 115, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 1),
(604, 115, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 2),
(605, 115, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 3),
(606, 115, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 4),
(607, 116, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(608, 116, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(609, 116, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://67.118.51.201/bol/KeyWordSearch.cfm', 'RowCount=50&Searchquery={$formKeywords}', 2),
(610, 116, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(611, 117, 'Advancing Women in Leadership Journal [USA]', 'Advancing Women in Leadership represents the first on-line professional, refereed journal for women in leadership. The journal publishes manuscripts that report, synthesize, review, or analyze scholarly inquiry that focuses on women''s issues.', 'http://www.advancingwomen.com/awl/awl.html', 'http://www.google.com/search?&q=site%3Awww.advancingwomen.com+{$formKeywords}', NULL, 0),
(612, 117, 'Educause Review [USA]', 'EDUCAUSE Review is the general-interest, bimonthly magazine published by EDUCAUSE. The magazine takes a broad look at current developments and trends in information technology, what these mean for higher education, and how they may affect the college/university as a whole.', 'http://www.educause.edu/apps/er/index.asp', 'http://www.educause.edu/SearchResults/706?app=krc&output=xml_no_dtd&restrict=WWW_EDUCAUSE_EDU&client=my_collection&site=my_collection&getfields=*&filter=0&opid=644&app_section=&submit=Search&top_tax_id=&PRIMARYPUBS=&Control=&CARNEGIE=&FTE=&q={$formKeywords}', NULL, 1),
(613, 117, 'Teachers College Record [USA]', 'A peer-reviewed journal offering full-text articles from 1980-present. Thematic content collections, discussion groups, online learning modules, and book reviews.', 'http://www.tcrecord.org/About.asp', 'http://www.tcrecord.org/search.asp?x=34&y=18&kw={$formKeywords}', NULL, 2),
(614, 117, 'The Australian Electronic Journal of Nursing Education [Australia]', 'The AEJNE is committed to enhancing the teaching learning experience across a variety of nurse contexts. The journal will be a means by which nurses can share findings, insights, experience and advice to colleagues involved in all aspects of the educational process.', 'http://www.scu.edu.au/schools/nhcp/aejne/', 'http://www.scu.edu.au/cgi/htsearch/?submit=Search&method=boolean&format=builtin-short&words={$formKeywords}', NULL, 3),
(615, 117, 'Bilingual Research Journal [USA]', 'A peer-reviewed scholarly journal publishing research on bilingual education.', 'http://brj.asu.edu/', 'http://brj.asu.edu.master.com/texis/master/search/?s=SS&notq=&prox=&sufs=0&rorder=&rprox=&rdfreq=&rwfreq=&rlead=&q={$formKeywords}', NULL, 4),
(616, 117, 'Current Issues in Education [USA]', 'Current Issues in Comparative Education (CICE) is an online journal based at Teachers College, Columbia University, that publishes scholarly work from a variety of academic disciplines. CICE seeks clear and significant contributions that further debate on educational policies and comparative studies.', 'http://cie.ed.asu.edu/', 'http://www.google.com/search?q=site%3Acie.asu.edu+{$formKeywords}', NULL, 5),
(617, 117, 'Education-line [UK]', 'Education-line is a freely accessible database of the full text of conference papers, working papers and electronic literature which supports educational research, policy and practice.', 'http://www.leeds.ac.uk/educol/', 'http://brs.leeds.ac.uk/cgi-bin/brs_engine?*ID=1&*DB=BEID&*PT=50&*FT=BEID&*HI=Y&TITL=&AUTH=&SUBJ=&*SO=TITL&SUBMIT_BUTTON=search%20button&*QQ={$formKeywords}', NULL, 6),
(618, 117, 'Education Policy Analysis Archives [USA & Mexico]', 'A peer-reviewed scholarly electronic journal publishing education policy analysis since 1993.', 'http://epaa.asu.edu/', 'http://epaa.asu.edu/cgi-bin/htsearch?method=boolean&format=builtin-long&sort=score&config=epaa.asu.edu&restrict=&exclude=&words={$formKeywords}', NULL, 7),
(619, 117, 'Educational Insights: Electronic Journal of Graduate Student Research [Canada]', 'Educational Insights is an innovative evocative provocative intertextual space for engaging in new dialogues of enRapturing con/texts and reimagined spaces of pedagogy, inquiry, and interdisciplinarity. Our intent is to encourage a community that honours difference and polyphony, while sharing a vision of pedagogy, education, inquiry as spaces of challenge and hopeful conversations.', 'http://ccfi.educ.ubc.ca/publication/insights/v09n02/us/index.html', 'http://sitelevel.whatuseek.com/query.go?B1=Search&crid=140f069465cde402&query={$formKeywords}', NULL, 8),
(620, 117, 'Educational Technology and Society [USA]', 'Educational Technology & Society seeks academic articles on the issues affecting the developers of educational systems and educators who implement and manage such systems.', 'http://www.ifets.info/index.php?http://www.ifets.info/aim.php', 'http://odysseus.ieee.org/query.html?col=wg&qp=url%3Aifets.ieee.org%2Fperiodical&qs=&qc=wg&ws=0&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&qt={$formKeywords}', NULL, 9),
(621, 117, 'First Monday [USA]', 'First Monday is one of the first peer-reviewed journals on the Internet, offering critical analysis of the Internet.', 'http://www.firstmonday.org/idea.html', 'http://www.firstmonday.org/fm.search?numdocs=20&query={$formKeywords}', NULL, 10),
(622, 117, 'Global Journal of Engineering Education [Australia]', 'Global Journal of Engineering Education (GJEE), providing the international engineering education community with a forum for discussion and the exchange of information on engineering education and industrial training at tertiary level.', 'http://www.eng.monash.edu.au/uicee/gjee/globalj.htm', 'http://ultraseek.its.monash.edu.au/query.html?rq=0&col=m0&qp=&qs=+AND+url%3Ahttp%3A%2F%2Fwww.eng.monash.edu.au%2Fuicee%2Fgjee&qc=&pw=100%25&ws=1&la=&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&qt={$formKeywords}', NULL, 11),
(623, 117, 'Journal of American Indian Education [USA]', 'The Journal of American Indian Education is a peer reviewed scholarly journal, which publishes papers specifically related to the education of American Indians and Alaska Natives. While the focus of the Journal is on basic applied research, manuscripts that are expository in nature and present an explicative or interpretive perspective are considered for publication as well. JAIE is particularly interested in publishing manuscripts that express the viewpoint of AI/AN and research that is initiated, conducted, and interpreted by natives.', 'http://jaie.asu.edu/', 'http://www.google.com/u/arizonastate?sa=Search&domains=jaie.asu.edu&sitesearch=jaie.asu.edu&hq=inurl%3Ajaie.asu.edu&q={$formKeywords}', NULL, 12),
(624, 117, 'Journal of Vocational and Technical Education [USA]', 'The Journal of Vocational and Technical Education (JVTE) is a non-profit, refereed national publication of Omicron Tau Theta, the national, graduate honorary society of vocational and technical education.', 'http://scholar.lib.vt.edu/ejournals/JVTE/', 'http://scholar.lib.vt.edu:8765/query.html?rq=0&qp=url%3Ahttp%3A%2F%2Fscholar.lib.vt.edu%2Fejournals%2F&col=ejournal&qp=&qs=&qc=&pw=100%25&ws=0&la=&qm=0&st=1&nh=10&lk=1&rf=0&oq=&rq=0&qt={$formKeywords}', NULL, 13),
(625, 117, 'Kairos: A Journal for Teachers of Writing in Webbed Environments [USA]', 'Kairos is a refereed online journal exploring the intersections of rhetoric, technology, and pedagogy.', 'http://english.ttu.edu/kairos/', 'http://www.google.com/u/Kairos?hq=inurl%3Aenglish.ttu.edu%2Fkairos&btnG=Search+Kairos&q={$formKeywords}', NULL, 14),
(626, 117, 'Language, Learning, and Technology [USA]', 'Online journal devoted to technology and language education research for foreign and second language.', 'http://llt.msu.edu/', 'http://www.google.com/u/llt?q={$formKeywords}', NULL, 15),
(627, 117, 'Medical Education Online: An Electronic Journal [USA]', 'Medical Education Online (MEO) is a forum for disseminating information on educating physicians and other health professionals. Manuscripts on any aspect of the process of training health professionals will be considered for peer-reviewed publication in an electronic journal format. In addition MEO provides a repository for resources such as curricula, data sets, syllabi, software, and instructional material developers wish to make available to the health education community.', 'http://www.med-ed-online.org/', 'http://www.google.com/search?&q=site%3Awww.med-ed-online.org+{$formKeywords}', NULL, 16),
(628, 117, 'National CROSSTALK, The National Center for Public Policy and Higher Education [USA]', 'The Center publishes the National CROSSTALK to provide action-oriented analyses of state and federal policies affecting education beyond high school.', 'http://www.highereducation.org/crosstalk/index.html', 'http://www.google.com/search?&q=site%3Awww.highereducation.org%2Fcrosstalk%2F+{$formKeywords}', NULL, 17),
(629, 117, 'Philosophy of Education: Yearbook of the Philosophy of Education Society [USA]', 'Annual collections of some of the best work in the field of Educational Philosophy.', 'http://www.ed.uiuc.edu/EPS/PES-Yearbook/', 'http://www.googlesyndicatedsearch.com/u/pesyearbook?h1=en&hq=inurl%3Awww.ed.uiuc.edu%2Feps%2Fpes-yearbook&btnG=go&q={$formKeywords}', NULL, 18),
(630, 117, 'Practical Assessment, Research and Evaluation [USA]', 'Practical Assessment, Research and Evaluation (PARE) is an on-line journal published by the edresearch.org and the Department of Measurement, Statistics, and Evaluation at the University of Maryland, College Park. Its purpose is to provide education professionals access to refereed articles that can have a positive impact on assessment, research, evaluation, and teaching practice, especially at the local education agency (LEA) level.', 'http://pareonline.net/', 'http://www.google.com/custom?domains=pareonline.net%2Fgetvn.asp&sa=Google+Search&sitesearch=pareonline.net%2Fgetvn.asp&client=pub-8146434030680546&forid=1&channel=9117733086&ie=ISO-8859-1&oe=ISO-8859-1&flav=0000&sig=cmg6qt6VP1GSt2jo&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFDD%3BLBGC%3AFFFFDD%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A50%3BLW%3A341%3BL%3Ahttp%3A%2F%2Fpareonline.net%2Fprac3.gif%3BS%3Ahttp%3A%2F%2F%3BFORID%3A1%3B&hl=en&q={$formKeywords}', NULL, 19),
(631, 117, 'The Qualitative Report [USA]', 'The Qualitative Report (ISSN 1052-0147) is a peer-reviewed, on-line journal devoted to writing and discussion of and about qualitative, critical, action, and collaborative inquiry and research.', 'http://www.nova.edu/ssss/QR/index.html', 'http://www.nova.edu/bin/QR.pl?Search+Criteria={$formKeywords}', NULL, 20),
(632, 117, 'Reading Online: An Electronic Journal of the International Reading Association [USA]', 'A journal for literacy educators K-12; includes articles, commentaries, reviews, and discussion forums.', 'http://www.readingonline.org/', 'http://www.readingonline.org/search/search.asp?QueryForm=&sc=articles&sm=all&qu={$formKeywords}', NULL, 21),
(633, 117, 'Teaching English as a Second Language [USA]', 'TESL-EJ, Teaching English as a Second Language Electronic Journal, is a fully-refereed academic journal for the English as a Second Language, English as a Foreign Language.', 'http://www-writing.berkeley.edu/TESL-EJ/', 'http://www.google.com/u/berkeleywriting?sa=Google+Search&domains=www-writing.berkeley.edu%2FTESL-EJ%2F&sitesearch=www-writing.berkeley.edu&q={$formKeywords}', NULL, 22),
(634, 118, 'Education Theory', 'Educational Theory is a quarterly journal of philosophy of education and related disciplines.', 'http://www.ed.uiuc.edu/EPS/Educational-Theory/', 'http://www.google.com/search?&q=site%3Awww.ed.uiuc.edu%2FEPS%2FEducational-Theory %2F+{$formKeywords}', NULL, 0),
(635, 119, 'Education Research', 'RAND posts reports of its public policy research on education topics. Issues such as K-12 assessment and accountability, school reform, teachers and teaching, higher education, military education and training, and worker training are addressed.', 'http://www.rand.org/research_areas/education/', 'http://vivisimo.rand.org/vivisimo/cgi-bin/query-meta?v%3Aproject=pubs&input-form=simple&Go=Search&query={$formKeywords}', NULL, 0),
(636, 119, 'ERIC Digests', 'ERIC Digests include:  \n\n- short reports (1,000 - 1,500 words) on topics of prime current interest in education. There are a large variety of topics covered including teaching, learning, libraries, charter schools, special education, higher education, home schooling, and many more. \n\n- targeted specifically for teachers, administrators, policymakers, and other practitioners, but generally useful to the broad educational community.  \n\n- designed to provide an overview of information on a given topic, plus references to items providing more detailed information.  \n\n- produced by the former 16 subject-specialized ERIC Clearinghouses, and reviewed by experts and content specialists in the field.  \n\n- funded by the Office of Educational Research and Improvement (OERI), of the U.S. Department of Education (ED).  \n\n- The full-text ERIC Digest database contains over 3000 Digests with the latest updates being added to this site in July 2005.', 'http://www.ericdigests.org/', 'http://www.google.com/custom?domains=ericdigests.org&sitesearch=ericdigests.org&q={$formKeywords}', NULL, 1),
(637, 119, 'ED Pubs Online Ordering System', 'ED Pubs Online Ordering System is intended to help users identify and order U.S. Department of Education products. All publications are provided at no cost to the general public by the U.S. Department of Education. ', 'http://www.edpubs.org/webstore/Content/search.asp', 'http://www.edpubs.org/webstore/EdSearch/SearchResults.asp?Search=True&CQQUERYTYPE=2&CQFULLTEXT={$formKeywords}', NULL, 2),
(638, 119, 'Education-Line: Electronic Texts in Education and Training', 'Education-Line: Electronic Texts in Education and Training (UK) is a searchable "electronic archive of ''gray'' (report, conference, working paper) and ''pre-print'' literature in the field of education and training." Provided by the British Education Index (BEI), this database provides access to over 1,000 papers presented at British research conferences and elsewhere. Provides links to searchable paper files from conferences sponsored by the British Educational Research Association, the European Conference on Educational Research, and others.', 'http://www.leeds.ac.uk/educol/', 'http://brs.leeds.ac.uk/cgi-bin/brs_engine?*ID=1&*DB=BEID&*PT=50&*FT=BEID&*HI=Y&TITL=&AUTH=&SUBJ=&*SO=TITL&SUBMIT_BUTTON=search%20button&*QQ={$formKeywords}', NULL, 3),
(639, 119, 'SearchERIC', 'Tools to search the abstracts and Digests produced by the ERICSM system.', 'http://www.eric.ed.gov/', 'http://www.google.com/custom?domains=www.eric.ed.gov&sa=Google+Search&sitesearch=www.eric.ed.gov&q={$formKeywords}', NULL, 4),
(640, 119, 'ERIC - Education Resources Information Center', 'ERIC - the Education Resources Information Center - is an internet-based digital library of education research and information sponsored by the Institute of Education Sciences (IES) of the U.S. Department of Education. \n\nERIC provides access to bibliographic records of journal and non-journal literature indexed from 1966 to the present. \n\nThe ERIC collection includes bibliographic records (citations, abstracts, and other pertinent data) for more than 1.2 million items indexed since 1966, including journal articles, books,  research syntheses, conference papers, technical reports, \npolicy papers, and other education-related materials.\n\nERIC currently indexes more than 600 journals, the majority of which are indexed comprehensively — every article in each issue is included in ERIC. Some journals are indexed selectively — only those articles that are education-related are selected for indexing. \n\nIn addition, contributors have given ERIC permission to display more than 115,000 full-text materials in PDF format - at no charge. These materials are generally part of the recent "grey literature" such as conference papers and reports, rather than journal articles and books. Most materials published 2004 and forward include links to other sources, including publishers'' Web sites.', 'http://eric.ed.gov/', 'http://eric.ed.gov/ERICWebPortal/Home.portal?_nfpb=true&ERICExtSearch_SearchType_0=kw&_pageLabel=ERICSearchResult&newSearch=true&rnd=1189800475852&searchtype=keyword&ERICExtSearch_SearchValue_0={$formKeywords}', NULL, 5),
(641, 119, 'Education Review (ER)', 'Education Review publishes reviews of recent books in education, covering the entire range of education scholarship and practice.', 'http://edrev.asu.edu/index.html', 'http://edrev.asu.edu/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&config=edrev.asu.edu&restrict=&exclude=&words={$formKeywords}', NULL, 6),
(642, 120, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingentaconnect.com/', 'http://www.ingentaconnect.com/search?form_name=advanced&title_type=tka&author=&journal=&journal_type=words&volume=&issue=&database=1&year_from=2002&year_to=2007&pageSize=20&x=42&y=13&title={$formKeywords}', NULL, 0),
(643, 120, 'ebrary', 'Independent researchers who do not have access to ebrary''s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(644, 120, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(645, 120, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(646, 121, 'H-Net, Humanities & Social Sciences Online', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www2.h-net.msu.edu/lists/', 'http://www2.h-net.msu.edu/logsearch/index.cgi?type=boolean&hitlimit=25&field=&nojg=on&smonth=00&syear=1989&emonth=11&eyear=2004&order=relevance&phrase={$formKeywords}', NULL, 0),
(647, 121, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in education.', 'http://www.liszt.com/dir/?cid=0', 'http://www.liszt.com/search/?search_type=cat&query={$formKeywords}', NULL, 1),
(648, 121, 'JISCmail', 'The National Academic Mailing List Service, known as ''JISCmail'', is one of a number of JANET services provided by JANET(UK) (www.ja.net) and funded by the JISC (www.jisc.ac.uk) to benefit learning, teaching and research communities. The Science and Technology Facilities Council (www.scitech.ac.uk) currently operates and develops the JISCmail service on behalf of JANET(UK).', 'http://www.jiscmail.ac.uk/index.htm', 'http://www.jiscmail.ac.uk/cgi-bin/listsearcher.cgi?', 'chk_wds=chk_wds&opt=listsearcher&thecriteria={$formKeywords}', 2),
(649, 122, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(650, 123, 'BBC Learning', 'BBC Online - Education BBC Education. Access to excellent learning resources for adults and children. Lots of subjects - history, science, languages, health, work skills, culture, technology, arts, literature, business, nature, life, leisure.', 'http://www.bbc.co.uk/learning', 'http://www.bbc.co.uk/cgi-bin/search/results.pl?go.x=0&go.y=0&go=go&uri=%2Flearning%2F&q={$formKeywords}', NULL, 0),
(651, 123, 'Educator''s Reference Desk', 'The people who created AskERIC announce a new service and name to access the resources you''ve come to depend on for over a decade. While the U.S. Department of Education will discontinue the AskERIC service December 19th, you will still have access to the resources you''ve come to depend upon. Through The Educator''s Reference Desk (http://www.eduref.org) you can access AskERIC''s 2,000+ lesson plans, 3,000+ links to online education information, and 200+ question archive responses. While the question answer service will no longer be active, The Educator''s Reference Desk provides a search interface to the ERIC Databases, providing access to over one million bibliographic records on educational research, theory, and practice.', 'http://www.eduref.org/', 'http://www.google.com/search?&q=site%3Awww.eduref.org+{$formKeywords}', NULL, 1),
(652, 123, 'Marco Polo', 'MarcoPolo: Internet Content for the Classroom is a nonprofit consortium of premier national and international education organizations and the MCI Foundation dedicated to providing the highest quality Internet content and professional development to teachers and students throughout the United States.', 'http://www.marcopolo-education.org/', 'http://www.marcopolosearch.org/mpsearch/Search_Results.asp?orgn_id=2&log_type=1&hdnFilter=&hdnPerPage=15&selUsing=all&txtSearchFor={$formKeywords}', NULL, 2),
(653, 123, 'National Science Digital Library', 'The National Science Digital Library (NSDL) was created by the National Science Foundation to provide organized access to high quality resources and tools that support innovations in teaching and learning at all levels of science, technology, engineering, and mathematics education.', 'http://nsdl.org/about', 'http://nsdl.org/search/?formview=searchresults&verb=Search&s=0&n=10&boost%5B%5D=compoundTitle&boost%5B%5D=compoundDescription&q={$formKeywords}', NULL, 3),
(654, 123, 'Community Learning Network', 'Community Learning Network is designed to help K-12 teachers integrate technology into the classroom.', 'http://www.cln.org/', 'http://www.openschool.bc.ca/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&config=htdig_cln&restrict2=&submit2=Search&words={$formKeywords}', NULL, 4),
(655, 123, 'Educational Media Reviews Online', 'Educational Media Reviews Online is a database of video, DVD, and CD-ROM reviews on materials from major educational and documentary distributors. The reviews are written primarily by librarians and teaching faculty in institutions across the United States and Canada.', 'http://libweb.lib.buffalo.edu/emro/about.asp', 'http://libweb.lib.buffalo.edu/emro/EmroResults.asp?Title=&Subject=%25&Reviewer=&Year=%25&Rating=%25&Distributor=&Format=%25&Submit=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0&Keyword={$formKeywords}', NULL, 5),
(656, 123, 'Gateway to Educational Materials (GEM)', 'This site offers a one-stop educational resource to Internet lesson plans, curriculum units, and activities pertaining to all K-12 subjects. Users can browse sites by subject or keyword, desired grade or education level. They can also search by subject, keyword, title, and full-text of the site description. Sources include the AskERIC Virtual Library, the Eisenhower National Clearinghouse, Math Forum, Microsoft Encarta, the North Carolina Department of Public Instruction, and the US Department of Education.', 'http://www.thegateway.org/', 'http://64.119.44.148/portal_seamarksearch/makesearch?isliteral=yes&operator=contains&form.submitted=1&dimension=fulltext&ss=Go&value={$formKeywords}', NULL, 6),
(657, 123, 'Merlot', 'Merlot is a free and open resource designed primarily for faculty and students in higher education. With a continually growing collection of online learning materials, peer reviews and assignments, MERLOT helps faculty enhance instruction.', 'http://www.merlot.org/Home.po', 'http://www.merlot.org/merlot/materials.htm?keywords={$formKeywords}', NULL, 7),
(658, 123, 'SMETE', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/public/find/search_results.jhtml?_DARGS=/smete/home_body.jhtml&_D:/smete/forms/SimpleSearchForm.keyword=&/smete/forms/SimpleSearchForm.operation=simpleSearch&_D:/smete/forms/SimpleSearchForm.operation=&&/smete/forms/SimpleSearchForm.keyword={$formKeywords}', NULL, 8),
(659, 124, 'National Center for Education Statistics', 'The site of the Department of Education''s major statistical agency has a catalog of publications available, with text and tables from some of the publications.', 'http://nces.ed.gov/', 'http://search.nces.ed.gov/search?output=xml_no_dtd&client=nces&proxystylesheet=nces&site=nces&q={$formKeywords}', NULL, 0),
(660, 124, 'Federal Resources for Educational Excellence', 'Federal Resources For Educational Excellence: More than 30 Federal agencies formed a working group in 1997 to make hundreds of education resources supported by agencies across the U.S. Federal government easier to find. The result of that work is the FREE web site. Subjects include: Arts, Educational technology, Foreign languages, Health and Safety, Language arts, Mathematics, Physical education, Science, Social studies, and Vocational education.', 'http://free.ed.gov/template.cfm?template=About%20FREE', 'http://free.ed.gov/searchres.cfm', 'searchword={$formKeywords}', 1),
(661, 124, 'EdResearch Online', 'The EdResearch Online database hasover 12,000 online education research documents and articles. These form a subset of the Australian Education Index.', 'http://cunningham.acer.edu.au/dbtw-wpd/sample/edresearch.htm', 'http://cunningham.acer.edu.au/dbtw-wpd/exec/dbtwpub.dll', 'MF=&AC=QBE_QUERY&NP=2&RL=0&QF0=AUTHOR | CORPORATE AUTHOR | TITLE | SUBJECTS | ORGANISATIONS | ABSTRACT | GEOGRAPHICAL | ADDED AUTHORS | ADDED CORPORATE | IDENTIFIERS | JOURNAL TITLE | ISSN&TN=edresearchonline&DF=Web_Full&RF=Web_Brief&MR=50&DL=0&QI0={$formKeywords}', 2),
(662, 124, 'National Clearinghouse for Educational Facilities', 'This site''s resources include "free information about K-12 school planning, design, financing, construction, operations and maintenance." The Libraries/Media Centers section includes a bibliography of books and articles covering all aspects of construction management, architecture, and cost estimation. Disaster planning, health, and environmental issues receive consideration. Check the links for other professional organizations, government programs and agencies, research centers, products, and services. Click on Gallery to view project graphics. Searchable.', 'http://www.edfacilities.org/', 'http://www.edfacilities.org/search/index.cfm', 'RequestTimeout=300&SearchSortField1=NCEFDate&SearchSortOrder1=DESC&SearchScope=All&SearchLogic=AND&SearchKeywords={$formKeywords}', 3),
(663, 124, 'Education Development Center', 'The EDC is an international, non-profit organization with more than 335 continuing projects focused on the enhancement of eduThis site''s resources include "free information about K-12 school planning, design, financing, construction, operations and maintenance." The Libraries/Media Centers section includes a bibliography of books and articles covering all aspects of construction management, architecture, and cost estimation. Disaster planning, health, and environmental issues receive consideration. Check the links for other professional organizations, government programs and agencies, research centers, products, and services. Click on Gallery to view project graphics. Searchable.cational methods and initiatives.  The Center''s site includes information related the use of technology in education.', 'http://main.edc.org/', 'http://google2.edc.org/search?site=newsroom&client=edc_main&proxystylesheet=edc_main&output=xml_no_dtd&filter=0&q={$formKeywords}', NULL, 4),
(664, 124, 'ENC Online: Eisenhower National Clearinghouse for Mathematics and Science Education', 'Established in 1992 with funding from the U.S. Department of Education, the mission of the clearinghouse is to "acquire and catalog mathematics and science curriculum resources, creating the most comprehensive collection in the nation; provide the best selection of math and science education resources on the Internet; support teachers'' professional development in math, science, and the effective use of technology; serve all K-12 educators, parents, and students with free products and services."\n\nENC.ORG is now goENC.COM!', 'http://www.goenc.com/', 'http://www.goenc.com/search/default.asp?page=1&pagelength=10&grade=G0&resourceType=R0&go=Search&searchText={$formKeywords}', NULL, 5),
(665, 125, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(666, 125, 'Government of Canada homepage', 'This is the primary internet portal for information on the Government of Canada, its programmes, services, new initiatives and products, and for information about Canada. Among its features are three audience-based gateways that provide access to information and services for: Canadians, Non-Canadians, and Canadian business.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.collectionscanada.ca/fed/searchResults.jsp?SourceQuery=&ResultCount=5&PageNum=1&MaxDocs=-1&SortSpec=score+desc&Language=eng&Sources=amicus&Sources=mikan&Sources=web&QueryText.x=11&QueryText.y=13&QueryText={$formKeywords}', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=&kl=XX&op=a&q={$formKeywords}', 1),
(667, 125, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(668, 125, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(669, 125, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(670, 125, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu/geninfo/query/resultaction.jsp?', 'qtype=simple&Collection=EuropaFull&ResultTemplate=/result_en.jsp&DefaultLG=en&ResultCount=10&html=&QueryText={$formKeywords}', 5),
(671, 125, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(672, 125, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?ms0=%A0&mt0=all&st=AS&rn=2&parsed=true&db=www-fed-all&mw0={$formKeywords}', NULL, 7),
(673, 125, 'Canada Site', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(674, 126, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(675, 126, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(676, 126, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=', 'Content=&searchword={$formKeywords}', 2),
(677, 126, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(678, 126, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(679, 126, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 5),
(680, 126, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(681, 126, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.themoscowtimes.com/indexes/01.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(682, 126, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(683, 126, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://www.newsdirectory.com/hbSearch.php', 's={$formKeywords}& submit=Go', 9),
(684, 127, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(685, 127, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(686, 127, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(687, 127, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(688, 128, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(689, 128, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering & Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(690, 128, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(691, 128, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(692, 128, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(693, 128, 'National Environmental Publications Internet Site (NEPIS)', 'The National Environmental Publications Information System began in 1997, to offer over 9,000 full text, online documents of the United States Environmental Protection Agency. Documents that are not available online can be ordered from the agency through NEPIS.', 'http://nepis.epa.gov/', 'http://nepis.epa.gov/Exe/ZyNET.exe?User=ANONYMOUS&Password=anonymous&Client=EPA&SearchBack=ZyActionL&SortMethod=h&SortMethod=-&MaximumDocuments=15&Display=hpfr&ImageQuality=r85g16%2Fr85g16%2Fx150y150g16%2Fi500&DefSeekPage=x&ZyAction=ZyActionS&Toc=&TocEntry=&QField=&QFieldYear=&QFieldMonth=&QFieldDay=&UseQField=&Docs=&IntQFieldOp=0&ExtQFieldOp=0&File=&SeekPage=&Back=ZyActionL&BackDesc=Contents+page&MaximumPages=1&ZyEntry=0&TocRestrict=n&SearchMethod=1&Time=&FuzzyDegree=0&Index=National+Environmental+Publications+Info&Query={$formKeywords}', NULL, 5),
(694, 129, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(695, 129, 'NAL Agricultural Thesaurus', 'NAL Agricultural Thesaurus was created to meet the needs of the United States Department of Agriculture (USDA), Agricultural Research Service (ARS), for an agricultural thesaurus. NAL Agricultural Thesaurus is for anyone describing, organizing and classifying agricultural resources such as: books, articles, catalogs, databases, patents, games, educational materials, pictures, slides, film, videotapes, software, other electronic media, or websites. It is organized into 17 subject categories.', 'http://agclass.nal.usda.gov/agt/agt.htm', 'http://search.nal.usda.gov/query.html?charset=iso-8859-1&ht=0&qp=&qs=-url%3Atektran&qc=-&pw=100%25&ws=0&la=en&qm=0&st=1&nh=10&lk=1&rf=0&oq=&rq=0&si=1&x=15&y=8&qt={$formKeywords}', NULL, 1),
(696, 129, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(697, 129, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(698, 129, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(699, 129, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(700, 130, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 0),
(701, 130, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(702, 130, 'National Environmental Publications Internet Site (NEPIS)', 'The National Environmental Publications Information System began in 1997, to offer over 9,000 full text, online documents of the United States Environmental Protection Agency. Documents that are not available online can be ordered from the agency through NEPIS.', 'http://nepis.epa.gov/', 'http://nepis.epa.gov/Exe/ZyNET.exe?User=ANONYMOUS&Password=anonymous&Client=EPA&SearchBack=ZyActionL&SortMethod=h&SortMethod=-&MaximumDocuments=15&Display=hpfr&ImageQuality=r85g16%2Fr85g16%2Fx150y150g16%2Fi500&DefSeekPage=x&ZyAction=ZyActionS&Toc=&TocEntry=&QField=&QFieldYear=&QFieldMonth=&QFieldDay=&UseQField=&Docs=&IntQFieldOp=0&ExtQFieldOp=0&File=&SeekPage=&Back=ZyActionL&BackDesc=Contents+page&MaximumPages=1&ZyEntry=0&TocRestrict=n&SearchMethod=1&Time=&FuzzyDegree=0&Index=National+Environmental+Publications+Info&Query={$formKeywords}', NULL, 2),
(703, 130, 'National Library for the Environment', 'A universal, timely, and easy-to-use single-point entry to quality environmental data and information for the use of all participants in the environmental enterprise.', 'http://www.ncseonline.org/nle/index.cfm?&CFID=8843778&CFTOKEN=66834254', 'http://www.ncseonline.org/NLE/CRS/detail.cfm?quickKeyword={$formKeywords}', NULL, 3),
(704, 131, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(705, 131, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(706, 131, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(707, 131, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(708, 131, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(709, 131, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(710, 131, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(711, 132, 'EnviroLink', 'The EnviroLink Network has served as the online clearinghouse for environmental information since 1991.', 'http://www.envirolink.org/', 'http://www.envirolink.org/newsearch.html?searchfor={$formKeywords}', NULL, 0),
(712, 133, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(713, 133, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(714, 133, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(715, 133, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(716, 134, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in environment.', 'http://www.liszt.com/dir/?cid=0', 'http://www.liszt.com/search/?search_type=cat&amp;query={$formKeywords}', NULL, 0),
(717, 134, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/mind/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+{$formKeywords}', NULL, 1),
(718, 135, 'Climate Data Inventories', 'Climate data inventories comprises a partial inventory of NCDC data sets and a complete list of weather observation stations, including inventory/station lists for U.S. and global surface data and inventory/station lists for U.S. and global upper air data.', 'http://lwf.ncdc.noaa.gov/oa/climate/climateinventories.html', 'http://crawl.ncdc.noaa.gov/search?site=ncdc&output=xml_no_dtd&client=ncdc&lr=&proxystylesheet=ncdc&oe=&q={$formKeywords}', NULL, 0),
(719, 135, 'U.S. Geological Survey', 'The U.S. Geological Survey provides information to describe and understand the Earth. This information is used to: minimize loss of life and property from natural disasters; manage water, biological, energy, and mineral resources; enhance and protect the quality of life; and contribute to wise economic and physical development. This site describes its programs, projects, publications, research, jobs, library, and educational resources. It also provides links to news releases.', 'http://www.usgs.gov/', 'http://search.usgs.gov/query.html?col=usgs&col=top2000&ht=0&qp&qs=&qc=&pw=100%25&ws=1&la=&qm=0&st=1&nh=10&lk=1&rf=0&oq=&rq=0&si=0=&qt={$formKeywords}', NULL, 1),
(720, 136, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(721, 136, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(722, 136, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(723, 136, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(724, 137, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(725, 137, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(726, 137, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(727, 137, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(728, 137, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(729, 137, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=past30days&submit.x=11&submit.y=12&query={$formKeywords}', NULL, 5),
(730, 137, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(731, 137, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(732, 137, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(733, 137, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 9),
(734, 138, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(735, 138, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(736, 138, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(737, 138, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(738, 139, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(739, 139, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science.  The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(740, 139, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(741, 139, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(742, 139, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(743, 139, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&src=hw&fulltext=&pubdate_year=&volume=&firstpage=&disp_type=&author1={$formKeywords}', NULL, 5),
(744, 139, 'NASA Technical Report Server', 'NASA Technical Report Server (NTRS) is to provide students, educators, and the public access to NASA''s technical literature. NTRS also collects scientific and technical information from sites external to NASA to broaden the scope of information available to users.', 'http://ntrs.nasa.gov/index.jsp?method=aboutntrs', 'http://ntrs.nasa.gov/search.jsp?N=0&Ntk=all&Ntx=mode%20matchall&Ntt={$formKeywords}', NULL, 6),
(745, 139, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 7),
(746, 139, 'KOSMOI', 'KOSMOI includes educational articles, books, posters, & web links for all interested in the wonders of our Cosmos, on Science, Space, Technology, Nature, & Web Design. Updated daily.', 'http://kosmoi.com/', 'http://www.google.com/custom?sa=Search&cof=GIMP%3A%23cccccc%3BT%3A%23ffdd99%3BLW%3A468%3BALC%3Ared%3BL%3Ahttp%3A%2F%2Fencyclozine.com%2FPictures%2FBanner%2FEncycloZine2.jpg%3BGFNT%3A%23999999%3BLC%3A%23ffcc33%3BLH%3A60%3BBGC%3Ablack%3BAH%3Acenter%3BVLC%3A%23ffcc66%3BGL%3A2%3BGALT%3A%23ffffff%3BAWFID%3A29728ead1ae72975%3B&domains=EncycloZine.com%3BKosmoi.com%3BEluzions.com&sitesearch=Kosmoi.com&q={$formKeywords}', NULL, 8),
(747, 140, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(748, 140, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 1),
(749, 140, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 2),
(750, 140, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 3),
(751, 140, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 4),
(752, 141, 'Science Books and Films', 'Science Books and Films is the AAAS review journal for science materials for all ages, including reviews and recommendations for books, videos, software, and web sites.', 'http://sbfonline.com/', 'http://sbfonline.com/sample/search.cgi?title_query_type=all&author_query_type&author=&other=&type=B&type=F&type=S&title={$formKeywords}', NULL, 0),
(753, 141, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 1),
(754, 141, 'National Academy Press(NAP)', 'The National Academy Press (NAP) publishes over 200 books a year on a wide range of topics in science, engineering, and health, capturing the most authoritative views on important issues in science and health policy.', 'http://books.nap.edu/books/0309070317/html/177.html', 'http://search.nap.edu/nap-cgi/napsearch.cgi?term={$formKeywords}', NULL, 2),
(755, 141, 'E-STREAMS', 'E-STREAMS: Electronic reviews of Science & Technology References covering Engineering, Agriculture, Medicine and Science. Each issue contains 30+ STM reviews, covering new titles in Engineering, Agriculture, Medicine and Science. Each review is signed, and includes the email address of the reviewer. The reviews feature short TOCs, a list of contributors and bibliographic information.', 'http://www.e-streams.com/', 'http://www.e-streams.com/c3/cgi-bin/search.pl', 'boolean=AND&case=Insensitive&terms={$formKeywords}', 3),
(756, 141, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 4),
(757, 141, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 5),
(758, 141, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 6),
(759, 142, 'Science.gov', 'Science.gov is a gateway to over 50 million pages of authoritative selected science information provided by U.S. government agencies, including research and development results.', 'http://www.science.gov', 'http://www.science.gov/scigov/search.html?expression={$formKeywords}', NULL, 0),
(760, 142, 'SciCentral', 'A directory of links to "today''s breaking science news." Browsable by topic, including biosciences, health sciences, physics, chemistry, earth and space, and engineering. Also includes links to related journals, databases, job opportunities, and conferences.', 'http://scicentral.com/', 'http://www.google.com/custom?client=pub-2641291926759270&forid=1&channel=1291454416&ie=ISO-8859-1&oe=ISO-8859-1&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23FFFFFF%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A9999FF%3BGIMP%3A9999FF%3BLH%3A50%3BLW%3A78%3BL%3Ahttp%3A%2F%2Fwww.scicentral.com%2Fimages%2Fscclogo_for_google.gif%3BS%3Ahttp%3A%2F%2Fwww.scicentral.com%3BFORID%3A1%3B&hl=en&q={$formKeywords}', NULL, 1),
(761, 143, 'Channel 4 Science', 'Channel 4''s science site covers a wide range of current scientific issues from science in society to science in medicine. The site is split into broad sections, each containing related topics, articles and programme information. There are resources at the end of the articles with listings of related Web Sites and reading material. The site also contains a helpful glossary and an "Ask an expert" facility for posing scientific queries to a body of scientific experts.', 'http://www.channel4.com/science/index.html', 'http://search.channel4.com/search?&sort=date%3AD%3AL%3Ad1&output=xml_no_dtd&ie=UTF-8&oe=UTF-8&client=standard_c4&proxystylesheet=standard_c4&q={$formKeywords}', NULL, 0),
(762, 143, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science.  The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(763, 143, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?author1=&pubdate_year=&volume=&firstpage=&src=hw&hits=10&hitsbrief=25&resourcetype=1&andorexactfulltext=and&fulltext={$formKeywords}', NULL, 2),
(764, 143, 'FirstGov for Science', 'Science.gov is a gateway to authoritative selected science information provided by U.S. Government agencies, including research and development results.  It enables you to search 47 million pages in real time.', 'http://science.gov/', 'http://www.science.gov/search30/search.html?expression={$formKeywords}', NULL, 3),
(765, 143, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 4),
(766, 143, 'CASI Technical Report Server', 'CASI Technical Report Server contains bibliographic citations and abstracts to unclassified documents announced in Scientific and technical aerospace reports, plus the document series produced by NASA''s predecessor, The National Advisory Committee for Aeronautics, and the NASA open literature file containing citations and abstracts to literature in the fields of aeronautics, space science, chemistry, engineering, geosciences, life sciences, mathematics, computer sciences, and physics.', 'http://www.sti.nasa.gov/RECONselect.html', 'http://ntrs.nasa.gov/index.cgi?method=search&limit=25&offset=0&mode=simple&order=DESC&keywords={$formKeywords}', NULL, 5),
(767, 143, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 6),
(768, 143, 'KOSMOI', 'KOSMOI includes educational articles, books, posters, & web links for all interested in the wonders of our Cosmos, on Science, Space, Technology, Nature, & Web Design. Updated daily.', 'http://kosmoi.com/', 'http://www.google.com/custom?sa=Search&cof=GIMP%3A%23cccccc%3BT%3A%23ffdd99%3BLW%3A468%3BALC%3Ared%3BL%3Ahttp%3A%2F%2Fencyclozine.com%2FPictures%2FBanner%2FEncycloZine2.jpg%3BGFNT%3A%23999999%3BLC%3A%23ffcc33%3BLH%3A60%3BBGC%3Ablack%3BAH%3Acenter%3BVLC%3A%23ffcc66%3BGL%3A2%3BGALT%3A%23ffffff%3BAWFID%3A29728ead1ae72975%3B&domains=EncycloZine.com%3BKosmoi.com%3BEluzions.com&sitesearch=Kosmoi.com&q={$formKeywords}', NULL, 7),
(769, 143, 'PhilSci Archive', 'PhilSci Archive is an electronic archive for preprints in the philosophy of science.', 'http://philsci-archive.pitt.edu/', 'http://philsci-archive.pitt.edu/perl/search?_order=bytitle&abstract%2Fkeywords%2Ftitle_srchtype=ALL&_satisfyall=ALL&_action_search=Search&abstract%2Fkeywords%2Ftitle={$formKeywords}', NULL, 8),
(770, 144, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(771, 144, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(772, 144, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(773, 144, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(774, 144, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(775, 145, 'Scholarly Societies Project Meeting/Conference Announcement List', 'Scholarly Societies Project Meeting/Conference Announcement List is a searchable service provided by the University of Waterloo.', 'http://www.scholarly-societies.org/', 'http://ssp-search.uwaterloo.ca/cd.cfm?search_type=advanced&field1=any&boolean1=and&operator1=and&field2=any&textfield2=&boolean2=and&operator2=and&field3=any&textfield3=&boolean3=and&operator3=and&founded=none&&textfield1={$formKeywords}', NULL, 0),
(776, 146, 'Ask the Experts', 'Ask the Experts is provided by the Scientific American magazine. Questions and answers are archived and organized.', 'http://www.sciam.com/askexpert', 'http://www.google.com/search?q=site%3Asciam.com+%22ask+the+experts%22%2B+', NULL, 0),
(777, 146, 'EurekAlert!', 'EurekAlert! is an online press service created by the American Association for the Advancement of Science (AAAS). The primary goal of EurekAlert! is to provide a forum where research institutions, universities, government agencies, corporations and the like can distribute science-related news to reporters and news media. The secondary goal of EurekAlert! is to archive these press releases and make them available to the public in an easily retrievable system.', 'http://www.eurekalert.org/links.php', 'http://search.eurekalert.org/e3/query.html?col=ev3rel&qc=ev3rel&x=8&y=9&qt={$formKeywords}', NULL, 1),
(778, 146, 'Mad Science Net: The 24-hour exploding laboratory', 'Mad Science Net: The 24-hour exploding laboratory is a collective cranium of scientists providing answers to your questions.', 'http://www.madsci.org/', 'http://www.madsci.org/cgi-bin/search?Submit=Submit+Query&or=AND&words=1&index=MadSci+Archives&MAX_TOTAL=25&area=All+areas&grade=All+grades&query={$formKeywords}', NULL, 2),
(779, 146, 'JISCmail', 'The National Academic Mailing List Service, known as ''JISCmail'', is one of a number of JANET services provided by JANET(UK) (www.ja.net) and funded by the JISC (www.jisc.ac.uk) to benefit \nlearning, teaching and research communities. The Science and Technology Facilities Council (www.scitech.ac.uk) currently operates and develops the JISCmail service on behalf of JANET(UK).', 'http://www.jiscmail.ac.uk/about/index.htm', 'http://www.jiscmail.ac.uk/../cgi-bin/listsearcher.cgi?opt=listsearcher&listname=&alpha=&category=&chk_phrase=&chk_wds=ON&thecriteria={$formKeywords}', NULL, 3),
(780, 147, 'Research Channel Programs: Stanford Science Online Videos', 'ResearchChannel is a consortium of research universities and corporate research divisions dedicated to broadening the access to and appreciation of our individual and collective activities, ideas, and opportunities in basic and applied research.', 'http://www.researchchannel.org/program/displayseries.asp?collid=134', 'http://www.researchchannel.org/search/sitesearch.aspx?RecordsPerPage=5&Order=Rank&keywords=program&Query={$formKeywords}', NULL, 0),
(781, 147, 'National Science Digital Library', 'The National Science Digital Library (NSDL) was created by the National Science Foundation to provide organized access to high quality resources and tools that support innovations in teaching and learning at all levels of science, technology, engineering, and mathematics education.', 'http://nsdl.org/about', 'http://nsdl.org/search/?', 'formview=searchresults&verb=Search&s=0&n=10&boost%5B%5D=compoundTitle&boost%5B%5D=compoundDescription&q={$formKeywords}', 1),
(782, 147, 'Science Learning Network', 'Science Learning Network is a community of educators, students, schools, science museums, and other institutions demonstrating a new model for inquiry into. Contains a variety of inquiry-posed problems, information, demonstrations, and labs.', 'http://www.sln.org/', 'http://192.231.162.154:8080/query.html?col=first&ht=0&qp=&qs=&qc=&pw=600&ws=1&la=&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&si=0&qt={$formKeywords}', NULL, 2),
(783, 147, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 3);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(784, 148, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(785, 149, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(786, 149, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(787, 149, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(788, 149, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(789, 149, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(790, 149, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(791, 149, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(792, 149, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(793, 149, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(794, 150, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(795, 150, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/news/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 1),
(796, 150, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 2),
(797, 150, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 3),
(798, 150, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 4),
(799, 150, 'BBC Online: Science & Nature', 'The BBC online science and nature services which contain a wealth of information, resources and current news divided into clearly defined categories.  These categories include the human body, genes, prehistoric life, space and animals. A Hot Topics section explores the science behind the latest news.', 'http://www.bbc.co.uk/sn/', 'http://www.bbc.co.uk/cgi-bin/search/results.pl?uri=%2Fsn%2F&q={$formKeywords}', NULL, 5),
(800, 150, 'Energy Science News', 'Published by the Office of Science, U.S. Department of Energy.  The purpose of this newsletter is to inform scientists, engineers, educators, students, and the public about the progress of scientific research supported by the Office of Science.', 'http://www.eurekalert.org/doe/', 'http://search.eurekalert.org/e3/query.html?col=ev3rel+ev3feat&ht=0&qp=%2Binstitution%3ADOE+OR+%2Bfunder%3A%22US+Department+of+Energy%22&qs=&qc=ev3rel+ev3feat&pw=%25&ws=0&la=&si=1&fs=&ex=&rq=0&oq=&qm=0&ql=&st=1&nh=10&lk=1&rf=1&qt={$formKeywords}', NULL, 6),
(801, 150, 'ScienceDaily', 'Latest research news.', 'http://www.sciencedaily.com/index.htm', 'http://www.sciencedaily.com/search/?topic=all&dates=1995&dates=2005&sort=relevance&keyword={$formKeywords}', NULL, 7),
(802, 151, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(803, 151, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(804, 151, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(805, 151, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(806, 152, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(807, 152, 'Intute: Repository Search', 'Use this service to find descriptions from over 152,000 working papers, journal articles, reports, conference papers, and other scholarly items that have been deposited into UK eprints repositories. Search results will link to original items where these have been made available by the originating institution.', 'http://irs.ukoln.ac.uk/', 'http://irs.ukoln.ac.uk/search/?view=&submit.x=0&submit.y=0&submit=Go&query={$formKeywords}', NULL, 1),
(808, 152, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(809, 152, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 3),
(810, 153, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(811, 153, 'Columbia Encyclopedia', 'Serving as a "first aid" for those who read, the sixth edition of the Columbia Encyclopedia contains over 51,000 entries with 80,000 hypertext links.', 'http://www.bartleby.com/65/', 'http://www.bartleby.com/cgi-bin/texis/webinator/65search?search_type=full&query={$formKeywords}', NULL, 1),
(812, 153, 'Encyclopedia.com', 'Online version of the Concise Electronic Encyclopedia. Entries are very short, so this site is better suited for fact checking than research.', 'http://www.encyclopedia.com/', 'http://www.encyclopedia.com/searchpool.asp?target={$formKeywords}', NULL, 2),
(813, 153, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(814, 153, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(815, 153, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 5),
(816, 153, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 6),
(817, 154, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(818, 154, 'The Government of Canada', 'ou can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(819, 154, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(820, 154, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(821, 154, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(822, 154, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(823, 154, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(824, 155, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(825, 155, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(826, 155, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(827, 155, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(828, 156, 'H-Net Reviews', 'H-Net Reviews in the Humanities and Social Sciences is an online scholarly review resource. reviews are published online via discussion networks and the H-Net web site. This permits our reviews to reach scholars with a speed unmatched in any other medium. It also makes a new kind of interactivity possible, as reviewers, authors and readers engage in discussions of the reviews online. Through the power of e-mail and the web H-Net has helped pioneer online scholarly reviewing.', 'http://www2.h-net.msu.edu/reviews/', 'http://www2.h-net.msu.edu/reviews/search.cgi?maxlines=25&maxfiles=25&all=all&query={$formKeywords}', NULL, 0),
(829, 156, 'New York Review of Books', 'Lengthy reviews from the well-respected print publication. The keyword-searchable archive covers 1983 to the present, with some free, many pay-per-view.', 'http://www.nybooks.com/index', 'http://www.nybooks.com/archives/search?author_name=%20&reviewed_author=&reviewed_item=&form=&year=&title={$formKeywords}', NULL, 1),
(830, 156, 'CM : Canadian Review of Materials', 'CM: Canadian Review of Materials is an electronic reviewing journal. CM reviews Canadiana of interest to children and young adults, including publications produced in Canada, or published elsewhere but of special interest or significance to Canada, such as those having a Canadian writer, illustrator or subject. We review books, video and audio recordings and CD-ROMs.', 'http://www.umanitoba.ca/cm/', 'http://google.cc.umanitoba.ca/search?btnG=Search&sort=date%3AD%3AL%3Ad1&output=xml_no_dtd&site=default_collection&ie=UTF-8&oe=UTF-8&client=default_frontend&proxystylesheet=default_frontend&as_dt=i&as_sitesearch=http%3A%2F%2Fwww.umanitoba.ca%2Foutreach%2Fcm&q={$formKeywords}', NULL, 2),
(831, 156, 'Leonardo Digital Book Reviews', 'Leonardo Digital Book reviews from the International Society for the Arts, Sciences and Technology', 'http://www.leonardo.info/', 'http://www.google.com/search?hl=en&btnG=Search&q=site%3Awww.leonardo.info%2Freviews%2F+{$formKeywords}', NULL, 3),
(832, 157, 'CRL Foreign Doctoral Dissertation Databases', 'The CRL''s (Center For Research Libraries) database for dissertations published outside of the United States and Canada is still in the construction phase. At this point, a total of 15,000 of 750,000 records are loaded into the database. Searchable by author, institution name, title, year, translated title, subject keywords, language, and country, the database also provides instructions for interlibrary loan procedure.', 'http://www.crl.edu/content.asp?l1=5&l2=23&l3=44&l4=25', 'http://www.crl.edu/DBSearch/dissertationsSummary.asp?language=English&title={$formKeywords}', NULL, 0),
(833, 157, 'Dissertation.com', 'Academic publishers of masters theses and doctoral PhD dissertations. Search 1000s of dissertation abstracts in dissertation database.', 'http://dissertation.com/', 'http://dissertation.com/browse.php?criteria=all&submit.x=23&submit.y=5&keyword={$formKeywords}', NULL, 1),
(834, 157, 'Networked Digital Library of Theses and Dissertations Union Catalog', 'This Union Catalog serves as a repository of rich graduate educational material contributed by a number of member institutions worldwide.  This project is a joint development with NDLTD and VTLS Inc.  It is hoped that this project will increase the availability of student research for scholars, empowere students to convey a richer message through the use of multimedia and hypermedia technologies and advance digital library technology worldwide.', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon?sessionid=2006051219043826835&skin=ndltd&submittheform=Search&usersrch=1&beginsrch=1&elementcount=3&function=INITREQ&search=SCAN&lng=en&pos=1&conf=.%2Fchameleon.conf&u1=4&host=localhost%2B3668%2BDEFAULT&t1={$formKeywords}', NULL, 2),
(835, 157, 'Scirus ETD Search', 'NDLTD offers a search service provided by Scirus, which is based on data harvested from the Union Archive hosted by OCLC.', 'http://www.ndltd.org/info/description.en.html', 'http://www.scirus.com/srsapp/search?rep=ndl&q={$formKeywords}', NULL, 3),
(836, 158, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in many categories.', 'http://www.liszt.com/dir/?cid=0', 'http://www.liszt.com/search/?search_type=cat&amp;query={$formKeywords}', NULL, 0),
(837, 158, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+{$formKeywords}', NULL, 1),
(838, 159, 'Bartlett''s Familiar Quotations', 'A collection of passages, phrases, and proverbs traced to their sources in ancient and modern literature (1919 edition).', 'http://www.bartleby.com/100/', 'http://www.bartleby.com/cgi-bin/texis/webinator/sitesearch?FILTER=col100%20&x=9&y=11&query={$formKeywords}', NULL, 0),
(839, 159, 'Quotations Page', 'Searchable database of several quotation resources on the Internet. See the Quotations Collections for a description of each.', 'http://www.quotationspage.com/', 'http://www.quotationspage.com/search.php3?Author=&C=mgm&C=motivate&C=classic&C=coles&C=lindsly&C=poorc&C=net&C=devils&C=contrib&x=60&y=11&Search={$formKeywords}', NULL, 1),
(840, 160, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(841, 160, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(842, 160, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(843, 160, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(844, 161, 'BBC Learning', 'BBC Online - Education BBC Education. Access to excellent learning resources for adults and children. Lots of subjects - history, science, languages, health, work skills, culture, technology, arts, literature, business, nature, life, leisure.', 'http://www.bbc.co.uk/learning/', 'http://www.bbc.co.uk/cgi-bin/search/results.pl?go.x=0&go.y=0&go=go&uri=%2Flearning%2F&q={$formKeywords}', NULL, 0),
(845, 161, 'Intute: Repository Search', 'Use this service to find descriptions from over 152,000 working papers, journal articles, reports, conference papers, and other scholarly items that have been deposited into UK eprints repositories. Search results will link to original items where these have been made available by the originating institution.', 'http://irs.ukoln.ac.uk/', 'http://irs.ukoln.ac.uk/search/?view=&submit.x=0&submit.y=0&submit=Go&query={$formKeywords}', NULL, 1),
(846, 161, 'High Beam Research', 'High Beam Research is a single search engine for all subjects. Will search and deliver results by email. Abstract and text for subscribers only.', 'http://www.highbeam.com/library/index.asp', 'http://www.highbeam.com/Search.aspx?st=NL&nml=True&t=&a=&src=ALM&src=BOOKS&src=DICT&src=ENCY&src=MAGS&src=MAPS&src=NEWS&src=PICS&src=THES&src=TRAN&src=WHITEPAPER&count=10&offset=0&sort=RK&sortdir=D&pst=INCLUDE_ALL&cn=&storage=ALL&display=ALL&sponsor=ALL&docclass=ALL&relatedid=&bid=&embargo=False&q={$formKeywords}', NULL, 2),
(847, 161, 'RAND Research', 'For more than 50 years, the RAND Corporation has pursued its nonprofit mission by conducting research on importand and complicated problems. Initially, RAND (the name of which was derived from a contraction of the term research and development) focused on issues of national security. Eventually, RAND expanded its intellectual reserves to offer insight into other areas, such as business, education, health, law, and science. RAND''s innovative approach to problem solving has become the benchmark for all other "think tanks" that followed. Hot Topics in RAND Research analyzes education and world issues.', 'http://www.rand.org/hot_topics/index.html', 'http://vivisimo.rand.org/vivisimo/cgi-bin/query-meta?input-form=simple&Go=Search&query={$formKeywords}', NULL, 3),
(848, 162, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(849, 162, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(850, 162, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(851, 162, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(852, 162, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(853, 162, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=past30days&submit.x=11&submit.y=12&query={$formKeywords}', NULL, 5),
(854, 162, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(855, 162, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(856, 162, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(857, 162, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 9),
(858, 163, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(859, 163, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(860, 163, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(861, 163, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(862, 164, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(863, 164, 'Intute: Arts & Humanities', 'Intute: Arts & Humanities is a free online service providing you with access to the best Web resources for education and research, selected and evaluated by a network of subject specialists. There are over 18,000 Web resources listed here that are freely available by keyword searching and browsing.', 'http://www.intute.ac.uk/artsandhumanities/ejournals.html', 'http://www.intute.ac.uk/artsandhumanities/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=artsandhumanities&term1={$formKeywords}', NULL, 1),
(864, 164, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(865, 164, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 3),
(866, 164, 'Anthropological index', 'The Anthropological Index is a regionally arranged subject and author index to periodical articles in all areas of anthropology. It is produced by the Museum of Mankind Library.', 'http://aio.anthropology.org.uk/cgi-bin/uncgi/search_bib_ai/anthind_short', 'http://aio.anthropology.org.uk/cgi-bin/uncgi/search_bib_ai/anthind_short', 'Default_Years=#1957#1958#1959#1960#1961#1962#1963#1964#1965#1966#1967#1968#1969#1970#1971#1972#1973#1974#1975#1976#1977#1978#1979#1980#1981#1982#1983#1984#1985#1986#1987#1988#1989#1990#1991#1992#1993#1994#1995#1996#1997#1998#1999#2000#2001#2002#2003#2004#2005#Recent&Year=Recent&Text_w=&Text=&Author_w=&Subject1=&Subject2=&Subject3=&Email=You@whereever.edu&Refer=on&Author={$formKeywords}', 4),
(867, 164, 'The English Server', 'The English Server contains humanities texts online with over 18,000 works, covering history, race, art & architecture, government and other topics.', 'http://eserver.org/', 'http://www.google.com/u/EServer?q={$formKeywords}', NULL, 5),
(868, 164, 'IATH: Institute for Advanced Technology in the Humanities', 'IATH: Institute for Advanced Technology in the Humanities, from the University of Virginia at Charlottesville, provides access to web-based humanities research archives and reports, essays, and the current issue of Postmodern Culture, the Internet''s oldest peer-reviewed electronic journal in the humanities.', 'http://jefferson.village.virginia.edu/', 'http://www.google.com/u/iath?sa=Google+Search+of+IATH&domains=village.virginia.edu&sitesearch=village.virginia.edu&q={$formKeywords}', NULL, 6),
(869, 164, 'The Online books Page', 'The Online books Page is the most comprehensive website that facilitates access to books that are freely readable over the Internet.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?amode=words&tmode=words&title=&author={$formKeywords}', NULL, 7),
(870, 164, 'Perseus Digital Library', 'Perseus Digital library is designed to be resources for the study of the ancient world. Originally begun with coverage of the Archaic and Classical Greek world, has now expanded to Latin text and tools, Renaissance materials, and Papyri. Contains hundreds of texts by the major ancient authors and lexica and morphological databases and catalog entries for over 2,800 vases, sculptures, coins, buildings, and sites, including over 13,000 photographs of such objects.', 'http://www.perseus.tufts.edu/', 'http://www.perseus.tufts.edu/cgi-bin/vor?x=22&y=15&lookup={$formKeywords}', NULL, 8),
(871, 164, 'Voice of the Shuttle', 'Voice of the Shuttle emphasizes both primary and secondary (or theoretical) resources of American literature, including links of syllabi, electronic journals and newsgroups.', 'http://vos.ucsb.edu/', 'http://vos.ucsb.edu/search-results.asp?Submit=Go&search={$formKeywords}', NULL, 9),
(872, 165, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(873, 165, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 1),
(874, 165, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 2),
(875, 165, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 3),
(876, 165, 'The Internet Encyclopedia of Philosophy', 'This encyclopedia contains articles adapted from public domain sources, adaptations of material written by the editor for classroom purposes, and original contributions by professional philosophers around the Internet.', 'http://www.utm.edu/research/iep/', 'http://www.google.com/search?hl=en&lr=&q=site%3Awww.utm.edu%2Fresearch%2Fiep%2F+{$formKeywords}', NULL, 4),
(877, 165, 'Stanford Encyclopedia of Philosophy', 'Stanford Encyclopedia of Philosophy is a searchable encyclopedia of philosophy providing in-depth explanations for terms.', 'http://plato.stanford.edu/', 'http://plato.stanford.edu/cgi-bin/webglimpse.cgi?nonascii=on&errors=0&maxfiles=50&maxlines=30&maxchars=10000&ID=1&query={$formKeywords}', NULL, 5),
(878, 165, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 6),
(879, 165, 'WordNet', 'WordNet, an electronic lexical database, is considered to be the most important resource available to researchers in computational linguistics, text analysis, and many related areas. Its design is inspired by current psycholinguistic and computational theories of human lexical memory. English nouns, verbs, adjectives, and adverbs are organized into synonym sets, each representing one underlying lexicalized concept. Different relations link the synonym sets.', 'http://www.cogsci.princeton.edu/~wn/', 'http://wordnet.princeton.edu/perl/webwn?sub=Search+WordNet&o2=&o0=1&o7=&o5=&o1=1&o6=&o4=&o3=&h=&s={$formKeywords}', NULL, 7),
(880, 166, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(881, 166, 'Government of Canada Publicatons', 'The Government of Canada Publications Web site provides a single window access to free and priced publications authored by Government of Canada departments. The database does not have every publication published from all departments. It does however, have over 100,000 publications listed and this number is increasing on a daily basis as this site continues to collaborate with author departments.', 'http://www.canada.gc.ca/main_e.html', 'http://publications.gc.ca/control/quickPublicSearch?searchAction=2&termValue={$formKeywords}', NULL, 1),
(882, 166, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(883, 166, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(884, 166, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(885, 166, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(886, 166, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(887, 167, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(888, 167, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(889, 167, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(890, 167, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(891, 168, 'Literary Index (Gale Group)', 'This is "a master index to the major literature products published by Gale," including Contemporary Authors and Literature Criticism from 1400-1800. Also indexes print reference titles from Charles Scribner''s Sons, St. James Press, and Twayne Publishers. Many of these resources, commonly found in libraries, "contain complete biographies on authors and critical essays on their writings."', 'http://www.galenet.com/servlet/LitIndex', 'http://www.galenet.com/servlet/LitIndex/hits?ttlRad=ti&n=10&NA=&r=s&origSearch=true&o=DocTitle&l=8&c=1&secondary=false&u=LitIndex&t=KW&s=2&TI={$formKeywords}', NULL, 0),
(892, 168, 'Internet Public Library Online Literary Criticism Collection', 'Browse the Internet Public Library''s collection of links to websites on western and non-western literary criticism. Organized by author, title of work studied and by literary period within a particular national tradition.', 'http://www.ipl.org/div/litcrit/', 'http://www.ipl.org/div/searchresults/?where=searchresults&words={$formKeywords}', NULL, 1),
(893, 168, 'Poetry Portal', 'This is a very comprehensive and informative collection of links about poetry online, events, courses, styles, and publishing. The site also covers "ezines, poetry sites, audio poetry, literary appreciation, criticism and reviews, poetry courses, workshops, conferences, book and trade news, literary chit-chat and trade news, plus sources to improve your own writing and get it published."', 'http://www.poetry-portal.com/', 'http://www.google.com/search?hl=en&q=site%3Awww.poetry-portal.com+{$formKeywords}', NULL, 2),
(894, 169, 'Bryn Mawr Classical Review', 'Bryn Mawr Classical Review contains full text of every book review published since 1990 in the Bryn Mawr Classical Review. Articles are indexed both by issue and by the title of the book.', 'http://ccat.sas.upenn.edu/bmcr/', 'http://ccat.sas.upenn.edu/cgi-bin/bmcr/bmcr_search?action=search&lookup={$formKeywords}', NULL, 0),
(895, 169, 'H-Net Reviews', 'H-Net Reviews in the Humanities and Social Sciences is an online scholarly review resource. reviews are published online via discussion networks and the H-Net web site. This permits our reviews to reach scholars with a speed unmatched in any other medium. It also makes a new kind of interactivity possible, as reviewers, authors and readers engage in discussions of the reviews online. Through the power of e-mail and the web H-Net has helped pioneer online scholarly reviewing.', 'http://www2.h-net.msu.edu/reviews/', 'http://www2.h-net.msu.edu/reviews/search.cgi?maxlines=25&maxfiles=25&all=all&query={$formKeywords}', NULL, 1),
(896, 169, 'The New York Times Books', 'The New York Times Books, updated daily, includes the entire Sunday Book reviews and a searchable archive of over 50,000 NYT book reviews dating back to 1980, bestseller lists and more (Need to sign up).', 'http://www.nytimes.com/auth/login?Tag=/&URI=/books/', 'http://query.nytimes.com/search/query?ppds=ctaxAbodyS&v1=Top%2FFeatures%2FBooks%2FBook+Reviews&sort=closest_newest&v2={$formKeywords}', NULL, 2),
(897, 169, 'Early Modern Literary Studies', 'Early Modern Literary Studies (ISSN 1201-2459) is a refereed journal serving as a formal arena for scholarly discussion and as an academic resource for researchers in the area. Articles in EMLS examine English literature, literary culture, and language during the sixteenth and seventeenth centuries; responses to published papers are also published as part of a Readers'' Forum. Reviews evaluate recent work as well as academic tools of interest to scholars in the field. EMLS is committed to gathering and to maintaining links to the most useful and comprehensive internet resources for Renaissance scholars, including archives, electronic texts, discussion groups, and beyond.', 'http://www.shu.ac.uk/emls/emlshome.html', 'http://www.shu.ac.uk/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&matchesperpage=10&config=emls&restrict=&exclude=&words={$formKeywords}', NULL, 3),
(898, 170, 'Anthropological index', 'The Anthropological Index is a regionally arranged subject and author index to periodical articles in all areas of anthropology. It is produced by the Museum of Mankind Library.', 'http://aio.anthropology.org.uk/cgi-bin/uncgi/search_bib_ai/anthind_short', 'http://aio.anthropology.org.uk/cgi-bin/uncgi/search_bib_ai/anthind_short', 'Default_Years=2001#2002#2003#2004#2005#Recent&Year=#1957#1958#1959#1960#1961#1962#1963#1964#1965#1966#1967#1968#1969#1970#1971#1972#1973#1974#1975#1976#1977#1978#1979#1980#1981#1982#1983#1984#1985#1986#1987#1988#1989#1990#1991#1992#1993#1994#1995#1996#1997#1998#1999#2000#2001#2002#2003#2004#2005#Recent&Text_w=&Author_w=&Subject1=&Subject2=&Subject3=&Email=You@whereever.edu&Refer=on&Author=&Text={$formKeywords}', 0),
(899, 170, 'The English Server', 'The English Server contains humanities texts online with over 18,000 works, covering history, race, art & architecture, government and other topics.', 'http://eserver.org/', 'http://www.google.com/u/EServer?q={$formKeywords}', NULL, 1),
(900, 170, 'IATH: Institute for Advanced Technology in the Humanities', 'IATH: Institute for Advanced Technology in the Humanities, from the University of Virginia at Charlottesville, provides access to web-based humanities research archives and reports, essays, and the current issue of Postmodern Culture, the Internet''s oldest peer-reviewed electronic journal in the humanities.', 'http://jefferson.village.virginia.edu/', 'http://www.google.com/u/iath?sa=Google+Search+of+IATH&domains=village.virginia.edu&sitesearch=village.virginia.edu&q={$formKeywords}', NULL, 2),
(901, 170, 'NetSERF: the Internet connection for medieval resources', 'Detailed topical arrangement of links to a large number of sites pertaining to medieval history and culture.', 'http://www.netserf.org/', 'http://www.netserf.org/Features/Search/default.cfm?Search_Action=Process&Phrase_required=You must provide a search phrase with this option.&phrase={$formKeywords}', NULL, 3),
(902, 170, 'The Online books Page', 'The Online books Page is the most comprehensive website that facilitates access to books that are freely readable over the Internet.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?author=&amode=words&tmode=words&title={$formKeywords}', NULL, 4),
(903, 170, 'Perseus Digital Library', 'Perseus Digital library is designed to be resources for the study of the ancient world. Originally begun with coverage of the Archaic and Classical Greek world, has now expanded to Latin text and tools, Renaissance materials, and Papyri. Contains hundreds of texts by the major ancient authors and lexica and morphological databases and catalog entries for over 2,800 vases, sculptures, coins, buildings, and sites, including over 13,000 photographs of such objects.', 'http://www.perseus.tufts.edu/', 'http://www.perseus.tufts.edu/cgi-bin/vor?x=22&y=15&lookup={$formKeywords}', NULL, 5),
(904, 170, 'Voice of the Shuttle', 'Voice of the Shuttle emphasizes both primary and secondary (or theoretical) resources of American literature, including links of syllabi, electronic journals and newsgroups.', 'http://vos.ucsb.edu/', 'http://vos.ucsb.edu/search-results.asp?Submit=Go&search={$formKeywords}', NULL, 6),
(905, 170, 'Dictionary of Canadian Biography Online', 'A collection of authoritative biographies portraying noteworthy persons of both sexes (with the exception of those still living). This first phase presents persons who died between the years 1000 and 1920', 'http://www.biographi.ca/EN/index.html', 'http://www.biographi.ca/EN/Results.asp?ToDo=&Show=&Data1=&Data2=&Data3=&Data4=&Data5=&Data6=&&Data7=&Data8=&Data9=&Data10=&txtSearch={$formKeywords}', NULL, 7),
(906, 171, 'CRL Foreign Doctoral Dissertation Databases', 'The CRL''s (Center For Research Libraries) database for dissertations published outside of the United States and Canada is still in the construction phase. At this point, a total of 15,000 of 750,000 records are loaded into the database. Searchable by author, institution name, title, year, translated title, subject keywords, language, and country, the database also provides instructions for interlibrary loan procedure.', 'http://www.crl.edu/content.asp?l1=5&l2=23&l3=44&l4=25', 'http://www.crl.edu/DBSearch/dissertationsSummary.asp?language=English&title={$formKeywords}', NULL, 0),
(907, 171, 'Dissertation.com', 'Academic publishers of masters theses and doctoral PhD dissertations. Search 1000s of dissertation abstracts in dissertation database.', 'http://dissertation.com/', 'http://dissertation.com/browse.php?criteria=all&submit.x=23&submit.y=5&keyword={$formKeywords}', NULL, 1),
(908, 171, 'Networked Digital Library of Theses and Dissertations Union Catalog', 'This Union Catalog serves as a repository of rich graduate educational material contributed by a number of member institutions worldwide.  This project is a joint development with NDLTD and VTLS Inc.  It is hoped that this project will increase the availability of student research for scholars, empowere students to convey a richer message through the use of multimedia and hypermedia technologies and advance digital library technology worldwide.', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon?sessionid=2006051219043826835&skin=ndltd&submittheform=Search&usersrch=1&beginsrch=1&elementcount=3&function=INITREQ&search=SCAN&lng=en&pos=1&conf=.%2Fchameleon.conf&u1=4&host=localhost%2B3668%2BDEFAULT&t1={$formKeywords}', NULL, 2),
(909, 171, 'Scirus ETD Search', 'NDLTD offers a search service provided by Scirus, which is based on data harvested from the Union Archive hosted by OCLC.', 'http://www.ndltd.org/info/description.en.html', 'http://www.scirus.com/srsapp/search?rep=ndl&q={$formKeywords}', NULL, 3),
(910, 172, 'AAD', 'Access to archival Databases (AAD) System has approximately 350 data files with millions of records available online that are highly structured, such as in databases. The series selected for AAD identify specific persons, geographic areas, organizations, or dates. Some of these series serve as indexes to accessioned archival records in non-electronic formats. Includes a link to search descriptions of NARA''s non-electronic records through NARA''s online catalogue, ARC.', 'http://aad.archives.gov/aad', 'http://search.nara.gov/query.html?rq=0&qp=&rq=0&col=4ardor&col=3ourdoc&col=2pres&col=1arch&qs=&qc=&pw=100%25&ws=0&la=&qm=0&st=1&nh=10&lk=1&rf=0&oq=&rq=0&qt={$formKeywords}', NULL, 0),
(911, 172, 'Making of America: the Cornell University Library MOA collection', 'A digital library of primary sources in American social history from the antebellum period through reconstruction. The collection is particularly strong in the subject areas of education, psychology, American history, sociology, religion, and science and technology.', 'http://cdl.library.cornell.edu/moa/', 'http://cdl.library.cornell.edu/cgi-bin/moa/sgml/moa-idx?&type=simple&slice=1&layer=first&coll=both&year1=1815&ear2=1926&q1={$formKeywords}', NULL, 1),
(912, 172, 'UIUC Digital Gateway to Cultural Heritage Materials', 'This gateway is using the OAI Protocol for harvesting metadata, and exposing it with a search interface to enhance resource discoverability for materials that represent cultural heritage. The repository includes metadata records donated by 39 institutions over 1.3 million records.', 'http://nergal.grainger.uiuc.edu/cgi/b/bib/bib-idx', 'http://nergal.grainger.uiuc.edu/cgi/b/bib/bib-idx?type=simple&xc=1&q6=&rgn6=identifier&rgn1=entire+record&op6=And&q1={$formKeywords}', NULL, 2),
(913, 172, 'A2A - Access to Archives', 'Contains catalogues describing archives held throughout England and dating from the 900s to the present day.', 'http://www.a2a.org.uk/', 'http://www.a2a.org.uk/search/doclist.asp?nb=0&nbKey=1&com=1&properties=0601&keyword={$formKeywords}', NULL, 3),
(914, 172, 'Archives Hub (UK)', 'A national gateway to descriptions of archives in UK universities and colleges.', 'http://www.archiveshub.ac.uk/', 'http://www.archiveshub.ac.uk/cgi-bin/deadsearch.cgi?server=SF&fieldidx1=descriptionWord&bool=AND&numreq=25&firstrec=1&format=sgml&noframes=0&maxrecs=50&firstrec=1&fieldcont1={$formKeywords}', NULL, 4),
(915, 172, 'Catholic Encyclopedia', 'Contains full and authoritative information on Catholic interests, action, and doctrine.', 'http://www.newadvent.org/cathen/index.html', 'http://www.google.com/custom?domains=NewAdvent.org&sa=Search+New+Advent&sitesearch=NewAdvent.org&client=pub-8168503353085287&forid=1&ie=ISO-8859-1&oe=ISO-8859-1&safe=active&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3A336699%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BFORID%3A1%3B&hl=en&q={$formKeywords}', NULL, 5),
(916, 172, 'Literature, Arts, and Medicine Databases', 'The Literature, Arts, & Medicine Database is an annotated multimedia listing of prose, poetry, film, video and art that was developed to be a dynamic, accessible, comprehensive resource for teaching and research in MEDICAL HUMANITIES, and for use in health/pre-health, graduate and undergraduate liberal arts and social science settings.', 'http://litmed.med.nyu.edu/Main?action=aboutDB', 'http://google.med.nyu.edu/search?btnG=search&access=p&entqr=0&output=xml_no_dtd&sort=date%3AD%3AL%3Ad1&ud=1&client=litmed_test&oe=UTF-8&ie=UTF-8&proxystylesheet=litmed_test&site=litmed_test&q={$formKeywords}', NULL, 6),
(917, 172, 'Map Collection, Perry-Castaneda', 'Displays selected digitized images from the printed map collection housed at the University of Texas at Austin.', 'http://www.lib.utexas.edu/maps/index.html', 'http://www.lib.utexas.edu:8080/search/utlol/search.jsp?collections=utlol&collections=utdatabases&queryText={$formKeywords}', NULL, 7),
(918, 173, 'Archives Portal', 'UNESCO, the United Nations Educational, Scientific, and Cultural Organization, provides a list of links to archives around the world with a Web presence.', 'http://portal.unesco.org/ci/en/ev.php-URL_ID=5761&URL_DO=DO_TOPIC&URL_SECTION=201.html', 'http://www.unesco.org/cgi-bin/webworld/portal_archives/cgi/search.cgi?search2=GO&query={$formKeywords}', NULL, 0),
(919, 173, 'Digital South Asia Library', 'On-line information about contemporary and historical South Asia - including full-text documents, statistical data, electronic images, cartographic representations, and pedagogical resources for language instruction.', 'http://dsal.uchicago.edu/', 'http://www.google.com/u/dsal?sa=Search&q={$formKeywords}', NULL, 1),
(920, 173, 'History Guide', 'Subject gateway to scholarly relevant information in history with a focus on Anglo-American history and the history of Central and Western Europe.', 'http://www.historyguide.de/', 'http://www.historyguide.de/allegrosuche.php?start=0&suchterm={$formKeywords}', NULL, 2),
(921, 173, 'Dante Project (Dartmouth)', 'Searchable collection of texts including the Italian text of the Divine Comedy and commentaries.', 'http://dante.dartmouth.edu/', 'http://dante.dartmouth.edu/search_view.php?commentary[]=0&language=any&cantica=0&canto=&line={$formKeywords}', 'Cmd=Search&query={$formKeywords}', 3),
(922, 173, 'Romantic Circles: Byron, the Shelleys, Keats and their Contemporaries', 'A Web site that provides scholarly resources for the study of Romantic-period literature and culture.', 'http://www.rc.umd.edu/', 'http://www.rc.umd.edu/cgi-bin/search/search.pl?Match=1&Realm=Editions&submit=Search&Terms={$formKeywords}', NULL, 4),
(923, 173, 'Intute: Arts & Humanities', 'Intute: Arts & Humanities is a free online service providing you with access to the best Web resources for education and research, selected and evaluated by a network of subject specialists. There are over 18,000 Web resources listed here that are freely available by keyword searching and browsing.', 'http://www.intute.ac.uk/artsandhumanities/ejournals.html', 'http://www.intute.ac.uk/artsandhumanities/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=artsandhumanities&term1={$formKeywords}', NULL, 5),
(924, 174, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(925, 174, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(926, 174, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(927, 174, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(928, 175, 'Electronic Text Center', 'Electronic Text Center reflects over 5,000 publicly accessible texts on history, literature, philosophy, religion, history of science. Texts are in English and other languages, including Latin, Japanese and Chinese.', 'http://etext.lib.virginia.edu/', 'http://etext.virginia.edu/etcbin/ot2www-ebooks?specfile=%2Ftexts%2Fenglish%2Febooks%2Febooks.o2w&docs=TEI2&sample=1-100&grouping=work&query={$formKeywords}', NULL, 0),
(929, 175, 'IPL Online Texts Collection', 'IPL Online Texts Collection contains over 19,000 titles that can be browsed by author, by title, or by Dewey Decimal Classification.', 'http://www.ipl.org/reading/books/', 'http://www.ipl.org/div/searchresults/?where=allv&words={$formKeywords}', NULL, 1),
(930, 175, 'Linguistic Data Consortium', 'Linguistic Data Consortium supports language-related education, research and technology development by creating and sharing linguistic resources including data, tools and standards.', 'http://www.ldc.upenn.edu/', 'http://www.ldc.upenn.edu/Catalog/catalogSearchResults.jsp?ldc_catalog_id=&name=&author=&languages=&years=&types=&datasources=&projects=&applications=&and_or=1&and_or2=1&desc={$formKeywords}', NULL, 2),
(931, 175, 'Oxford Text Archive', 'Oxford Text Archive contains Scholarly electronic texts and linguistic corpora across the range of humanities disciplines, with emphasis on resources of more than 1,500 literary works by many major authors in Greek, Latin, English and a dozen or more other languages.', 'http://ota.ahds.ac.uk/', 'http://ota.ahds.ac.uk/search/search.perl?search=SIMPLE&author=&title={$formKeywords}', NULL, 3),
(932, 175, 'Project Gutenberg', 'Project Gutenberg is the definitive Web site for this project to put out-of-copyright books online in full-text. More than 6,000 texts online so far.', 'http://www.gutenberg.net/', 'http://www.gutenberg.org/catalog/world/results?author=&etestnr=&title={$formKeywords}', NULL, 4),
(933, 176, 'H-Net Humanities and Social Sciences Online', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www.h-net.org/', 'http://www.h-net.org/logsearch/index.cgi?&type=keyword&hitlimit=25&field=&nojg=on&smonth=00&syear=1989&emonth=11&eyear=2004&order=relevance&phrase={$formKeywords}', NULL, 0),
(934, 176, 'Humanist', 'Humanist is an international electronic seminar on the application of computers in the humanities. Its primary aim is to provide a forum for discussion of intellectual, scholarly, pedagogical, and social issues and for exchange of information among members.', 'http://www.princeton.edu/~mccarty/humanist/index.html', 'http://lists.village.virginia.edu/cgi-bin/AT-Humanistsearch.cgi?sp=sp&searchButton.x=15&searchButton.y=14&search={$formKeywords}', NULL, 1),
(935, 176, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in humanities.', 'http://www.liszt.com/dir/?cid=0', 'http://lists.topica.com/search/?x=28&y=5&search_type=cat&query={$formKeywords}', NULL, 2),
(936, 177, 'EDSITEment', 'EDSITEment is a constantly growing collection of the most valuable online resources for teaching English, history, art history, and foreign languages.', 'http://edsitement.neh.gov/', 'http://marcopolosearch.org/MPSearch/Search_Results.asp?orgn_id=5&log_type=1&hdnFilter=+AND+%28%7Bsubject_social%241%7D%29&hdnPerPage=15&selUsing=all&txtSearchFor={$formKeywords}', NULL, 0),
(937, 178, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(938, 178, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(939, 178, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(940, 178, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(941, 178, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(942, 178, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 5),
(943, 178, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(944, 178, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(945, 178, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(946, 178, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 9),
(947, 179, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(948, 179, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(949, 179, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(950, 179, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(951, 180, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(952, 180, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(953, 180, 'Scirus', 'Scirus searches both free and access controlled journal sources. It currently covers the Web, ScienceDirect, MEDLINE on BioMedNet, Beilstein on ChemWeb, Neuroscion, BioMed Central and Patents from the USPTO.', 'http://www.scirus.com/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 2),
(954, 180, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 3),
(955, 180, 'Centers for Disease Control and Prevention (CDC)', 'The CDC Web site provides access to the full text of MMWR and other CDC publications and data archives. Publications are searchable through CDC Wonder.', 'http://www.cdc.gov/', 'http://www.cdc.gov/search.do?action=search&x=0&y=0&queryText={$formKeywords}', NULL, 4),
(956, 180, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/lists/freeart.dtl', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&src=hw&fulltext=&pubdate_year=&volume=&firstpage=&disp_type=&author1={$formKeywords}', NULL, 5),
(957, 180, 'MEDLINE/PubMed', 'MEDLINE is the National Library of Medicine''s database of references to more than 11 million articles published in 4300 biomedical journals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(958, 180, 'NetPrints', 'NetPrints provides a place for authors to archive their completed studies before, during, or after peer review by other agencies. Its scope is original research into clinical medicine and health.', 'http://clinmed.netprints.org/search.dtl', 'http://www.google.com/search?hl=en&q=site%3Aclinmed.netprints.org+{$formKeywords}', NULL, 7),
(959, 180, 'Intute: Health & Life Sciences', 'The Health and Life Sciences pages of Intute is a free online service providing you with access to the very best web resources for education and research, evaluated and selected by a network of subject specialists. There are over 31,000 resource descriptions listed here that are freely accessible for keyword searching or browsing.\n\nThis service was formerly known as BIOME.', 'http://www.intute.ac.uk/healthandlifesciences/', 'http://www.intute.ac.uk/healthandlifesciences/cgi-bin/search.pl?submit.x=20&submit.y=16&submit=Go&limit=0&subject=healthandlifesciences&term1={$formKeywords}', NULL, 8),
(960, 181, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(961, 181, 'ADAM Medical Encyclopedia', 'The ADAM Medical Encyclopedia includes over 4,000 articles about diseases, tests, symptoms, injuries, and surgeries. It also contains an extensive library of medical photographs and illustrations.', 'http://www.nlm.nih.gov/medlineplus/encyclopedia.html', 'http://search.nlm.nih.gov/medlineplus/query?DISAMBIGUATION=true&FUNCTION=search&SHOWTOPICS=5&SERVER2=server2&SERVER1=server1&ASPECT=-1&START=0&END=0&x=29&y=10&PARAMETER={$formKeywords}', NULL, 1),
(962, 181, 'Life Sciences Dictionary from BioTech', 'Life Sciences Dictionary from BioTech comprises 8,300+ terms relating to biochemistry, biotechnology, botany, cell biology and genetics, as well as selective entries on ecology, limnology, pharmacology, toxicology and medicine.', 'http://biotech.icmb.utexas.edu/search/dict-search.html', 'http://biotech.icmb.utexas.edu/search/dict-search2.html?bo1=AND&search_type=normal&def=&word={$formKeywords}', NULL, 2),
(963, 181, 'MedTerms Medical Dictionary Index', 'MedTerms Medical Dictionary Index is a doctor-produced encyclopedic medical dictionary, almost daily updated. Can be browsed by using the A to Z Index above or by typing the term in the Search Box below and click.', 'http://www.medicinenet.com/script/main/AlphaIdx.asp?li=MNI&p=A_DICT', 'http://www.medicinenet.com/script/main/srchCont.asp?li=MNI&ArtTypeID=DICT&op=MM&SRC={$formKeywords}', NULL, 3),
(964, 181, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 4),
(965, 181, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 5),
(966, 181, 'On-Line Medical Dictionary', 'The dictionary started in early 1997 and has grown, to contain over 46,000 definitions totalling 17.5 megabytes. Entries are cross-referenced to each other and to related resources elsewhere on the net. It is freely available on the Internet via the World-Wide Web.  OMD is a searchable dictionary created by Dr Graham Dark and contains terms relating to biochemistry, cell biology, chemistry, medicine, molecular biology, physics, plant biology, radiobiology, science and technology. It includes: acronyms, jargon, theory, conventions, standards, institutions, projects, eponyms, history, in fact anything to do with medicine or science.', 'http://cancerweb.ncl.ac.uk/cgi-bin/omd?', 'http://cancerweb.ncl.ac.uk/cgi-bin/omd?query={$formKeywords}', NULL, 6),
(967, 181, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 7),
(968, 181, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 8),
(969, 182, 'Centers for Disease Control and Prevention (CDC)', 'The CDC Web site provides access to the full text of MMWR and other CDC publications and data archives. Publications are searchable through CDC Wonder.', 'http://www.cdc.gov/', 'http://www.cdc.gov/search.do?action=search&x=0&y=0&queryText={$formKeywords}', NULL, 0),
(970, 182, 'ClinicalTrials.gov', 'ClinicalTrials.gov (National Institutes of Health) provides information for patients about clinical research studies.', 'http://www.clinicaltrials.gov', 'http://search.nhsdirect.nhs.uk/kbroker/nhsdirect/nhsdirect/search.lsim?hs=0&sm=0&ha=1054&sc=nhsdirect&mt=0&sb=0&nh=3&qt={$formKeywords}', NULL, 1),
(971, 182, 'Scirus', 'Scirus searches both free and access controlled journal sources. It currently covers the Web, ScienceDirect, MEDLINE on BioMedNet, Beilstein on ChemWeb, Neuroscion, BioMed Central and Patents from the USPTO.', 'http://www.scirus.com/', 'http://www.scirus.com/search_simple/?frm=simple&dsmem=on&dsweb=on&wordtype_1=phrase&query_1={$formKeywords}', NULL, 2),
(972, 182, 'Emedicine', 'Emedicine is a directory of free online medical articles and up-to-date, searchable, peer-reviewed medical textbooks for physicians, veterinarians, medical students, physician assistants, nurse practitioners, nurses and the public.', 'http://www.emedicine.com/', 'http://www.emedicine.com/cgi-bin/foxweb.exe/searchengine@/em/searchengine?boolean=and&book=all&maxhits=100&HiddenURL=&query={$formKeywords}', NULL, 3),
(973, 182, 'HealthWeb', 'Provides links to evaluated information resources selected by librarians and information professionals at academic medical centers in the Midwest. The goal is to meet the health information needs of both health care professionals and consumers. A collaborative project of the health sciences libraries of the Greater Midwest Region (GMR), of the National Network of Libraries of Medicine (NN/LM), and of the Committee for Institutional Cooperation.', 'http://www.healthweb.org/', 'http://www.healthweb.org/quicksearch_results5.cfm?StartRow=1&maxrows=25&Criteria_required=You+Must+enter+a+Keyword&where=1&criteria={$formKeywords}', NULL, 4),
(974, 182, 'HighWire', 'HighWire is one of the highest-impact journals in the field of science, technology and medicine. As of March 2002 HighWire contained 11,785,877 articles in over 4,500 Medline journals and 405,385 free full text articles from 321 HighWire-based journals.', 'http://highwire.stanford.edu/lists/freeart.dtl', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&author1=&src=ml&disp_type=&fulltext={$formKeywords}', NULL, 5),
(975, 182, 'MEDLINE/PubMed', 'MEDLINE is the National Library of Medicine''s database of references to more than 11 million articles published in 4300 biomedical journals.', 'http://www.ncbi.nlm.nih.gov/pubmed/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=PubMed&orig_db=PubMed&cmd=search&cmd_current=&query_key=1&term={$formKeywords}', NULL, 6),
(976, 182, 'MEDLINEplus', 'MEDLINEplus will direct you to information to help answer health questions. It brings together, by health topic, authoritative information from the world''s largest medical library, the National Library of Medicine at the National Institutes of Health. Designed for both health professionals and consumers, this service provides extensive information about specific diseases and conditions.', 'http://medlineplus.gov/', 'http://search.nlm.nih.gov/medlineplus/query?DISAMBIGUATION=true&FUNCTION=search&SERVER2=server2&SERVER1=server1&PARAMETER={$formKeywords}', NULL, 7),
(977, 182, 'NetPrints', 'NetPrints provides a place for authors to archive their completed studies before, during, or after peer review by other agencies. Its scope is original research into clinical medicine and health.', 'http://clinmed.netprints.org/search.dtl', 'http://www.google.com/search?hl=en&q=site%3Aclinmed.netprints.org+{$formKeywords}', NULL, 8),
(978, 182, 'Intute: Health & Life Sciences', 'The Health and Life Sciences pages of Intute is a free online service providing you with access to the very best web resources for education and research, evaluated and selected by a network of subject specialists. There are over 31,000 resource descriptions listed here that are freely accessible for keyword searching or browsing.', 'http://www.intute.ac.uk/healthandlifesciences/', 'http://www.intute.ac.uk/healthandlifesciences/cgi-bin/search.pl?submit.x=20&submit.y=16&submit=Go&limit=0&subject=healthandlifesciences&term1={$formKeywords}', NULL, 9),
(979, 183, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(980, 184, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(981, 184, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(982, 184, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(983, 184, 'National Academy Press(NAP)', 'The National Academy Press (NAP) publishes over 200 books a year on a wide range of topics in science, engineering, and health, capturing the most authoritative views on important issues in science and health policy.', 'http://books.nap.edu/books/0309070317/html/177.html', 'http://search.nap.edu/nap-cgi/napsearch.cgi?term={$formKeywords}', NULL, 3),
(984, 184, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 4),
(985, 185, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(986, 185, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(987, 185, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(988, 185, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(989, 185, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(990, 186, 'Canadian Health Network', 'Canadian Health Network (Canada) The Canadian Health Network (CHN) is a growing network, bringing together the best information resources of leading Canadian and international health information.', 'http://www.canadian-health-network.ca/servlet/ContentServer?pagename=CHN-RCS/Page/HomePageTemplate&cid=1038611684536&c=Page&lang=En', 'http://www.canadian-health-network.ca/servlet/ContentServer?cid=1046357853421&pagename=CHN-RCS%2FPage%2FSearchPageTemplate&c=Page&lang=En&orderBy=ORDER_RANK&searchType=ALL_WORDS&logSearch=true&searchStr={$formKeywords}', NULL, 0),
(991, 186, 'Directgov', 'Directgov is replacing UK online as the place to turn to for the latest and widest range of public service information from the UK government.', 'http://www.direct.gov.uk/Homepage/fs/en', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 1),
(992, 186, 'HealthInsite', 'HealthInsite (Australia) aims to improve the health of Australians by providing easy access to quality information about human health.', 'http://www.healthinsite.gov.au', 'http://www.healthinsite.gov.au/search97cgi/s97_cgi?Action=FilterSearch&Filter=ve_quick_search_filter.hts&ResultErrorTemplate=ve_error.hts&ResultCount=10&ResultMaxDocs=600&gl_search_collection=full&searchtype=simple&collection=healthinsite_coll&SortSpec=Score+desc+VDKDate_Modified+desc+VdkMeta_Title+asc+vdktarget_comp_num+asc&ResultTemplate=ve_search_results_new.hts&gl_search_text={$formKeywords}', NULL, 2),
(993, 186, 'NHS Direct', 'NHS Direct (UK) is a gateway to health information on the Internet in the United Kingdom. NHS Direct Online provides health advice and is supported by a 24 hour nurse advice and information help line.', 'http://www.nhsdirect.nhs.uk', 'http://search.nhsdirect.nhs.uk/kbroker/nhsdirect/nhsdirect/search.lsim?hs=0&sm=0&ha=1054&sc=nhsdirect&mt=0&sb=0&nh=3&qt={$formKeywords}', NULL, 3),
(994, 186, 'PubMed Central', 'PubMed Central is a free online archive of full-text, peer-reviewed research papers in the life sciences.', 'http://pubmedcentral.nih.gov/', 'http://www.ncbi.nlm.nih.gov/entrez/query.fcgi?db=pmc&cmd=search&pmfilter_Fulltext=on&pmfilter_Relevance=on&term={$formKeywords}', NULL, 4),
(995, 187, 'Hardin Meta Directory of Internet Health Resources', 'List of lists compiled by the Hardin Library of the Health Sciences at the University of Iowa. Divided into longer, medium-sized and shorter lists of links. The Hardin MD Clean Bill of Health Award is given to the best sites that have connection rates of at least 93%.', 'http://www.lib.uiowa.edu/hardin/md/index.html', 'http://search.atomz.com/search/?sp-a=00050f6e-sp00000000&sp-q={$formKeywords}', NULL, 0),
(996, 187, 'AMEDEO', 'AMEDEO has been created to serve the needs of healthcare professionals.  AMEDEO''s core components include weekly emails with bibliographic lists about new scientific publications, personal Web pages for one-time download of available abstracts, and an overview of the medical literature published in relevant journals over the past 12 to 24 months.', 'http://www.amedeo.com', 'http://www.google.com/custom?sa=Search&sitesearch=www.amedeo.com&q={$formKeywords}', NULL, 1),
(997, 188, 'AMA Physician Select', 'This American Medical Association site provides addresses, specialties, education and other background information on licensed physicians in the U.S. and its possessions. Search by physician name or medical specialty.', 'http://www.ama-assn.org/aps/amahg.htm', 'http://search.ama-assn.org/Search/query.html?qc=public+amnews&qt={$formKeywords}', NULL, 0),
(998, 188, 'Diseases Databases Ver 1.6; Medical lists and links', 'Diseases Databases Ver 1.6: medical lists and links - a cross-referenced index of human disease, medications, symptoms, signs, abnormal investigation findings etc.; provides a medical textbook-like index and search portal.', 'http://www.diseasesdatabase.com/begin.asp?gif=1', 'http://www.diseasesdatabase.com/item_choice.asp? bytSearchType=0&strUserInput={$formKeywords}', NULL, 1),
(999, 188, 'Drugs.com', 'Drugs.com is a free resource for medical professionals and consumers providing convenient and reliable drug information. Drug monographs are presented at both professional (USPDI), and consumer levels. The drug information could be found by browsing the alphabetical listing of the drugs or by search using generic or trade name. The drug interaction guide allows check for drug-drug and drug-food interactions.', 'http://www.drugs.com/', 'http://www.drugs.com/search.php?is_main_search=1&searchterm={$formKeywords}', NULL, 2),
(1000, 188, 'National Center for Biotechnology Information', 'In addition to maintaining the GenBank nucleic acid sequence database, the National Center for Biotechnology Information (NCBI) provides data analysis and retrieval and resources that operate on the data in GenBank and a varity of other biological data made available through NCBI''s Web site. NCBI data retrieval resources include Entrez, PubMed, LocusLink and the Taxonomy Browser. Data analysis resources include BLAST, Electronic PCR, OrfFinder, RefSeq, UniGene, Databases of Single Nucleotide Polymorphisms (dbSNP), Human Genome Sequencing pages, GeneMap ''99, Davis Human-Mouse Homology Map, Cancer Chromosome Abberation Project (CCAP) pages, Entrez Genomes, Clusters of Orthologous Groups (COGs) database, Retroviral Genotyping Tools, Cancer Genome Anatomy Project (CGAP) pages, SAGEmap, Online Mendelian Inheritance in Man (OMIM) and the Molecular Modeling Databases (MMDB).', 'http://www.ncbi.nlm.nih.gov/', 'http://www.ncbi.nlm.nih.gov/gquery/gquery.fcgi?term={$formKeywords}', NULL, 3),
(1001, 188, 'RxList', 'RxList: The Internet drug index - Searchable cross index of US prescription products for both consumers and medical professionals', 'http://www.rxlist.com/', 'http://www.rxlist.com/cgi/rxlist.cgi?drug=acetaminophen', NULL, 4),
(1002, 189, 'EurekAlert!', 'EurekAlert! is an online press service created by the American Association for the Advancement of Science (AAAS). The primary goal of EurekAlert! is to provide a forum where research institutions, universities, government agencies, corporations and the like can distribute science-related news to reporters and news media. The secondary goal of EurekAlert! is to archive these press releases and make them available to the public in an easily retrievable system.', 'http://www.eurekalert.org/links.php', 'http://search.eurekalert.org/e3/query.html?col=ev3rel&qc=ev3rel&qt={$formKeywords}', NULL, 0),
(1003, 189, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in life science.', 'http://www.liszt.com/dir/?cid=0', 'http://www.liszt.com/search/?search_type=cat&amp;query={$formKeywords}', NULL, 1),
(1004, 189, 'Mad Science Net: The 24-hour exploding laboratory', 'Mad Science Net: The 24-hour exploding laboratory is a collective cranium of scientists providing answers to your questions.', 'http://www.madsci.org/', 'http://www.madsci.org/cgi-bin/search?Submit=Submit+Query&or=AND&words=1&index=MadSci+Archives&MAX_TOTAL=25&area=All+areas&grade=All+grades&query={$formKeywords}', NULL, 2),
(1005, 190, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 0),
(1006, 191, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(1007, 191, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(1008, 191, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(1009, 191, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(1010, 191, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(1011, 191, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(1012, 191, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(1013, 191, 'Health Canada', 'Health Canada is the federal department responsible for helping the people of Canada maintain and improve their health.  Health Canada is committed to improving the lives of all of Canada''s people and to making this country''s population among the healthiest in the world as measured by longevity, lifestyle and effective use of the public health care system.', 'http://search.hc-sc.gc.ca/cgi-bin/query?mss=hcsearch', 'http://search.hc-sc.gc.ca/cgi-bin/query?mss=hcresult&pg=aq&enc=iso88591&ft=adverse+drug&doc=all&results=any&exclude=&r=&kl=en&subsite=both&search=Search&q={$formKeywords}', NULL, 7),
(1014, 191, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 8),
(1015, 191, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 9),
(1016, 192, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(1017, 192, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 1),
(1018, 192, 'The Scientist', 'The Scientist is the online resource for the printed magazine, The Scientist. Provides access to information useful to those working in or studying the life sciences.', 'http://www.the-scientist.com/', 'http://www.the-scientist.com/search/dosearch/', 'box_type=toolbar&search_restriction=all&order_by=date&search_terms={$formKeywords}', 2),
(1019, 192, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 3),
(1020, 192, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 4),
(1021, 192, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 5),
(1022, 193, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(1023, 193, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(1024, 193, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(1025, 193, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(1026, 194, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(1027, 194, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(1028, 194, 'OAIster (Open Archives Inititive research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(1029, 194, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 3),
(1030, 194, 'EULER', 'EULER provides a world reference and delivery service, transparent to the end user and offering full coverage of the mathematics literature world-wide, including bibliographic data, peer reviews and/or abstracts, indexing, classification and search, transparent access to library services, co-operating with commercial information providers (publishers, bookstores).', 'http://www.emis.ams.org/projects/EULER/', 'http://www.emis.de/projects/EULER/search?q={$formKeywords}', NULL, 4),
(1031, 194, 'Math Archives: Topics in Mathematics', 'A large, searchable collection of categorized teaching materials, software, and Web links. While not annotated, keywords for each site provide insight into the site''s offerings.', 'http://archives.math.utk.edu/topics/', 'http://www.google.com/search?q=site%3Aarchives.math.utk.edu+topics+{$formKeywords}', NULL, 5),
(1032, 194, 'MathSearch', 'an excellent tool for searching the contents of more than 80,000 mathematics pages world wide, via Sydney University work, network security, digital signal processing and related topics.', 'http://www.maths.usyd.edu.au:8000/MathSearch.html', 'http://www.maths.usyd.edu.au:8000/s/search/p?p2=&p3=&p4=&p1={$formKeywords}', NULL, 6),
(1033, 194, 'MPRESS/MATHNET', 'MPRESS/MathNet is a concept/installation to provide quality indexing of mathematical preprints (servers). It is in itself operated in a distributed way. MPRESS improves access to the full texts of preprints in mathematics by means of metadata and provides comprehensive and easily searchable information on the preprints available.', 'http://mathnet.preprints.org/', 'http://mathnet.preprints.org/cgi-bin/harvest/MPRESS.pl.cgi?title=&metaquery=&keyword=&query=&broker=FraGer&errorflag=0&wordflag=off&opaqueflag=off&csumflag=off&maxobjflag=10000&maxlineflag=10000&maxresultflag=10000&author={$formKeywords}', NULL, 7),
(1034, 194, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 8),
(1035, 195, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(1036, 195, 'Wolfram Research''s Mathematical Functions', 'More than 37,000 facts about mathematical functions as of July 2003. This site was created as a resource for the educational, mathematical, and scientific communities. It contains the world''s most encyclopedic collection of information about mathematical functions. The site also details the interrelationships between the special functions of mathematical physics and the elementary functions of mathematical analysis as well as the interrelationships between the functions in each group.', 'http://functions.wolfram.com/', 'http://functions.wolfram.com/search/index.cgi?filter=1&q={$formKeywords}', NULL, 1),
(1037, 195, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(1038, 195, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(1039, 195, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(1040, 195, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(1041, 196, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(1042, 196, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(1043, 196, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(1044, 196, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(1045, 197, 'MacTutor History of Mathematics', 'Includes biographies of more than 1100 mathematicians and a special index of women mathematicians.', 'http://www-groups.dcs.st-and.ac.uk/%7Ehistory/index.html', 'http://www-history.mcs.st-andrews.ac.uk/Search/historysearch.cgi?SUGGESTION={$formKeywords}', NULL, 0),
(1046, 198, 'Eric Weisstein''s MathWorld', 'Eric Weisstein''s MathWorld is a comprehensive mathematics information bank. The site currently consists of some 10,228 searchable entries, 89,364 cross-references, 4,205 figures, 125 animated graphics, 964 live Java applets and receives an average of 135 updates and new entries each month.', 'http://mathworld.wolfram.com/', 'http://mathworld.wolfram.com/search/?x=0&y=0&query={$formKeywords}', NULL, 0),
(1047, 199, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 0),
(1048, 199, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(1049, 199, 'EULER', 'EULER provides a world reference and delivery service, transparent to the end user and offering full coverage of the mathematics literature world-wide, including bibliographic data, peer reviews and/or abstracts, indexing, classification and search, transparent access to library services, co-operating with commercial information providers (publishers, bookstores).', 'http://www.emis.ams.org/projects/EULER/', 'http://www.emis.de/projects/EULER/search?q={$formKeywords}', NULL, 2),
(1050, 199, 'Math Archives: Topics in Mathematics', 'A large, searchable collection of categorized teaching materials, software, and Web links. While not annotated, keywords for each site provide insight into the site''s offerings.', 'http://archives.math.utk.edu/topics/', 'http://www.google.com/search?q=site%3Aarchives.math.utk.edu+topics+{$formKeywords}', NULL, 3),
(1051, 199, 'MathSearch', 'An excellent tool for searching the contents of more than 80,000 mathematics pages world wide, via Sydney University work, network security, digital signal processing and related topics.', 'http://www.maths.usyd.edu.au:8000/MathSearch.html', 'http://www.maths.usyd.edu.au:8000/s/search/p?p2=&p3=&p4=&p1={$formKeywords}', NULL, 4),
(1052, 199, 'MPRESS/MATHNET', 'MPRESS/MathNet is a concept/installation to provide quality indexing of mathematical preprints (servers). It is in itself operated in a distributed way. MPRESS improves access to the full texts of preprints in mathematics by means of metadata and provides comprehensive and easily searchable information on the preprints available.', 'http://mathnet.preprints.org/', 'http://mathnet.preprints.org/cgi-bin/harvest/MPRESS.pl.cgi?author=&keyword=&title=&metaquery=&broker=FraGer&errorflag=0&wordflag=off&opaqueflag=off&csumflag=off&maxobjflag=10000&maxlineflag=10000&maxresultflag=10000&query={$formKeywords}', NULL, 5),
(1053, 199, 'SIAM Review', 'The SIAM Review consists of five sections, all containing articles of broad interest. Survey and Review features papers with a deliberately integrative and up-to-date perspective on a major topic in applied or computational mathematics or scientific computing.', 'http://epubs.siam.org/sam-bin/dbq/toclist/SIREV', 'http://epubs.siam.org/search/search.pl', 'field1=anyfield&jrnlname=all&boolean1=and&search_field=anyfield&quicksearchstring={$formKeywords}', 6),
(1054, 199, 'Zentralblatt MATH', 'Zentralblatt MATH is the world''s most complete and longest running abstracting and reviewing service in pure and applied mathematics. The Zentralblatt MATH Database contains more than 2.0 million entries drawn from more than 2300 serials and journals, which are listed in this Database of Serials and Journals.', 'http://www.zblmath.fiz-karlsruhe.de/serials/', 'http://www.zblmath.fiz-karlsruhe.de/serials/?hits_per_page=10&is=&bi={$formKeywords}', NULL, 7),
(1055, 200, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(1056, 200, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(1057, 200, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(1058, 200, 'TheScientificWorld', 'TheScientificWorld offers sciBASE to give free access to a collection of databases of scientific, technical and medical research literature. sciBASE now also features immediate digital delivery of full text articles from over 700 journals produced by participating publishers, and sciBASE is particularly effective for users who do not have library support (non-mediated environments).', 'http://www.thescientificworld.com/', 'http://www.thescientificworld.com/SCIENTIFICWORLDJOURNAL/search/SearchResults.asp?From=Main&Terms={$formKeywords}', NULL, 3),
(1059, 200, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 4),
(1060, 201, 'The Mathematical Atlas: A Gateway to Modern Mathematics', 'This searchable site provides a collection of articles about the many subfields of math and includes definitions, brief biographies, and explanations. Each topic includes a history, related areas, and subfields as well as related print and Internet resources. It also includes an introduction to the Mathematics Subject Classification (MSC) scheme on which the site''s arrangement is based.', 'http://www.math-atlas.org/', 'http://www.math.niu.edu/cgi-bin/ffw.cgi/known-math?&go=Search&key={$formKeywords}', NULL, 0),
(1061, 201, 'MathForum''s Search All Epigone Discussions', 'MathForum''s Search All Epigone Discussions provides resources, materials, activities, person-to-person interactions, and educational products and services that enrich and support teaching and learning in an increasingly technological world. The Math Forum''s Epigone discussion archives include mathematics and math education-related newsgroups, mailing lists, and Web-based discussions.', 'http://mathforum.com/discussions/epi-search/all.html', 'http://mathforum.org/search/results.html?bool_type=and&whole_words=yes&match_case=no&ctrlfile=/var/www/search/ctrl/all.search.ctrl&textsearch={$formKeywords}', NULL, 1),
(1062, 201, 'AMS Meetings & Conferences', 'Meetings & Conferences, provided by the American Mathematical Society (AMS), contains a comprehensive list of important meetings information.', 'http://www.ams.org/meetings/', 'http://www.google.com/search?q=site%3Awww.ams.org%2Fmeetings%2F+{$formKeywords}', NULL, 2),
(1063, 202, 'National Science Digital Library', 'The National Science Digital Library (NSDL) was created by the National Science Foundation to provide organized access to high quality resources and tools that support innovations in teaching and learning at all levels of science, technology, engineering, and mathematics education.', 'http://nsdl.org/about', 'http://nsdl.org/search/?', 'formview=searchresults&verb=Search&s=0&n=10&boost%5B%5D=compoundTitle&boost%5B%5D=compoundDescription&q={$formKeywords}', 0),
(1064, 202, 'MSTE', 'MSTE serves as a model-builder for innovative, standards-based, technology-intensive mathematics and science instruction at the K-16 levels.', 'http://www.mste.uiuc.edu/', 'http://www.google.com/custom?ie=UTF-8&oe=UTF-8&sa=&cof=GALT%3A%2393AAC6%3BS%3Ahttp%3A%2F%2Fwww.mste.uiuc.edu%2F%3BGL%3A1%3BVLC%3Aorange%3BAH%3Acenter%3BBGC%3A%233d4b66%3BLH%3A255%3BLC%3Aorange%3BGFNT%3A%2393AAC6%3BL%3Ahttp%3A%2F%2Fwww.mste.uiuc.edu%2Fimages%2Fmstelogo.gif%3BALC%3A%23d3d3d3%3BLW%3A600%3BT%3A%23FFFFFF%3BGIMP%3A%2393AAC6%3BAWFID%3A174a51c6937b9927%3B&domains=http%3A%2F%2Fwww.mste.uiuc.edu%2F&sitesearch=http%3A%2F%2Fwww.mste.uiuc.edu%2F&q={$formKeywords}', NULL, 1),
(1065, 202, 'Illuminations', 'This site is to improve the teaching and learning of mathematics. This site offers interactive lessons for students, lesson plans for teachers, and math applets, all arranged by grade level. Includes a large collection of Web resources, arranged by concept and grade, and the standards for teaching math. From the National Council of Teachers of Mathematics (NCTM).', 'http://illuminations.nctm.org/', 'http://marcopolosearch.org/MPSearch/Search_Results.asp?orgn_id=6&log_type=1&hdnFilter=&hdnPerPage=15&selUsing=all&txtSearchFor={$formKeywords}', NULL, 2),
(1066, 202, 'MarcoPolo Internet Content for the Classroom', 'MarcoPolo Internet Content for the Classroom is a consortium of premier national education organizations, state education agencies and the MarcoPolo Education Foundation dedicated to providing the highest quality Internet content and professional development to teachers and students throughout the United States. Subjects include: Arts, Economics, Foreign Language, Geography, Language Arts, Mathematics, Philosophy & Religion, Science, and Social Studies.', 'http://www.marcopolo-education.org/home.aspx', 'http://www.marcopolosearch.org/mpsearch/Search_Results.asp?orgn_id=2&log_type=1&hdnFilter=&hdnPerPage=15&selUsing=all&txtSearchFor={$formKeywords}', NULL, 3),
(1067, 202, 'The Math Forum', 'The Math Forum gateway provides easy access to high quality resources for mathematicians and math teachers, and it provides resources that cover the use and administration of Internet sites as well as other educational resources. Among its features are the following: five ways to search with well written instructions for using each type; interactive sites; multilingual sites; choice of resource listings by knowledge levels from elementary to research level; and resources displayed in either an outline form or as an annotated listing with the ability to switch back and forth between the two.', 'http://mathforum.org/grepform.html', 'http://mathforum.org/search/results.html?bool_type=and&whole_words=yes&match_case=no&ctrlfile=%2Fvar%2Fwww%2Fsearch%2Fctrl%2Fall.search.ctrl&textsearch={$formKeywords}', NULL, 4),
(1068, 202, 'PBS Mathline', 'PBS Mathline features a specific math topic for teachers of grades K-12. Each month an in-depth article is linked to related resources, and daily facts related to the topic. PBS Mathline also offers an extensive professional development program.', 'http://www.pbs.org/teachersource/math.htm', 'http://www.pbs.org/teachersource/search/standards_results.shtm?start=1&end=20&subjects=NULL&grades=NULL&query={$formKeywords}', NULL, 5),
(1069, 202, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 6),
(1070, 202, 'Ask Dr. Math', 'Search the archives for elementary through college level questions and answers. Sponsored by Drexel University.', 'http://www.mathforum.org/library/drmath/', 'http://mathforum.org/library/drmath/results.html?textsearch_bool_type=and&textsearch_whole_words=no&textsearch={$formKeywords}', NULL, 7),
(1071, 203, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(1072, 203, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(1073, 203, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(1074, 203, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(1075, 203, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(1076, 203, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(1077, 203, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(1078, 203, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 7),
(1079, 203, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 8),
(1080, 204, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(1081, 204, 'Notice of the American Mathematical Society', 'Notices of the American Mathematical Society is one of the world''s most widely read periodicals for professional mathematicians.', 'http://www.ams.org/noticessearch/', 'http://www.google.com/custom?sa=Search+Notices&cof=S%3Ahttp%3A%2F%2Fwww.ams.org%2Fnotices%3BGL%3A0%3BVLC%3A%23004080%3BAH%3Aleft%3BBGC%3A%23ffffff%3BLH%3A55%3BLC%3A+%23004080%3BL%3Ahttp%3A%2F%2Fwww.ams.org%2Fimages%2Fnotices-search-banner.gif%3BALC%3A%23ff2b2b%3BLW%3A1200%3BT%3A%23000000%3BAWFID%3A39742761a368da0f%3B&domains=www.ams.org%2Fnotices&sitesearch=www.ams.org%2Fnotices&q={$formKeywords}', NULL, 1),
(1082, 204, 'Nature Science Update', 'Nature Science Update provides daily news stories written by the editors of the Nature Journal.', 'http://www.nature.com/nsu/', 'http://search.nature.com/search/?sp-x-9=cat&sp-q-9=NEWS&submit=go&sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp-t=results&sp-x-1=ujournal&sp-p-1=phrase&sp-p=all&sp-q={$formKeywords}', NULL, 2),
(1083, 204, 'Science News Online', 'Science News Online is one of the most useful science news magazines is now online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week. They''ve archived them back to 1994.', 'http://www.sciencenews.org/search.asp', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 3);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(1084, 204, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 4),
(1085, 204, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 5),
(1086, 205, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(1087, 205, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(1088, 205, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(1089, 205, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(1090, 206, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(1091, 206, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(1092, 206, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(1093, 206, 'Music Theory Online', 'This site is the refereed, electronic journal of the Society for Music Theory, Inc..', 'http://www.societymusictheory.org/mto/', 'http://www.google.com/u/smt?sa=Google+Search&q={$formKeywords}', NULL, 3),
(1094, 206, 'Music Education Resource Base: including the Canadian Music Index', 'MERB/CMI is a bibliographic database of more than 28,000 resources in music and music education from 31 Canadian and International journals and other sources covering the period 1956 through the present. The journals are fully indexed by title, author, and subject.', 'http://www.fmpweb.hsd.uvic.ca/merb/index.htm', 'http://www.fmpweb.hsd.uvic.ca/merb/FMPro?-DB=MERBSUB.fp5&-lay=Layout+%232&-format=search_results.htm&-error=search_error.htm&-max=all&-lop=and&-SortField=Title&-SortOrder=Ascending&-op=eq&Show+to+web=yes&-op=cn&-Find=Go&SUBJECT={$formKeywords}', NULL, 4),
(1095, 207, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(1096, 207, 'Columbia Encyclopedia', 'Serving as a "first aid" for those who read, the sixth edition of the Columbia Encyclopedia contains over 51,000 entries with 80,000 hypertext links.', 'http://www.bartleby.com/65/', 'http://www.bartleby.com/cgi-bin/texis/webinator/65search?search_type=full&query={$formKeywords}', NULL, 1),
(1097, 207, 'Encyclopedia.com', 'Online version of the Concise Electronic Encyclopedia. Entries are very short, so this site is better suited for fact checking than research.', 'http://www.encyclopedia.com/', 'http://www.encyclopedia.com/searchpool.asp?target={$formKeywords}', NULL, 2),
(1098, 207, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(1099, 207, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 4),
(1100, 207, 'Grove Concise Music Dictionary', 'GroveMusic powered by Gramophone.', 'http://www.gramophone.co.uk/', 'http://www.gramophone.co.uk/grove_popup.asp?grove={$formKeywords}', NULL, 5),
(1101, 207, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 6),
(1102, 207, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 7),
(1103, 208, 'Electronic Musician', 'Full-text articles from current issue and back issues to September 1999', 'http://industryclick.com/magazine.asp?magazineid=33&SiteID=15', 'http://industryclick.com/advsearchresults.asp?SiteID=15&MagazineID=33&CodeID=&selectSearch=mag%3B33&Go.x=12&Go.y=9&qry={$formKeywords}', NULL, 0),
(1104, 208, 'The Journal of Seventeenth-Century Music (JSCM)', 'The Journal of Seventeenth-Century Music (JSCM) is published by the Society for Seventeenth-Century Music to provide a refereed forum for scholarly studies of the musical cultures of the seventeenth century. These include historical and archival studies, performance practice, music theory, aesthetics, dance, and theater. JSCM also publishes critical reviews and summary listings of recently published books, scores, and electronic media.', 'http://sscm-jscm.press.uiuc.edu', 'http://sscm-jscm.press.uiuc.edu/cgi-bin/htsearch?method=and&format=builtin-long&sort=score&config=scm&restrict=&exclude=&words={$formKeywords}', NULL, 1),
(1105, 209, 'Music Theory Online', 'This site is the refereed, electronic journal of the Society for Music Theory, Inc..', 'http://www.societymusictheory.org/mto/', 'http://www.google.com/u/smt?sa=Google+Search&q={$formKeywords}', NULL, 0),
(1106, 209, 'Music Education Resource Base: including the Canadian Music Index', 'MERB/CMI is a bibliographic database of more than 28,000 resources in music and music education from 31 Canadian and International journals and other sources covering the period 1956 through the present. The journals are fully indexed by title, author, and subject.', 'http://www.fmpweb.hsd.uvic.ca/merb/index.htm', 'http://www.fmpweb.hsd.uvic.ca/merb/FMPro?-DB=MERBSUB.fp5&-lay=Layout+%232&-format=search_results.htm&-error=search_error.htm&-max=all&-lop=and&-SortField=Title&-SortOrder=Ascending&-op=eq&Show+to+web=yes&-op=cn&-Find=Go&SUBJECT={$formKeywords}', NULL, 1),
(1107, 210, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(1108, 210, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(1109, 210, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(1110, 210, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(1111, 210, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(1112, 210, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(1113, 210, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(1114, 211, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(1115, 211, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(1116, 211, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(1117, 211, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(1118, 212, 'Scirus ETD Search', 'NDLTD offers a search service provided by Scirus, which is based on data harvested from the Union Archive hosted by OCLC.', 'http://www.ndltd.org/info/description.en.html', 'http://www.scirus.com/srsapp/search?rep=ndl&q={$formKeywords}', NULL, 0),
(1119, 212, 'CRL Foreign Doctoral Dissertation Databases', 'The CRL''s (Center For Research Libraries) database for dissertations published outside of the United States and Canada is still in the construction phase. At this point, a total of 15,000 of 750,000 records are loaded into the database. Searchable by author, institution name, title, year, translated title, subject keywords, language, and country, the database also provides instructions for interlibrary loan procedure.', 'http://www.crl.edu/default.asp', 'http://www.crl.edu/DBSearch/catalogSearchNew.asp?sort=R&req_type=X&search={$formKeywords}', NULL, 1),
(1120, 212, 'Dissertation.com', 'Academic publishers of masters theses and doctoral PhD dissertations. Search 1000s of dissertation abstracts in dissertation database.', 'http://dissertation.com/', 'http://dissertation.com/browse.php?criteria=all&submit.x=23&submit.y=5&keyword={$formKeywords}', NULL, 2),
(1121, 212, 'Networked Digital Library of Theses and Dissertations Union Catalog', 'This Union Catalog serves as a repository of rich graduate educational material contributed by a number of member institutions worldwide.  This project is a joint development with NDLTD and VTLS Inc.  It is hoped that this project will increase the availability of student research for scholars, empowere students to convey a richer message through the use of multimedia and hypermedia technologies and advance digital library technology worldwide.', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon', 'http://zippo.vtls.com/cgi-bin/ndltd/chameleon?sessionid=2006051219043826835&skin=ndltd&submittheform=Search&usersrch=1&beginsrch=1&elementcount=3&function=INITREQ&search=SCAN&lng=en&pos=1&conf=.%2Fchameleon.conf&u1=4&host=localhost%2B3668%2BDEFAULT&t1={$formKeywords}', NULL, 3),
(1122, 213, 'Aria Databases', 'The Aria Databases is a diverse collection of information on over 1000 operatic arias. Designed for singers and non-singers alike, the Databases includes translations and aria texts of most arias as well as a collection of MIDI files of operatic arias and ensembles.', 'http://www.aria-database.com/', 'http://www.aria-database.com/cgi-bin/aria-search.pl', 'numbers=1|20&all-or-results=all&aria=&language=All&detail=yes&composer=&role=&opera=&low=A&below=2&high=A&above=3&pointless=yes&database-select=aria&input-choose=keyword&keyword={$formKeywords}', 0),
(1123, 213, 'Operabase', 'A powerful search tool allows you to search the details of over 38,000 opera performances since autumn 2001 by any combination of opera title, composer, date, location.', 'http://operabase.com/en/', 'http://operabase.com/oplist.cgi?id=none&lang=en&by=&loc=&near=0&stype=rel&srel=0&sd=1&sm=1&sy=1999&etype=rel&erel=0&ed=31&em=7&ey=2004&full=n&sort=V&is={$formKeywords}', NULL, 1),
(1124, 213, 'AMG All-Media (All-Music) Guide', 'From the paper copy publishers of the standard reference All Music Guide, this site contains ratings and reviews of more than 400,000 record albums. Search by artist, album, song, style, or label. Access information on new releases, music styles, music maps (guides to the evolution of a musical genre), articles, and a glossary. Entries on artists include a musician/musical group''s history, roots and influences, musical style, discography, guest performances, and reviews.', 'http://www.allmusic.com/', 'http://www.allmusic.com/cg/amg.dll?OPT1=1&P=amg&SQL={$formKeywords}', NULL, 2),
(1125, 213, 'Classical Net', 'Classical Net features more than 3200 CD/DVD/Book reviews, as well as 6000 files and over 4000 links to other classical music web sites.', 'http://www.classical.net/', 'http://search.mercora.com/msearch/search.jsp?pattern={$formKeywords}', NULL, 3),
(1126, 213, 'AHDS Performing Arts', 'AHDS Performing Arts collects, documents, preserves and promotes the use of digital resources to support research and teaching across the broad field of the performing arts: music, film, broadcast arts, theatre, dance.', 'http://ahds.ac.uk/performingarts/', 'http://ahds.ac.uk/performingarts/search/index.htm?submit=Search%21&query={$formKeywords}', NULL, 4),
(1127, 214, 'MusicMoz', 'The Open Music Project. A comprehensive directory of all things music, edited by volunteers, this site lists and accepts submissions of music-related reviews, articles, factual information, biographies, and websites.', 'http://musicmoz.org/', 'http://musicmoz.org/search/search.cgi?search={$formKeywords}', NULL, 0),
(1128, 215, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in music.', 'http://www.liszt.com/dir/?cid=0', 'http://www.liszt.com/search/?search_type=cat&amp;query={$formKeywords}', NULL, 0),
(1129, 215, 'MInd: the Meetings Index', 'Use this service to identify and locate the organizers and sponsors for future conferences, congresses, meetings and symposia, as well as conference proceedings (for future and past conferences).', 'http://www.interdok.com/', 'http://www.google.com/search?q=site%3Ainterdok.com+mind+{$formKeywords}', NULL, 1),
(1130, 216, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(1131, 216, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(1132, 216, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.qestia.com', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(1133, 216, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(1134, 217, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(1135, 217, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(1136, 217, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(1137, 217, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(1138, 217, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(1139, 217, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=past30days&submit.x=11&submit.y=12&query={$formKeywords}', NULL, 5),
(1140, 217, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(1141, 217, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(1142, 217, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(1143, 217, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 9),
(1144, 218, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(1145, 218, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(1146, 218, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(1147, 218, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(1148, 219, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(1149, 219, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(1150, 219, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 2),
(1151, 219, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 3),
(1152, 219, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 4),
(1153, 219, 'Fermilab Preprint Server search engine', 'Fermilab Preprint Server search engine maintains a searchable archive of preprints since 1972. Full-text of preprints from 1995 to present are currently available.', 'http://fnalpubs.fnal.gov/preprints.html', 'http://www-spires.fnal.gov/spires/find/hep/wwwscan?subfile=wwwhepau&submit=Browse&rawcmd={$formKeywords}', NULL, 5),
(1154, 219, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 6),
(1155, 219, 'NASA Technical Reports Server', 'NASA Technical Reports Server allows users to search available online NASA published documents, including meeting presentations, journal articles, conference proceedings, and technical reports. Many documents are available in compressed PostScript and PDF formats. All documents are unclassified and publicly available.', 'http://ntrs.nasa.gov/index.jsp?method=aboutntrs', 'http://ntrs.nasa.gov/search.jsp?N=0&Ntk=all&Ntx=mode%20matchall&Ntt={$formKeywords}', NULL, 7),
(1156, 219, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 8),
(1157, 219, 'SPIRES', 'SPIRES provides search more than 450,000 high-energy physics related articles, including journal papers, preprints, e-prints, technical reports, conference papers and theses.', 'http://www.slac.stanford.edu/spires/hep/', 'http://www.slac.stanford.edu/spires/find/hep/www?TITLE=&C=&REPORT-NUM=&AFFILIATION=&cn=&k=&cc=&eprint=+&eprint=&topcit=&url=&J=+&*=&ps=+&DATE=&*=+&FORMAT=WWW&SEQUENCE=&AUTHOR={$formKeywords}', NULL, 9),
(1158, 219, 'HighWire', 'HighWire contains 11,785,877 articles in over 4,500 Medline journals, as well as 404,484 free full text articles from 322 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?andorexactfulltext=and&resourcetype=1&src=hw&fulltext=&pubdate_year=&volume=&firstpage=&disp_type=&author1={$formKeywords}', NULL, 10),
(1159, 220, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(1160, 220, 'Eric Weisstein''s World of Physics', 'Online encyclopedia of physics terms and formulas. Full searchable, and also browsable alphabetically and by topic. Part of Eric''s Treasure Troves of Science.', 'http://scienceworld.wolfram.com/physics/', 'http://scienceworld.wolfram.com/search/?q={$formKeywords}', NULL, 1),
(1161, 220, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 2),
(1162, 220, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 3),
(1163, 220, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(1164, 220, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(1165, 221, 'Fermilab Preprint Server search engine', 'Fermilab Preprint Server search engine maintains a searchable archive of preprints since 1972. Full-text of preprints from 1995 to present are currently available.', 'http://lss.fnal.gov/ird/preprints.html', 'http://www-spires.fnal.gov/spires/find/hep/wwwbrief?r=fermilab&AUTHOR=&r=&REPORT-NUM=&r=&DATE=&*=+&r=fermilab&format=wwwbrief&TITLE={$formKeywords}', NULL, 0),
(1166, 221, 'Intute: Science, Engineering & Technology', 'Intute: Science, Engineering and Technology is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists. It covers the physical sciences, engineering, computing, geography, mathematics and environmental science. The database currently contains 33349 records.', 'http://www.intute.ac.uk/sciences/', 'http://www.intute.ac.uk/sciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=sciences&term1={$formKeywords}', NULL, 1),
(1167, 221, 'DOE Information Bridge', 'The Information Bridge provides the open source to full-text and bibliographic records of Department of Energy (DOE) research and development reports in physics, chemistry, materials, biology, environmental sciences, energy technologies, engineering, computer and information science, renewable energy, and other topics.', 'http://www.osti.gov/bridge/index.jsp', 'http://www.osti.gov/bridge/basicsearch.jsp?act=Search&formname=basicsearch.jsp&review=1&SortBy=RELV&SortOrder=DESC&querytype=search&searchFor={$formKeywords}', NULL, 2),
(1168, 221, 'GrayLIT Network', 'GrayLIT Network provides a full-text search across the gray literature of multiple government agencies within a science portal of technical reports. It taps into the search engines of distributed gray literature collections, enabling the user to find information without first having to know the sponsoring agency.', 'http://graylit.osti.gov/', 'http://graylit.osti.gov/cgi-bin/dexplcgi', 'pp=all&INTERFACE=1WINDOW&FORM=DistributedSearch.html&COLLECTION=dticft&COLLECTION=jpl&COLLECTION=gpoinfo&COLLECTION=langley&MAXDOCS=50&QUERY={$formKeywords}', 3),
(1169, 221, 'NASA Technical Reports Server', 'NASA Technical Reports Server allows users to search available online NASA published documents, including meeting presentations, journal articles, conference proceedings, and technical reports. Many documents are available in compressed PostScript and PDF formats. All documents are unclassified and publicly available.', 'http://ntrs.nasa.gov/index.jsp?method=aboutntrs', 'http://ntrs.nasa.gov/search.jsp?N=0&Ntk=all&Ntx=mode%20matchall&Ntt={$formKeywords}', NULL, 4),
(1170, 221, 'Physics Documents Worldwide (PhysDoc)', 'Physics Documents Worldwide (PhysDoc) offers lists of links to document sources, such as preprints, research reports, annual reports, and list of publications of worldwide distributed physics institutions and individual physicists, ordered by continent, country and town.', 'http://physnet.uni-oldenburg.de/PhysNet/physdoc.html#search', 'http://www.physnet.de/PhysNet/physdocsearch.html?errorflag=0&caseflag=on&wordflag=on&maxobjflag=200&opaqueflag=on&descflag=on&csumflag=off&verbose=off&broker=PhysDoc&domain=physnet.de&query={$formKeywords}', NULL, 5),
(1171, 221, 'CiteSeer', 'CiteSeer makes available a broad, fully indexed, database of research papers from the various computer science fields.', 'http://citeseer.ist.psu.edu/cs', 'http://citeseer.ist.psu.edu/cs?submit=Search+Documents&cs=1&q={$formKeywords}', NULL, 6),
(1172, 221, 'CERN Document Server', 'Over 650,000 bibliographic records, including 320,000 fulltext documents, of interest to people working in particle physics and related areas. Covers preprints, articles, books, journals, photographs, and much more.', 'http://cdsweb.cern.ch/?ln=en', 'http://cdsweb.cern.ch/search.py?sc=1&ln=en&f=&cc=CERN+Document+Server&c=Articles+%26+Preprints&c=Books+%26+Proceedings&c=Presentations+%26+Talks&c=Periodicals+%26+Progress+Reports&c=Multimedia+%26+Outreach&c=Archives&p={$formKeywords}', NULL, 7),
(1173, 221, 'HighWire', 'HighWire contains 11,785,877 articles in over 4,500 Medline journals, as well as 404,484 free full text articles from 322 HighWire-based journals.', 'http://highwire.stanford.edu/', 'http://highwire.stanford.edu/cgi/searchresults?author1=&pubdate_year=&volume=&firstpage=&src=hw&hits=10&hitsbrief=25&resourcetype=1&andorexactfulltext=and&fulltext={$formKeywords}', NULL, 8),
(1174, 222, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(1175, 222, 'National Academy Press(NAP)', 'The National Academy Press (NAP) publishes over 200 books a year on a wide range of topics in science, engineering, and health, capturing the most authoritative views on important issues in science and health policy.', 'http://books.nap.edu/books/0309070317/html/177.html', 'http://search.nap.edu/nap-cgi/napsearch.cgi?term={$formKeywords}', NULL, 1),
(1176, 222, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 2),
(1177, 222, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 3),
(1178, 222, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 4),
(1179, 223, 'Physics Today Events Calendar', 'Events such as conferences and meetings collected by Physics Today.', 'http://www.aip.org/cal/eventhome.jsp', 'http://www.aip.org/cal/results.jsp?category=&country=&month=&year=2006&image2.x=30&image2.y=6&subject={$formKeywords}', NULL, 0),
(1180, 223, 'PhysicsWeb - Calendar', 'PhysicsWeb - Calendar provides information on physics conferences, workshops, and summer schools.', 'http://www.physicsweb.org/events/', 'http://physicsworld.com/cws/Search.do?section=events&query={$formKeywords}', NULL, 1),
(1181, 224, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(1182, 224, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(1183, 224, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(1184, 224, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(1185, 225, 'The Open Video Project', 'The Open Video project is a collection of public domain digital video available for research and other purposes.  The purpose of the Open Video Project is to collect and make available a repository of digitized video content for the digital video, multimedia retrieval, digital library, and other research communities.', 'http://www.open-video.org/index.php', 'http://www.open-video.org/results.php?search_field=all&terms={$formKeywords}', NULL, 0),
(1186, 226, 'PhysLink.com Astronomy Education Resources', 'The PhysLink.com is a comprehensive physics and astronomy online education, research and reference web site.  Contains links to related news, jobs, societies, reference sources, scientific journals, and high-tech companies.', 'http://www.physlink.com/Education/Astronomy.cfm', 'http://physlink.master.com/texis/master/search/?s=SS&q={$formKeywords}', NULL, 0);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(1187, 226, 'Science, Mathematics, Engineering and Technology Education (SMETE)', 'Science, Mathematics, Engineering and Technology Education (SMETE) contains a searchable working prototype of a National Science, Mathematics, Engineering, and Technology Education Digital Library.', 'http://www.smete.org/', 'http://www.smete.org/smete/?path=/public/find/search_results.jhtml&_DARGS=/smete/public/find/index_body.jhtml&/smete/forms/FindLearningObjects.operation=search&_D:/smete/forms/FindLearningObjects.operation=%20&_D:/smete/forms/FindLearningObjects.keyword=%20&/smete/forms/FindLearningObjects.learningResourceType=&_D:/smete/forms/FindLearningObjects.learningResourceType=%20&/smete/forms/FindLearningObjects.grade=0-Any&_D:/smete/forms/FindLearningObjects.grade=%20&/smete/forms/FindLearningObjects.title=&_D:/smete/forms/FindLearningObjects.title=%20&/smete/forms/FindLearningObjects.author=&_D:/smete/forms/FindLearningObjects.author=%20&/smete/forms/FindLearningObjects.hostCollection=&_D:/smete/forms/FindLearningObjects.hostCollection=%20&/smete/forms/FindLearningObjects.afterYear=&_D:/smete/forms/FindLearningObjects.afterYear=%20&/smete/forms/FindLearningObjects.beforeYear=&_D:/smete/forms/FindLearningObjects.beforeYear=%20&&/smete/forms/FindLearningObjects.keyword={$formKeywords}', NULL, 1),
(1188, 227, 'CERN Document Server (CDS)', 'Over 650,000 bibliographic records, including 320,000 fulltext documents, of interest to people working in particle physics and related areas. Covers preprints, articles, books, journals, photographs, and much more.', 'http://cdsweb.cern.ch/', 'http://cdsweb.cern.ch/search.py?f=&c=&p={$formKeywords}', NULL, 0),
(1189, 228, 'Nature Physics Portal', 'The Nature physics portal is a one-stop resource for physicists, providing highlights of the latest research in Nature and elsewhere.  Nature Physics Portal online contains the physics content of the current issue, including Articles, Letters to Nature, Brief Communications, News and Views and portal extras.', 'http://www.nature.com/physics/index.html', 'http://search.nature.com/search/?sp-a=sp1001702d&sp-sfvl-field=subject%7Cujournal&sp_t=results&sp_q_1=Physics&sp-x-2=ujournal&sp-p-2=phrase&sp-x-1=subject&sp-p-1=phrase&sp-q={$formKeywords}', NULL, 0),
(1190, 229, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(1191, 229, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple&pg=q&enc=iso88591&site=main&bridge=&stt=&lowercaseq=&what=web&user=searchintranet&browser=N6E&kl=XX&op=a&q={$formKeywords}', NULL, 1),
(1192, 229, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 2),
(1193, 229, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 3),
(1194, 229, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 4),
(1195, 229, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 5),
(1196, 229, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 6),
(1197, 229, 'FYI: The AIP Bulletin of Science Policy News', 'FYI: The AIP Bulletin of Science Policy News summarizes science policy developments in Washington, D.C. affecting the physics and astronomy community. Summaries are approximately one page long and are issued two or more times every week.', 'http://www.aip.org/enews/fyi/searchfyi.html', 'http://www.aip.org/servlet/Searchfyi?collection=K2NEWFYI&filename=%2Fweb2%2Faipcorp%2Ffyi%2F2004&SEARCH-97.x=64&SEARCH-97.y=18&queryText={$formKeywords}', NULL, 7),
(1198, 229, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=2&y=8&mw0={$formKeywords}', NULL, 8),
(1199, 229, 'Canada Sites', 'Canada Sites provides an information and services gateway run by the Government of Canada and each of the provinces.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 9),
(1200, 230, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0),
(1201, 230, 'Daily Science News from NewScientist', 'Daily Science News from NewScientist provides science news updated throughout the day.', 'http://www.newscientist.com/', 'http://www.newscientist.com/search.ns?doSearch=true&query={$formKeywords}', NULL, 1),
(1202, 230, 'Physics News Update: AIP Bulletin of Physics News', 'Physics News Update: AIP Bulletin of Physics News is a digest of physics news items arising from physics meetings, physics journals, newspapers and magazines, and other news sources. Subscriptions are free as a way of broadly disseminating information about physics and physicists.', 'http://www.aip.org/physnews/update/', 'http://www.aip.org/servlet/Searchphys?SearchPage=%2Fphysnews%2Fupdate%2Fsearch.htm&collection=K2PHYSNEWS&queryText={$formKeywords}', NULL, 2),
(1203, 230, 'Science News Online', 'Science News Online is one of the most useful science news magazines available online. The 75 year old weekly is putting a generous number of full-text articles on the Web each week, adding to a collection of articles archived from 1994 to the present.', 'http://www.sciencenews.org/search.asp', 'http://www.sciencenews.org/pages/search_results.asp?search={$formKeywords}', NULL, 3),
(1204, 230, 'Scientific American Archive', 'Scientific American Archive is the online science and technology resource offering access to every page and every issue of Scientific American magazine from 1993 to the present.', 'http://www.sciamdigital.com/', 'http://www.sciamdigital.com/index.cfm?fa=Search.ViewSearchForItemResultList&AUTHOR_CHAR=&TITLE_CHAR=&FullText_CHAR={$formKeywords}', NULL, 4),
(1205, 230, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 5),
(1206, 231, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(1207, 231, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(1208, 231, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(1209, 231, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3),
(1210, 232, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=eng&as_sauthors={$formKeywords}', NULL, 0),
(1211, 232, 'OAIster (Open Archives Initiative research databases)', 'OAIster is a project of the University of Michigan Digital Library Production Services, and provides searching a wide variety of collections from a wide variety of institutions. These institutions have made the records of their digital resources available to access, and the project team has gathered and aggregated them into the OAIster service.', 'http://oaister.umdl.umich.edu/', 'http://oaister.umdl.umich.edu/cgi/b/bib/bib-idx?type=boolean&size=10&c=oaister&q1=&rgn1=entire+record&op2=and&q2=&rgn2=entire+record&op3=And&q3=&rgn3=title&op4=And&rgn4=author&op5=And&q5=&rgn5=subject&op6=And&rgn6=norm&q6=all+types&sort=author%2Fcreator&submit2=search&q4={$formKeywords}', NULL, 1),
(1212, 232, 'Public Knowledge Project Open Archives Harvester', 'The PKP Open Archives Harvester is a free metadata indexing system developed by the Public Knowledge Project through its federally funded efforts to expand and improve access to research. The PKP OAI Harvester allows you to create a searchable index of the metadata from Open Archives Initiative-compliant archives, such as sites using Open Journal Systems or Open Conference Systems.', 'http://pkp.sfu.ca/harvester/', 'http://pkp.sfu.ca/harvester/search.php?limit=author&query={$formKeywords}', NULL, 2),
(1213, 232, 'Find articles', 'Provides citations, abstracts and fulltext articles for over 300 magazines and journals on topics such as business, health, society, entertainment and sports.', 'http://www.findarticles.com/PI/index.jhtml', 'http://www.findarticles.com/cf_0/PI/search.jhtml?magR=all+magazines&key={$formKeywords}', NULL, 3),
(1214, 232, 'H-Net Reviews', 'H-Net Reviews in the Humanities and Social Sciences is an online scholarly review resource. reviews are published online via discussion networks and the H-Net web site. This permits our reviews to reach scholars with a speed unmatched in any other medium. It also makes a new kind of interactivity possible, as reviewers, authors and readers engage in discussions of the reviews online. Through the power of e-mail and the web H-Net has helped pioneer online scholarly reviewing.', 'http://www2.h-net.msu.edu/reviews/', 'http://www2.h-net.msu.edu/reviews/search.cgi?maxlines=25&maxfiles=25&all=all&query={$formKeywords}', NULL, 4),
(1215, 232, 'Intute: Social Sciences', 'Intute: Social Sciences is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 5),
(1216, 232, 'SocioSite', 'SocioSite gives access to the worldwide scene of social sciences. The intention is to provide a comprehensive listing of all sociology resources on the Internet.', 'http://www.pscw.uva.nl/sociosite/', 'http://www.google.com/u/sociosite?sa=sociosite&domains=www2.fmg.uva.nl&sitesearch=www2.fmg.uva.nl&hq=inurl:www2.fmg.uva.nl/sociosite&q={$formKeywords}', NULL, 6),
(1217, 232, 'Voice of the Shuttle', 'Voice of the Shuttle emphasizes both primary and secondary (or theoretical) resources of American literature, including links of syllabi, electronic journals and newsgroups.', 'http://vos.ucsb.edu/', 'http://vos.ucsb.edu/search-results.asp?Submit=Go&search={$formKeywords}', NULL, 7),
(1218, 233, 'Google', 'Search for definitions using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?hl=en&q=define%3A{$formKeywords}', NULL, 0),
(1219, 233, 'Online Dictionary of the Social Sciences', 'Online Dictionary of the Social Sciences is a searchable dictionary of terms commonly used in the social sciences. Both phrase and keyword searches are facilitated.', 'http://bitbucket.icaap.org/', 'http://bitbucket.icaap.org/dict.pl?fuzzy={$formKeywords}', NULL, 1),
(1220, 233, 'OneLook Dictionaries', 'OneLook is a meta-dictionary. Enter an English language word or acronym, and OneLook will search its index of 5,292,362 words in 934 dictionaries indexed in general and special interest dictionaries for the definition.', 'http://www.onelook.com/index.html', 'http://www.onelook.com/?ls=a&w={$formKeywords}', NULL, 2),
(1221, 233, 'Merriam-Webster Online', 'A dictionary based on the Webster 10th Collegiate edition, 1993, with updates added annually. More than 160,000 entries. Each word is accompanied by definition, pronunciation, usage, grammatical function, and a brief etymology. Includes a thesaurus. Misspellings return suggested spellings. The dictionary''s search system supports internal wildcards and right hand truncation searching. Includes an extensive pronunciation guide and sound files for the pronunciation of many terms.', 'http://www.merriam-webster.com/', 'http://www.merriam-webster.com/cgi-bin/dictionary?book=Dictionary&va={$formKeywords}', NULL, 3),
(1222, 233, 'Wikipedia: The Free Encyclopedia', '"Wikipedia is a free content encyclopedia that is being written collaboratively by contributors from all around the world. The site is a WikiWiki, meaning that anyone ... can edit any article. ..." Without editorial oversight, the quality of the content on this site varies dramatically, but it is worth exploring. The English version has hundreds of thousands of entries. Spanish, French, and Esperanto are among the several other languages offered.', 'http://en.wikipedia.org/wiki/Main_Page', 'http://en.wikipedia.org/wiki/Special:Search?go=Go&fulltext=Search&search={$formKeywords}', NULL, 4),
(1223, 233, 'Infoplease.com', 'This site includes contents of the Information Please Almanacs, a biography database, a dictionary, an atlas, and articles from the Columbia Encyclopedia. You can search these ready reference works together or separately or browse the Almanacs. There are feature stories each week covering topics in the news, with links to pertinent Almanac content and other Web resources.', 'http://www.infoplease.com', 'http://www.infoplease.com/search?fr=iptn&in=all&x=0&y=0&query={$formKeywords}', NULL, 5),
(1224, 234, 'CIAO (Columbia International Affairs Online)', 'Established as a collaboration between the Columbia University libraries and Columbia University Press with a grant from the Andrew W. Mellon Foundation, CIAO comprises a collection of theory and research materials in the field of international affairs. Working papers from university research institutes, policy briefs, country data, journal abstracts, and conference proceedings, all from 1991 - present, are among the materials available from this resource.', 'http://www.ciaonet.org/', 'http://usearch.cc.columbia.edu/ciao/query.html?qp=url%3Awps&qp=url%3Aolj&qp=url%3Apbei&qp=url%3Abook&qp=url%3Acasestudy&op1=%2B&fl1=&ty1=w&tx1=&dt=in&inthe=2147483647&op0=&fl0=&ty0=w&qt=&ht=0&qp=&qs=&col=ciao&qc=ciao&pw=100%25&ws=0&la=en&qm=0&st=1&nh=25&lk=1&rf=0&oq=&rq=0&si=0&ql=a&x=34&y=8&tx0={$formKeywords}', NULL, 0),
(1225, 234, 'Find articles', 'Provides citations, abstracts and fulltext articles for over 300 magazines and journals on topics such as business, health, society, entertainment and sports.', 'http://www.findarticles.com/PI/index.jhtml', 'http://www.findarticles.com/cf_0/PI/search.jhtml?magR=all+magazines&key={$formKeywords}', NULL, 1),
(1226, 234, 'H-Net Reviews', 'H-Net Reviews in the Humanities and Social Sciences is an online scholarly review resource. reviews are published online via discussion networks and the H-Net web site. This permits our reviews to reach scholars with a speed unmatched in any other medium. It also makes a new kind of interactivity possible, as reviewers, authors and readers engage in discussions of the reviews online. Through the power of e-mail and the web H-Net has helped pioneer online scholarly reviewing.', 'http://www2.h-net.msu.edu/reviews/', 'http://www2.h-net.msu.edu/reviews/search.cgi?maxlines=25&maxfiles=25&all=all&query={$formKeywords}', NULL, 2),
(1227, 234, 'Intute: Social Sciences', 'Intute: Social Sciences is a free online service providing you with access to the very best Web resources for education and research, evaluated and selected by a network of subject specialists.', 'http://www.intute.ac.uk/socialsciences//', 'http://www.intute.ac.uk/socialsciences/cgi-bin/search.pl?submit.x=0&submit.y=0&submit=Go&limit=0&subject=socialsciences&term1={$formKeywords}', NULL, 3),
(1228, 234, 'SocioSite', 'SocioSite gives access to the worldwide scene of social sciences. The intention is to provide a comprehensive listing of all sociology resources on the Internet.', 'http://www.pscw.uva.nl/sociosite/', 'http://www.google.com/u/sociosite?sa=sociosite&domains=www2.fmg.uva.nl&sitesearch=www2.fmg.uva.nl&hq=inurl:www2.fmg.uva.nl/sociosite&q={$formKeywords}', NULL, 4),
(1229, 234, 'Voice of the Shuttle', 'Voice of the Shuttle emphasizes both primary and secondary (or theoretical) resources of American literature, including links of syllabi, electronic journals and newsgroups.', 'http://vos.ucsb.edu/', 'http://vos.ucsb.edu/search-results.asp?Submit=Go&search={$formKeywords}', NULL, 5),
(1230, 235, 'Anthropology Review Databases (ARD)', 'The Anthropology Review Databases is intended to improve the level of access of anthropologists to anthropological literature by making them more aware of what is being published and helping them to evaluate its relevance to their own interests.', 'http://wings.buffalo.edu/ARD/', 'http://wings.buffalo.edu/ARD/cgi/search.cgi?authors=&subject=&date1=&date2=&medium=&reviewer=&title={$formKeywords}', NULL, 0),
(1231, 235, 'Books-on-Law', 'Books-on-Law reviewing new and forthcoming scholarly and trade books related to law; from JURIST: The Law Professors'' Network', 'http://jurist.law.pitt.edu/lawbooks/', 'http://search.freefind.com/find.html?id=9814374&pageid=r&mode=ALL&query={$formKeywords}', NULL, 1),
(1232, 235, 'Law and Politics Book reviews', 'The Law and Politics Book reviews is sponsored by the Law and Courts Section of the American Political Science Association. The electronic medium enables us to review almost every book about the legal process and politics, to do longer reviews than are usually published, and to make the reviews available within six months of our receipt of the book.', 'http://www.bsos.umd.edu/gvpt/lpbr/', 'http://www.searchum.umd.edu/search?btnG=Search&output=xml_no_dtd&proxystylesheet=UMCP&as_sitesearch=http://www.bsos.umd.edu/gvpt/lpbr&client=UMCP&site=UMCP&q={$formKeywords}', NULL, 2),
(1233, 236, 'Ingenta', 'Ingenta restricts access to full text articles. Although access to the full text costs money, the site can be used as a free index.', 'http://www.ingenta.com/', 'http://www.ingenta.com/isis/searching/Search/ingenta?database=1&title={$formKeywords}', NULL, 0),
(1234, 236, 'ebrary', 'Independent researchers who do not have access to ebrary?s databases through their library may now set up an individual account for as little as $5. ebrary Discover spans multiple academic disciplines and provides anytime, anywhere access to over 20,000 authoritative titles including books in full-text, sheet music, reports and other authoritative documents from more than 175 leading publishers such as Cambridge University Press, Random House, Inc., and The McGraw-Hill Companies.', 'http://www.ebrary.com/corp/content.htm', 'http://shop.ebrary.com/Top?layout=search&f00=text&p01=&f01=subject&d=journal&l=en&sch=%A0%A0%A0%A0%A0Search%A0%A0%A0%A0%A0&frm=adv.x&p00={$formKeywords}', NULL, 1),
(1235, 236, 'Questia', 'Questia provides access to over 47,000 books and 375,000 journal, magazine, and newspaper articles. All books and articles are available in their entirety - search every page. The subscription rate is ranging from 19.05 per month to 119.95 per year.', 'http://www.questia.com/', 'http://www.questia.com/SM.qst?act=search&keywordsSearchType=1000&mediaType=book&mediaType=journal&mediaType=magazine&mediaType=newspaper&mediaType=encyclopedia&mediaType=startpage&keywords={$formKeywords}', NULL, 2),
(1236, 236, 'Wiley InterScience Pay-per-view Service', 'Wiley InterScience Pay-per-view affords instant, full-text access to an extensive collection of journal articles or book chapters available on Wiley InterScience without the need for a subscription. This service allows anyone to purchase access to individual journal articles or book chapters directly by using a credit card. Access is instant and available for 24 hours.', 'http://www3.interscience.wiley.com/aboutus/ppv-articleselect.html', 'http://www3.interscience.wiley.com/search/allsearch', 'allContentSearchForm=&mode=quicksearch&WISindexid1=WISall&WISsearch1={$formKeywords}', 3),
(1237, 237, 'The Gallup Organization', 'The Gallup site allows for topic keyword searches and also has a topic index, listing major issues such as Abortion, Campaign Finance, Illegal Drugs, and Taxes, with retrospective poll results, sometimes dating back to the 1950s, included for each.', 'http://www.gallup.com/', 'http://www.gallup.com/search/results.aspx?SearchConType=&SearchTypeAll=any&SearchTypeExa=any&SearchTypeAny=any&SearchTypeNon=any&SearchTextExa=&SearchTextAny=&SearchTextNon=&SearchSiteInd=&SearchSiteAll=&SearchDateBef=&SearchDateAft=&SearchDateBMo=&SearchDateAMo=&SearchDateBDa=&SearchDateADa=&SearchDateBYe=&SearchDateAYe=&SearchTextAll={$formKeywords}', NULL, 0),
(1238, 237, 'Public Agenda Online', 'Sponsored by fourteen public service-oriented foundations, Public Agenda Online offers 21 issue guides for such topics as Abortion, Crime, the Federal Budget, Race, and Welfare. Analytical essays, summaries of news articles, and graphs representing poll results enhance Public Agenda''s extensive coverage of each topic.', 'http://www.publicagenda.org/', 'http://www.publicagenda.org/search/search_details.cfm', 'StartRow=1&searchstring={$formKeywords}', 1),
(1239, 237, 'PollingReport.com', 'PollingReport.com is an independent, nonpartisan resource on trends in American public opinion.', 'http://www.pollingreport.com/', 'http://www.pollingreport.com/_vti_bin/shtml.exe/search.htm', 'VTI-GROUP=0&search={$formKeywords}', 2),
(1240, 238, 'Inter-university Consortium for Political and Social Research (ICPSR)', 'Inter-university Consortium for Political and Social Research (ICPSR) contains social data archives include nearly 5,000 titles and over 45,000 individual files over 300 institutions in the world.', 'http://www.icpsr.umich.edu/', 'http://search.icpsr.umich.edu/ICPSR/query.html?nh=25&rf=3&ws=0&op0=%2B&fl0=&ty0=w&col=abstract&col=series&col=uncat&op1=-&tx1=restricted&ty1=w&fl1=availability%3A&op2=%2B&tx2=ICPSR&ty2=w&fl2=archive%3A&tx0={$formKeywords}', NULL, 0),
(1241, 238, 'The OECD Statistics Portal', 'The OECD Statistics Portal collects the statistics needed for its analytical work from statistical agencies of its Member countries. The OECD promotes and develops international statistical standards and co-ordinates statistical activities with other international agencies.', 'http://www.oecd.org/statsportal/0,2639,en_2825_293564_1_1_1_1_1,00.html', 'http://www.oecd.org/searchResult/0,2665,en_2825_293564_1_1_1_1_1,00.html?searchText=&fpDepartment=293564&fpSearchExact=3&fpSearchText={$formKeywords}', NULL, 1),
(1242, 238, 'Australian Social Science Data Archive', 'ASSDA is a member of the International Federation of Data Organisations (IFDO) through which it maintains contacts with data organisations abroad actively engaged in providing the social science community with computerised data and documentation. Links to other data archives.', 'http://assda.anu.edu.au/', 'http://assda.anu.edu.au/htdig/htsearch?method=and&format=builtin-long&sort=score&config=assda&restrict=http://assda.anu.edu.au/&exclude=&words={$formKeywords}', NULL, 2),
(1243, 238, 'UK Data Archive', 'The Data Archive at the University of Essex houses the largest collection of accessible computer-readable data in the social sciences and humanities in the United Kingdom. It is a national resource centre, disseminating data throughout the United Kingdom and, by arrangement with other national archives, internationally. Founded in 1967, it now houses approximately seven thousand datasets of interest to researchers in all sectors and from many different disciplines.', 'http://www.data-archive.ac.uk/', 'http://www.data-archive.ac.uk/search/allSearch.asp?ct=xmlAll&zoom_and=1&q1={$formKeywords}', NULL, 3),
(1244, 238, 'Social Science Data on the Internet', 'Social Science Data on the Internet is an extensive collection of 873 Internet sites of numeric social science statistical data, data catalogs, data libraries, social science gateways, and financial and economic census files.', 'http://odwin.ucsd.edu/idata/', 'http://odwin.ucsd.edu/cgi-bin/easy_search2?print=notitle&file+Data+on+the+Net=%2Fdata%2Fdata.html&amp;skip=search.html&header=%2Fheader%2Fheader&search={$formKeywords}', NULL, 4),
(1245, 239, 'CTheory (Requires registration)', 'An international, electronic review of books on theory, technology and culture. Sponsored by the Canadian Journal of Political and Social Theory, reviews are posted periodically of key books in contemporary discourse as well as theorisations of major "event-scenes" in the mediascape.', 'http://www.ctheory.net/', 'http://www.google.com/search?q=site%3Awww.ctheory.net+{$formKeywords}', NULL, 0),
(1246, 240, 'Google Print', 'Google is working with libraries at the University of Michigan, Harvard University, Stanford University, Oxford University and the New York Public Library to digitize books in their collections and make them accessible via Google Print, a massive scanning project that will bring millions of volumes of printed books into the Google Print database.  Click a book title and you''ll see the page of the book that has your search terms, your can search for more information within that specific book, find reviews, find related information, learn about the publisher, buy this book, and find nearby libraries that have it.', 'http://print.google.com', 'http://print.google.com/print?q={$formKeywords}', NULL, 0),
(1247, 240, 'Online books Page', 'Online books Page, edited by John Mark Ockerbloom, at the University of Pennsylvania.  This is an excellent starting point in the search for full-text books on the Internet. Over 20,000 English works in various formats available online at different sites. Entries may be searched by author or title. An interesting feature allows browsing by Library of Congress call number categories. New listings are added regularly and are listed on a separate web page at <a href="http://onlinebooks.library.upenn.edu/new.html">http://onlinebooks.library.upenn.edu/new.html</a>.', 'http://digital.library.upenn.edu/books/', 'http://onlinebooks.library.upenn.edu/webbin/book/search?tmode=words&title={$formKeywords}', NULL, 1),
(1248, 240, 'Books-On-Line', 'A collection of over 32935 titles, although some are only excerpts. Browse by subject or search by author or title. Not all items are free.', 'http://www.books-on-line.com/', 'http://www.books-on-line.com/bol/KeyWordSearch.cfm?RowCount=50&Searchquery={$formKeywords}', NULL, 2),
(1249, 240, 'Universal Library', 'The Universal Library is considerably more involved, and more ambitious -- it has amassed a collection of 100,000 e-books (some of them from Project Gutenberg), and is aiming for 1 million e-books by the end of 2006.', 'http://tera-3.ul.cs.cmu.edu/', 'http://tera-3.ul.cs.cmu.edu/cgi-bin/DBscripts/advsearch_db.cgi?perPage=25&listStart=0&author1=&subject1=Any&year1=&year2=&language1=Any&scentre=Any&search=Search&title1={$formKeywords}', NULL, 3),
(1250, 241, 'Country Studies: Area Handbook Series', 'From the Library of Congress, this site provides extensive information on foreign countries.  The Country Studies Series presents a description and analysis of the historical setting and the social, economic, political, and national security systems and institutions of countries throughout the world.', 'http://lcweb2.loc.gov/frd/cs/cshome.html', 'http://search.loc.gov:8765/query.html?col=loc&qp=url%3A%2Frr%2Ffrd%2F&submit.x=11&submit.y=9&qt={$formKeywords}', NULL, 0),
(1251, 241, 'International Monetary Fund (IMF)', 'International Monetary Fund (IMF). Searchable and browsable database of IMF publications, including IMF Country Reports, Working Papers, Occasional Papers, and Policy Discussion Papers. Some reports listed on the site are not full-text but are available in print in the UCB main library.', 'http://www.imf.org/external/pubind.htm', 'http://www.imf.org/external/pubs/cat/shortres.cfm?auth_ed=&subject=&ser_note=All&datecrit=During&YEAR=Year&Lang_F=All&brtype=Date&submit=Search&TITLE={$formKeywords}', NULL, 1),
(1252, 241, 'Inter-American Development Bank Project Documents', 'Inter-American Development Bank Project Documents. Project documents from the Inter-American Development Bank, browseable by country and economic sector. Includes both proposed and approved projects.', 'http://www.iadb.org/exr/pic/index.cfm?language=english', 'http://search.iadb.org/search.asp?ServerKey=Primary&collection=newcoll&language=English&ResultTemplate=default1.hts&ResultStyle=normal&ViewTemplate=docview.hts&Querytext={$formKeywords}', NULL, 2),
(1253, 241, 'CIA World Fact Book', 'Unclassified since 1971, The Central Intelligence Agency''s annual World Fact Book provides a reliable resource for information on independent states, dependencies, areas of special sovereignty, uninhabitable regions, and oceans (a total of 267 entries). Each entry typically includes concise physical and demographic statistics, an economic overview, as well as communications, transportation, and military information.', 'https://www.cia.gov/library/publications/the-world-factbook/index.html', 'https://www.cia.gov/search?NS-search-page=results&NS-tocstart-pat=/text/HTML-advquery-tocstart.pat', 'NS-search-type=NS-boolean-query&NS-max-records=20&NS-sort-by=&NS-max-records=20&NS-collection=Everything&NS-query={$formKeywords}', 3),
(1254, 242, 'Australian Social Science Data Archive', 'ASSDA is a member of the International Federation of Data Organisations (IFDO) through which it maintains contacts with data organisations abroad actively engaged in providing the social science community with computerised data and documentation. Links to other data archives.', 'http://assda.anu.edu.au/', 'http://assda.anu.edu.au/htdig/htsearch?method=and&format=builtin-long&sort=score&config=assda&restrict=http://assda.anu.edu.au/&exclude=&words={$formKeywords}', NULL, 0),
(1255, 242, 'Social Science Research Network - SSRN (Austin, Texas, USA)', 'Social Science Research Network (SSRN) is devoted to the rapid worldwide dissemination of social science research and is composed of a number of specialized research networks in each of the social sciences.', 'http://www.ssrn.com/', 'http://papers.ssrn.com/sol3/results.cfm', 'searchTitle=Title&searchAbstract=Abstract&txtAuthorsFName=&txtAuthorsLName=&optionDateLimit=0&Form_Name=Abstract_Search&txtKey_Words={$formKeywords}', 1),
(1256, 242, 'SocioSite', 'SocioSite is a multi-purpose guide for sociologists. Based in the Netherlands, it includes useful links to sites around the world.', 'http://www2.fmg.uva.nl/sociosite/', 'http://www.google.com/search?q=site:www2%2Efmg%2Euva%2Enl%2Fsociosite%2F+', NULL, 2),
(1257, 242, 'Statistical Resources on the Web', 'This site, created and maintained by University of Michigan Documents Center, is organized by broad subject area, such as Foreign or Statistics, in order to facilitate research.', 'http://www.lib.umich.edu/govdocs/statsnew.html', 'http://www.google.com/u/umlib?hl=en&lr=&ie=ISO-8859-1&domains=www.lib.umich.edu&sitesearch=www.lib.umich.edu&q=inurl%3Agovdocs+-govdocs%2Fadnotes%2F+%0D%0A-govdocs%2Fgodort%2F&q={$formKeywords}', NULL, 3),
(1258, 243, 'H-Net Humanities and Social Sciences Online', 'H-Net Humanities and Social Sciences Online provides information and resources for all those interested in the Humanities and Social Sciences.', 'http://www.h-net.msu.edu/', 'http://www.h-net.org/logsearch/index.cgi?type=keyword&order=relevance&list=All+lists&hitlimit=25&smonth=00&syear=1989&emonth=11&eyear=2004&phrase={$formKeywords}', NULL, 0),
(1259, 243, 'Intute: Social Sciences - Conferences and Events', 'Intute: Social Sciences - Conferences and Events provides search of conferences and events for social sciences.', 'http://www.intute.ac.uk/socialsciences/conferences.html', 'http://www.intute.ac.uk/socialsciences/cgi-bin/conferences.pl?type=All+events&subject=All%7CAll+subjects&submit.x=0&submit.y=0&submit=Go&term={$formKeywords}', NULL, 1),
(1260, 243, 'Sociology Online', 'Sociology Online is a site for students of sociology, criminology and social theory. The site has slideshows, quizzes, and documents, as well as a Socio-News page.', 'http://www.sociologyonline.co.uk/', 'http://ccgi.sociologyonline.force9.co.uk/cgi-bin/site/searchnews.pl?dosearch', 'match=keywords&searchin=(All)&author=(All)&category=(All)&newsfrom=(All)&resultnumber=10&sort=new&multipage=on&linkcompression=10&highlight=on&searchquery={$formKeywords}', 2),
(1261, 243, 'Liszt', 'Liszt, hosted by Topica, is a free service that allows you to find, manage and participate in email lists and discussion groups in social sciences.', 'http://www.liszt.com/dir/?cid=0', 'http://www.liszt.com/search/?search_type=cat&amp;query={$formKeywords}', NULL, 3),
(1262, 244, 'The Australasian Legal Information Institute (AustLII)', 'Australasian Legal Information Institute (AustLII) provides free Internet access to Australian legal materials. AustLII''s broad public policy agenda is to improve access to justice through better access to information. To that end, it has become one of the largest sources of legal materials on the net, with over seven gigabytes of raw text materials and over 1.5 million searchable documents.', 'http://www.austlii.org/', 'http://www.austlii.edu.au/cgi-bin/sinocgi.cgi?method=any&meta=%2Fau&results=50&submit=Search&rank=on&callback=on&query={$formKeywords}', NULL, 0),
(1263, 244, 'The Legal Information Institute (US)', 'Legal Information Institute (US) is an extensive materials on the law that has overviews of more than 100 legal topics, including: links to the laws and related Web resources; Constitutions & Codes has both state and federal; Court Opinions, available judicial opinion, federal and state; Law by Source, federal, state, and international; Current Awareness includes Eye on the Courts (news on important court decisions); Directories, links to organizations and journals (law reviews); as well as directories of judges, lawyers, and law schools.', 'http://www.law.cornell.edu/', 'http://www.law.cornell.edu/wex/index.php/Special:Search?fulltext=Search&search={$formKeywords}', NULL, 1),
(1264, 244, 'The British and Irish Legal Information Institute (BAILII)', 'British and Irish Legal Information Institute (BAILII) provides access to the most comprehensive set of British and Irish primary legal materials that are available for free and in one place on the Internet. As of September 2001, BAILII included 19 databases covering 5 jurisdictions. The system contains over two gigabytes of legal materials and around 275,000 searchable documents with about 10 million internal hypertext links.', 'http://www.bailii.org/', 'http://www.bailii.org/cgi-bin/sino_search_1.cgi?sort=rank&method=boolean&highlight=1&mask_path=/&query={$formKeywords}', NULL, 2),
(1265, 244, 'CanLII', 'CanLII is a permanent resource in Canadian Law that was initially built as a prototype site in the field of public and free distribution of Canadian primary legal material.', 'http://www.canlii.org/en/index.html', 'http://www.canlii.org/eliisa/search.do?language=en&searchTitle=Search+all+CanLII+Databases&searchPage=eliisa%2FmainPageSearch.vm&id=&startDate=&endDate=&legislation=legislation&caselaw=courts&boardTribunal=tribunals&text={$formKeywords}', NULL, 3),
(1266, 244, 'The World Legal Information Institute (WorldLII)', 'The World Legal Information Institute (WorldLII) is a free, independent and non-profit global legal research facility.', 'http://www.worldlii.org/', 'http://www.worldlii.org/form/search/?method=any&meta=%2Fworldlii&results=50&submit=Search&rank=on&callback=on&query={$formKeywords}', NULL, 4),
(1267, 244, 'FindLaw', 'FindLaw is one of the best examples of a subject-specific metasite. More than just an extremely well-organized directory of selected Internet law resources, FindLaw also offers a search tool for legal Web pages, the largest free database of full-text Supreme Court cases, a search engine and directory of online law reviews, a collection of state codes, interactive continuing education courses, and legal online discussions.', 'http://www.findlaw.com/', 'http://lawcrawler.findlaw.com/scripts/lc.pl?submit=search&sites=findlaw.com&entry={$formKeywords}', NULL, 5),
(1268, 244, 'Jurist: The Law Professors'' Network', 'Jurist-Law professors on the web provides links to the home pages of over fifty law professors, to over fifty pre- and post-prints of articles (in nine subjects from business law to regulation), and to twenty meta-pages, maintained by law professors, on topics from administrative to tax law. Also included are a large list of online law course pages, three lectures, and pointers to other resources. Essentially an annotated tour through the law resources of the Internet conducted by professors of law.', 'http://www.law.pitt.edu/hibbitts/jurist.htm', 'http://www.picosearch.com/cgi-bin/ts.pl?index=110412&opt=ALL&SEARCH=Search+JURIST+5000&query={$formKeywords}', NULL, 6),
(1269, 245, 'Access to Australian Government Information and Services', 'The Australian Government Entry Point offers comprehensive and integrated access to Australian Government information and services.  You will find a concentrated body of Australian Government information through this site. <a href="http://www.australia.gov.au">www.australia.gov.au</a> currently signposts over 700 Australian Government web sites, indexes more than 5,000,000 pages and uses both metadata and full text indexing to ensure it is a comprehensive government portal.', 'http://www.fed.gov.au', 'http://govsearch.australia.gov.au/search/search.cgi?collection=gov&form=au&query=&query_phrase=&query_or=&query_not=&meta_f_sand=&scope=&fscope=512&num_ranks=20&chksummary=chksummary&query_and={$formKeywords}', NULL, 0),
(1270, 245, 'Government of Canada Publicatons', 'The Government of Canada Publications Web site provides a single window access to free and priced publications authored by Government of Canada departments. The database does not have every publication published from all departments. It does however, have over 100,000 publications listed and this number is increasing on a daily basis as this site continues to collaborate with author departments.', 'http://publications.gc.ca/helpAndInfo/abtpbs-e.htm', 'http://publications.gc.ca/control/quickPublicSearch?searchAction=2&termValue={$formKeywords}', NULL, 1),
(1271, 245, 'The Government of Canada', 'You can search across all government departments federal departments and agencies as well as provincial, territorial and municipal governments. There is a Departments and Agencies link, and the A to Z Index offers a keyword search to programmes and services. \n\nA recent development on Departmental sites is the inclusion of a "Proactive Disclosure" page, which outlines travel and hospitality expenses, disclosure of contracts, grants and awards. \n\nThe About Canada page includes links to Departments and Agencies, Structure of the Canadian Government, Commissions of Inquiry and more. \n\nIn addition to Department web sites, the government has been creating Portals which bring together information from across federal and provincial sources, and non-governmental organizations as well.', 'http://www.canada.gc.ca/main_e.html', 'http://search-recherche.gc.ca/cgi-bin/query?mss=canada%2Fen%2Fsimple.html&enc=iso88591&pg=q&kl=en&site=main&q={$formKeywords}', NULL, 2),
(1272, 245, 'Directgov', 'Directgov is a government service giving people access to the latest and widest range of public service information in one place on the Web and on Digital TV. Directgov uses the specifications formulated and consulted on through UK GovTalk.', 'http://www.direct.gov.uk', 'http://www.direct.gov.uk/AdvancedSearch/SearchResults/fs/en?NP=1&PO1=C&PI1=W&PF1=A&PG=1&RP=20&SC=__dgov_site&Z=1&PT1={$formKeywords}', NULL, 3),
(1273, 245, 'FirstGov', 'FirstGov (U.S. federal and state) is a public-private partnership, led by a cross-agency board.', 'http://www.firstgov.gov/', 'http://www.firstgov.gov/fgsearch/index.jsp?db=www-fed-all&st=AS&ms0=should&mt0=all&rn=2&parsed=true&x=5&y=16&mw0={$formKeywords}', NULL, 4),
(1274, 245, 'Info4local.gov.uk', 'Information for local government from central government.  This site gives local authorities a quick and easy way to find relevant information on the web sites of central government departments, agencies and public bodies. It includes extensive information on implementing electronic government.', 'http://www.info4local.gov.uk', 'http://www.info4local.gov.uk/?view=Search+results&subjects=all&departmentsIds=0&informationTypesIds=all&query={$formKeywords}', NULL, 5),
(1275, 245, 'The New Zealand government portal', 'The New Zealand government portal is a website providing search capability for, and links into the online and offline information and services of most government agencies.  This site is managed and maintained by the State Services Commission, a New Zealand government department.', 'http://www.govt.nz', 'http://www.govt.nz/search?type=spider&t=spider&q={$formKeywords}', NULL, 6),
(1276, 245, 'Europa', 'Current information on the member countries of the European Union, including statistical data, policies, news, official documents, legal texts, and other publications.', 'http://europa.eu.int/index_en.htm', 'http://europa.eu.int/geninfo/query/resultaction.jsp?page=1', 'Collection=EuropaFull&ResultTemplate=/result_en.jsp&ResultCount=25&qtype=simple&ResultMaxDocs=200&DefaultLG=en&QueryText={$formKeywords}', 7),
(1277, 245, 'The Global Legal Information Network (GLIN)', 'The Global Legal Information Network (GLIN) is a database of laws, regulations, judicial decisions, and other complementary legal sources contributed by governmental agencies and international organizations. These GLIN members contribute the official full texts of published documents to the database in their original language. Each document is accompanied by a summary in English and subject terms selected from the multilingual index to GLIN.', 'http://www.glin.gov', 'http://www.glin.gov/search.do?refineQuery=&offset=0&refineQueryType=&fromSearch=true&queryType=ALL&searchBtn=Search&includeAllFields=on&searchAll=on&sumLanguage=any&pubLanguage=any&pubJurisdiction=any&publicationJurisdictionExclude=false&searchPublicationDate=true&dateFromDay=01&dateFromMonth=01&dateFromYear=&dateToDay=01&dateToMonth=01&dateToYear=&subjTerm=&subjTermConjunction%5B0%5D=AND&subjTerm=&subjTermConjunction%5B1%5D=AND&subjTerm=&subjTermConjunction%5B2%5D=AND&subjTerm=&subjTermConjunction%5B3%5D=AND&subjTerm=&searchOrder=default&hitsPerPage=10&showSummary=on&queryString={$formKeywords}', NULL, 8),
(1278, 245, 'Eur-Lex -- The portal to European Union law', 'Eur-Lex (European Union Law). Free service with access to the The Official Journal of the European Union, full-text of EU Treaties, consolidated versions of existing legislation and recent judgments by the Court of Justice.', 'http://europa.eu.int/eur-lex/en/index.html', 'http://europa.eu.int/search/s97.vts?Action=FilterSearch&COLLECTION=EURLEXfiles&Filter=EUROPA_filter.hts&ResultTemplate=eur-lex_res-en.hts&QueryMode=Simple&SearchPage=%2Feur-lex%2Fen%2Findex.html&SearchIn=http%3A%2F%2Feuropa.eu.int%2Feur-lex%2Fen&SortField=Score&SortOrder=desc&StartDate=&HTMLonly=&ResultCount=25&queryText={$formKeywords}', NULL, 9),
(1279, 245, 'Rulers', 'This site contains lists of heads of state and heads of government (and, in certain cases, de facto leaders not occupying either of those formal positions) of all countries and territories, going back to about 1700 in most cases. Also included are the subdivisions of various countries, recent foreign ministers of all countries, and a selection of international organizations, religious leaders and a chronicle of relevant events since 1996.', 'http://www.rulers.org/', 'http://www.google.com/search?q=site%3Arulers.org&q={$formKeywords}', NULL, 10),
(1280, 245, 'Thomas Legislative Information on the Internet', 'Through Thomas, the Library of Congress offers the text of bills in the United States Congress, the full text of the Congressional Record, House and Senate committee reports, and historical documents.', 'http://thomas.loc.gov/', 'http://thomas.loc.gov/cgi-bin/thomas', 'congress=109&database=text&MaxDocs=1000&querytype=phrase&Search=SEARCH&query={$formKeywords}', 11),
(1281, 246, 'Google News', 'Search news reports using the popular search engine Google''s news feature.', 'http://news.google.com/', 'http://news.google.com/news?hl=en&q={$formKeywords}', NULL, 0);
INSERT INTO `rt_searches` (`search_id`, `context_id`, `title`, `description`, `url`, `search_url`, `search_post`, `seq`) VALUES
(1282, 246, 'Globe and Mail', 'Globe and Mail, Toronto (last seven days)', 'http://www.globeandmail.com/', 'http://www.globeandmail.com/servlet/HTMLTemplate/search?tf=tgam/search/tgam/SearchResults.html&cf=tgam/search/tgam/SearchResults.cfg&current_row=1&start_row=1&num_rows=10&keywords={$formKeywords}', NULL, 1),
(1283, 246, 'People''s Daily', 'People''s Daily, China (January 1999-)', 'http://english.peopledaily.com.cn/', 'http://search.people.com.cn/was40/people/GB/english_index.jsp?type=1&channel=&Content=&searchword={$formKeywords}', NULL, 2),
(1284, 246, 'Mail & Guardian Newspaper', 'Mail & Guardian Newspaper, South Africa (1994-)', 'http://www.mg.co.za/', 'http://www.mg.co.za/mg_search_results.aspx?PrintEdition=PrintEdition&DailyNews=DailyNews&SearchSection=&StartDay=&StartMonth=&StartYear=&EndDay=&EndMonth=&EndYear=&keywords={$formKeywords}', NULL, 3),
(1285, 246, 'National Public Radio', 'National Public Radio, United States (unlimited)', 'http://www.npr.org/archives/', 'http://www.npr.org/search.php?text={$formKeywords}', NULL, 4),
(1286, 246, 'New York Times', 'New York Times, New York (last seven days)', 'http://www.nytimes.com/', 'http://query.nytimes.com/search/query?date=site1week&submit.x=1&submit.y=9&query={$formKeywords}', NULL, 5),
(1287, 246, 'The Japan Times Online', 'The Japan Times Online, Japan (January 1999-)', 'http://www.japantimes.co.jp/', 'http://www.google.co.jp/custom?domains=japantimes.co.jp&client=pub-4223870936880387&forid=1&ie=Shift_JIS&oe=Shift_JIS&term1=&cof=GALT%3A%23008000%3BGL%3A1%3BDIV%3A%23336699%3BVLC%3A663399%3BAH%3Acenter%3BBGC%3AFFFFFF%3BLBGC%3AFFFFFF%3BALC%3A0000FF%3BLC%3A0000FF%3BT%3A000000%3BGFNT%3A0000FF%3BGIMP%3A0000FF%3BLH%3A60%3BLW%3A200%3BL%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2Fimages%2Fheader_title.gif%3BS%3Ahttp%3A%2F%2Fwww.japantimes.co.jp%2F%3BFORID%3A1%3B&hl=ja&advancesearch=&q={$formKeywords}', NULL, 6),
(1288, 246, 'The Moscow Times', 'The Moscow Times, Russia (1994-)', 'http://www.moscowtimes.ru/doc/Search.html', 'http://www.moscowtimes.ru/cgi-bin/search?config=&exclude=&method=and&format=long&sort=score&matchesperpage=10&words={$formKeywords}', NULL, 7),
(1289, 246, 'Washington Post', 'Washington Post, Washington, DC (last two weeks)', 'http://www.washingtonpost.com/', 'http://www.washingtonpost.com/cgi-bin/search99.pl?searchsection=news&searchdatabase=news&x=11&y=8&searchtext={$formKeywords}', NULL, 8),
(1290, 246, 'Newsdirectory', 'Newsdirectory is a comprehensive and searchable guide to the world''s English-language online media. Currently over 8,000 newspapers and magazines are listed, as well as more than 1,000 U.S. television broadcasters.', 'http://www.newsdirectory.com/', 'http://ask.elibrary.com/search.asp?refid=NEWSD&datetype=all&srcmags=checked&srcnews=checked&srcbooks=checked&srctvrad=checked&query={$formKeywords}', NULL, 9),
(1291, 247, 'Google', 'Search using the popular Google search engine.', 'http://www.google.com/', 'http://www.google.com/search?q={$formKeywords}', NULL, 0),
(1292, 247, 'Google Scholar', 'Google Scholar enables specific searches of scholarly literature, including peer-reviewed papers, theses, books, pre-prints, abstracts, and technical reports. Content includes a range of publishers and aggregators with whom Google already has standing arrangements, e.g., the Association for Computing Machinery, IEEE, OCLC''s Open WorldCat library locator service, etc. Result displays will show different version clusters, citation analysis, and library location (currently books only).', 'http://scholar.google.com', 'http://scholar.google.com/scholar?ie=UTF-8&oe=UTF-8&hl=en&q={$formKeywords}', NULL, 1),
(1293, 247, 'Clusty the Clustering Engine', 'This search tool from Vivismo offers clustered results for a selection of searches.  Metasearch the whole web, or use tabs to search for news, gossip, images, orproducts via Bizrate or eBay.', 'http://clusty.com/about', 'http://clusty.com/search?query={$formKeywords}', NULL, 2),
(1294, 247, 'Vivisimo', 'The award-winning Vivisimo clustering technology, developed by Carnegie Mellon research scientists, is unlocking the value of stored information at Fortune 500 companies, top websites, prestigious publishers and government agencies by categorizing research results on the fly into meaningful orders, thus achieving breakthrough improvement in access to relevant information.', 'http://vivisimo.com', 'http://vivisimo.com/search?tb=homepage&v%3Asources=Web&query={$formKeywords}', NULL, 3);

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `rt_versions`
--

INSERT INTO `rt_versions` (`version_id`, `conference_id`, `version_key`, `locale`, `title`, `description`) VALUES
(1, 1, 'Agriculture', 'zh_TW', 'Agriculture', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(2, 1, 'Art_Architecture', 'zh_TW', 'Art & Architecture', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(3, 1, 'Astrophysics', 'zh_TW', 'Astrophysics', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(4, 1, 'Biology', 'zh_TW', 'Biology', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(5, 1, 'Business', 'zh_TW', 'Business', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(6, 1, 'Chemistry', 'zh_TW', 'Chemistry', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(7, 1, 'Cognitive_Science', 'zh_TW', 'Cognitive Science', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(8, 1, 'Computer_Science', 'zh_TW', 'Computer Science', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(9, 1, 'Economics', 'zh_TW', 'Economics', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(10, 1, 'Education', 'zh_TW', 'Education', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(11, 1, 'Environment', 'zh_TW', 'Environment', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(12, 1, 'General_Science', 'zh_TW', 'General Science', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(13, 1, 'Generic', 'zh_TW', 'Generic', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(14, 1, 'Humanities', 'zh_TW', 'Humanities', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(15, 1, 'Life_Sciences', 'zh_TW', 'Life Sciences', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(16, 1, 'Mathematics', 'zh_TW', 'Mathematics', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(17, 1, 'Music', 'zh_TW', 'Music', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(18, 1, 'Physics', 'zh_TW', 'Physics', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.'),
(19, 1, 'Social_Sciences', 'zh_TW', 'Social Sciences', 'The Reading Tools can help readers of this study consult a wide range of related resources that can provide a context for interpreting, situating and evaluating the study.');

-- --------------------------------------------------------

--
-- 資料表結構 `scheduled_tasks`
--

CREATE TABLE IF NOT EXISTS `scheduled_tasks` (
  `class_name` varchar(255) NOT NULL,
  `last_run` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `sched_confs`
--

INSERT INTO `sched_confs` (`sched_conf_id`, `conference_id`, `path`, `seq`, `start_date`, `end_date`) VALUES
(1, 1, 'iccisc', 1, NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `sched_conf_settings`
--

INSERT INTO `sched_conf_settings` (`sched_conf_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, '', 'numWeeksPerReview', '4', 'int'),
(1, '', 'paymentMethodPluginName', 'ManualPayment', 'string'),
(1, '', 'reviewDeadlineType', '4', 'int'),
(1, 'zh_TW', 'acronym', 'iccisc', 'string'),
(1, 'zh_TW', 'emailSignature', '________________________________________________________________________\n「2016社會變遷與當代議題-活躍老化」國際學術研討會 「2016社會變遷與當代議題-活躍老化」國際學術研討會\nhttp://localhost/ocs/index.php/iccisc/issisc/index', 'string'),
(1, 'zh_TW', 'submissionChecklist', 'a:7:{i:0;a:2:{s:7:"content";s:123:"本稿件從未出版過，同時也未曾在其他研討會中發表過 (或者提供相燈的解釋與說明給主編)。";s:5:"order";s:1:"1";}i:1;a:2:{s:7:"content";s:100:"本稿件的格式是以 OpenOffice, Microsoft Word, RTF, or WordPerfect 等的文件格式製作。";s:5:"order";s:1:"2";}i:2;a:2:{s:7:"content";s:129:"所有在文字中的連結 (例如 <a href="http://pkp.sfu.ca">http://pkp.sfu.ca</a>) 已經設定完成並可以正常運作。";s:5:"order";s:1:"3";}i:3;a:2:{s:7:"content";s:190:"文字內容為單行行距；使用12pt字體大小；採用斜體而不用底線 (除非是帶有網址)；而所有的圖解、圖示和表格都放在文中恰當位置，而非文末。";s:5:"order";s:1:"4";}i:4;a:2:{s:7:"content";s:207:"您可以在 <a href="http://localhost/ocs/index.php/iccisc/issisc/about/submissions#authorGuidelines">作者指引</a> 網頁中找到有關本研討會文章與文獻寫作格式與相關要求的說明。";s:5:"order";s:1:"5";}i:5;a:2:{s:7:"content";s:102:"如果是投稿至同儕匿名審查的主題，請於稿件中移除所有與作者有關的資訊。";s:5:"order";s:1:"6";}i:6;a:2:{s:7:"content";s:136:"如果是投稿到同儕匿名審查的稿件，所有稿件檔案 (包含補充檔案) 中關於作者的所有資訊都必須移除。";s:5:"order";s:1:"7";}}', 'object'),
(1, 'zh_TW', 'title', '「2016社會變遷與當代議題-活躍老化」國際學術研討會', 'string');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `sessions`
--

INSERT INTO `sessions` (`session_id`, `user_id`, `ip_address`, `user_agent`, `created`, `last_used`, `remember`, `data`) VALUES
('0crads1u8v1i0j8ie6a97m9314', NULL, '210.242.151.130', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/6.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; InfoPath.3)', 1452241543, 1452241543, 0, ''),
('14jqb87vcr471m72nn9kh44tn1', NULL, '223.140.11.125', 'Mozilla/5.0 (Linux; Android 5.0.2; HTC_B810x Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36', 1452241282, 1452241282, 0, ''),
('21q4cv2hf8c96v3rob9jqu1a11', NULL, '223.140.150.149', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_2 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Mobile/13C75 Safari Line/5.8.0', 1452269544, 1452269544, 0, ''),
('22u247270msvb1j66bo8gkneu5', NULL, '180.217.14.75', 'Mozilla/5.0 (Linux; Android 4.2.2; C2105 Build/15.3.A.1.14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36', 1452253536, 1452253642, 0, ''),
('3k73ouknsj3c6u4c15o8iajen3', NULL, '210.242.151.130', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 1452241619, 1452241619, 0, ''),
('5fbt9djk1b71n6i7ilr593pne4', NULL, '192.168.11.50', 'Mozilla/4.0 (compatible; MSIE 7.0; Windows NT 6.1; WOW64; Trident/7.0; SLCC2; .NET CLR 2.0.50727; .NET CLR 3.5.30729; .NET CLR 3.0.30729; Media Center PC 6.0; .NET4.0C; .NET4.0E)', 1452304761, 1452304761, 0, ''),
('5goq4tqu8eis28ppsklotcfnt7', NULL, '203.145.200.81', 'Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; WOW64; Trident/6.0)', 1452250536, 1452250536, 0, ''),
('5h32h770148qjdvs7t26sd8s16', NULL, '125.227.130.73', 'Mozilla/5.0 (Windows NT 6.3; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 1452238790, 1452240378, 0, ''),
('5k1p6rl6mooebpgabfi00ugc10', NULL, '210.242.151.130', 'Mozilla/5.0 (compatible; MSIE 9.0; Windows NT 6.1; WOW64; Trident/5.0)', 1452239259, 1452239259, 0, ''),
('7bbn009ll0ii273lsth887ev04', NULL, '198.134.105.181', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:43.0) Gecko/20100101 Firefox/43.0', 1455249947, 1455250032, 0, ''),
('9bvlopot8bnb4khukdb2k0fbe7', NULL, '69.171.231.226', 'Mozilla/5.0 (X11; Linux x86_64; rv:10.0) Gecko/20100101 Firefox/10.0 (Chrome)', 1452240668, 1452240668, 0, ''),
('c1cqrmk6kn4789na52su5blv42', NULL, '180.217.14.75', 'Mozilla/5.0 (Linux; Android 4.2.2; C2105 Build/15.3.A.1.14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36', 1452261589, 1452261589, 0, ''),
('ed67nfaedv8gj7io392g2iusf7', 1, '::1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 1452064326, 1452239843, 1, 'userId|s:1:"1";username|s:3:"ocs";'),
('geqaq5gnq5p427una6ppfeqii1', NULL, '192.168.11.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64; Trident/7.0; rv:11.0) like Gecko', 1452304806, 1452304806, 0, ''),
('h7avsheu0gf6jfej46b65ic657', NULL, '192.168.11.50', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.106 Safari/537.36', 1452238925, 1452304775, 0, ''),
('hbelbhc6laei7onmvt055irkk0', NULL, '110.28.82.254', 'Mozilla/5.0 (Linux; Android 5.1.1; D2533 Build/19.4.A.0.182) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36', 1452261975, 1452261975, 0, ''),
('jqc5umo9mcnjt8dg3f04ehfs12', NULL, '61.228.164.80', 'Mozilla/5.0 (Linux; Android 4.2.2; C2105 Build/15.3.A.1.14) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/47.0.2526.83 Mobile Safari/537.36', 1452298119, 1452298119, 0, ''),
('q3vb4ojp6v5trntnrg674mff51', NULL, '114.25.12.33', 'Mozilla/5.0 (Linux; Android 5.0.2; HTC_M910x Build/LRX22G) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/33.0.0.0 Mobile Safari/537.36', 1452240963, 1452241197, 0, ''),
('r3kp5ala1hkc3f7o60tc5cdhs6', NULL, '107.172.23.207', 'DirBuster-0.12 (http://www.owasp.org/index.php/Category:OWASP_DirBuster_Project)', 1455249911, 1455249912, 0, '');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `site`
--

INSERT INTO `site` (`redirect`, `primary_locale`, `min_password_length`, `installed_locales`, `supported_locales`, `original_style_file_name`) VALUES
(0, 'zh_TW', 6, 'zh_TW', 'zh_TW', NULL);

-- --------------------------------------------------------

--
-- 資料表結構 `site_settings`
--

CREATE TABLE IF NOT EXISTS `site_settings` (
  `setting_name` varchar(255) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT '',
  `setting_value` text,
  `setting_type` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `site_settings`
--

INSERT INTO `site_settings` (`setting_name`, `locale`, `setting_value`, `setting_type`) VALUES
('contactEmail', 'zh_TW', 'pudding@nccu.edu.tw', 'string'),
('contactName', 'zh_TW', 'Open Conference Systems', 'string'),
('title', 'zh_TW', 'Open Conference Systems', 'string');

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- 資料表結構 `static_pages`
--

CREATE TABLE IF NOT EXISTS `static_pages` (
  `static_page_id` bigint(20) NOT NULL,
  `path` varchar(255) NOT NULL,
  `conference_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `tracks`
--

INSERT INTO `tracks` (`track_id`, `sched_conf_id`, `review_form_id`, `seq`, `director_restricted`, `meta_reviewed`, `hide_about`, `disable_comments`, `abstract_word_count`) VALUES
(1, 1, NULL, 0, 0, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- 資料表結構 `track_directors`
--

CREATE TABLE IF NOT EXISTS `track_directors` (
  `sched_conf_id` bigint(20) NOT NULL,
  `track_id` bigint(20) NOT NULL,
  `user_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `track_settings`
--

INSERT INTO `track_settings` (`track_id`, `locale`, `setting_name`, `setting_value`, `setting_type`) VALUES
(1, 'zh_TW', 'abbrev', 'GEN', 'string'),
(1, 'zh_TW', 'policy', '', 'string'),
(1, 'zh_TW', 'title', 'ㄧ般論文', 'string');

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `users`
--

INSERT INTO `users` (`user_id`, `username`, `password`, `salutation`, `first_name`, `middle_name`, `last_name`, `gender`, `initials`, `affiliation`, `email`, `url`, `phone`, `fax`, `mailing_address`, `country`, `locales`, `date_last_email`, `date_registered`, `date_validated`, `date_last_login`, `must_change_password`, `auth_id`, `auth_str`, `disabled`, `disabled_reason`) VALUES
(1, 'ocs', '695acd442d1ac2762f83596af2ff61fd', NULL, 'ocs', NULL, '', NULL, NULL, NULL, 'pudding@nccu.edu.tw', NULL, NULL, NULL, NULL, NULL, '', NULL, '2016-01-06 08:05:26', NULL, '2016-01-06 08:12:10', 0, NULL, NULL, 0, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- 資料表的匯出資料 `versions`
--

INSERT INTO `versions` (`major`, `minor`, `revision`, `build`, `date_installed`, `current`, `product_type`, `product`) VALUES
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.auth', 'ldap'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'information'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'navigation'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'notification'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'role'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'user'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'help'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'developedBy'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'languageToggle'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.blocks', 'fontSize'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'abnt'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'apa'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'bibtex'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'cbe'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'endNote'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'mla'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'proCite'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'refMan'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'refWorks'),
(1, 0, 0, 0, '2016-01-06 08:05:27', 1, 'plugins.citationFormats', 'turabian'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.gateways', 'announcementFeed'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.generic', 'customLocale'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.generic', 'jquery'),
(1, 2, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.generic', 'staticPages'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.generic', 'tinymce'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.generic', 'translator'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.importexport', 'mets'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.importexport', 'native'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.importexport', 'nlm'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.importexport', 'users'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.paymethod', 'manual'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.paymethod', 'paypal'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.reports', 'papers'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.reports', 'registrants'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.reports', 'reviews'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'classicBlue'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'classicBrown'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'classicGreen'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'classicNavy'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'classicRed'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'desert'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'lilac'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'night'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'redbar'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'steel'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'uncommon'),
(1, 0, 0, 0, '2016-01-06 08:05:28', 1, 'plugins.themes', 'vanilla'),
(2, 3, 6, 0, '2016-01-06 08:05:29', 1, 'core', 'ocs2');

--
-- 已匯出資料表的索引
--

--
-- 資料表索引 `access_keys`
--
ALTER TABLE `access_keys`
  ADD PRIMARY KEY (`access_key_id`), ADD KEY `access_keys_hash` (`key_hash`,`user_id`,`context`);

--
-- 資料表索引 `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`announcement_id`), ADD KEY `announcements_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `announcement_settings`
--
ALTER TABLE `announcement_settings`
  ADD UNIQUE KEY `announcement_settings_pkey` (`announcement_id`,`locale`,`setting_name`), ADD KEY `announcement_settings_announcement_id` (`announcement_id`);

--
-- 資料表索引 `announcement_types`
--
ALTER TABLE `announcement_types`
  ADD PRIMARY KEY (`type_id`), ADD KEY `announcement_types_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `announcement_type_settings`
--
ALTER TABLE `announcement_type_settings`
  ADD UNIQUE KEY `announcement_type_settings_pkey` (`type_id`,`locale`,`setting_name`), ADD KEY `announcement_type_settings_type_id` (`type_id`);

--
-- 資料表索引 `auth_sources`
--
ALTER TABLE `auth_sources`
  ADD PRIMARY KEY (`auth_id`);

--
-- 資料表索引 `buildings`
--
ALTER TABLE `buildings`
  ADD PRIMARY KEY (`building_id`), ADD KEY `building_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `building_settings`
--
ALTER TABLE `building_settings`
  ADD UNIQUE KEY `building_settings_pkey` (`building_id`,`locale`,`setting_name`), ADD KEY `building_settings_building_id` (`building_id`);

--
-- 資料表索引 `captchas`
--
ALTER TABLE `captchas`
  ADD PRIMARY KEY (`captcha_id`);

--
-- 資料表索引 `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`), ADD KEY `comments_paper_id` (`paper_id`), ADD KEY `comments_parent_comment_id` (`parent_comment_id`);

--
-- 資料表索引 `conferences`
--
ALTER TABLE `conferences`
  ADD PRIMARY KEY (`conference_id`), ADD UNIQUE KEY `conferences_path` (`path`);

--
-- 資料表索引 `conference_event_log`
--
ALTER TABLE `conference_event_log`
  ADD PRIMARY KEY (`log_id`), ADD KEY `conference_event_log_sched_conf_id` (`sched_conf_id`), ADD KEY `conference_event_log_conference_id` (`conference_id`);

--
-- 資料表索引 `conference_settings`
--
ALTER TABLE `conference_settings`
  ADD UNIQUE KEY `conference_settings_pkey` (`conference_id`,`locale`,`setting_name`), ADD KEY `conference_settings_conference_id` (`conference_id`);

--
-- 資料表索引 `controlled_vocabs`
--
ALTER TABLE `controlled_vocabs`
  ADD PRIMARY KEY (`controlled_vocab_id`), ADD UNIQUE KEY `controlled_vocab_symbolic` (`symbolic`,`assoc_type`,`assoc_id`);

--
-- 資料表索引 `controlled_vocab_entries`
--
ALTER TABLE `controlled_vocab_entries`
  ADD PRIMARY KEY (`controlled_vocab_entry_id`), ADD KEY `controlled_vocab_entries_cv_id` (`controlled_vocab_id`,`seq`);

--
-- 資料表索引 `controlled_vocab_entry_settings`
--
ALTER TABLE `controlled_vocab_entry_settings`
  ADD UNIQUE KEY `c_v_e_s_pkey` (`controlled_vocab_entry_id`,`locale`,`setting_name`), ADD KEY `c_v_e_s_entry_id` (`controlled_vocab_entry_id`);

--
-- 資料表索引 `custom_track_orders`
--
ALTER TABLE `custom_track_orders`
  ADD KEY `custom_track_orders_pkey` (`sched_conf_id`,`track_id`);

--
-- 資料表索引 `edit_assignments`
--
ALTER TABLE `edit_assignments`
  ADD PRIMARY KEY (`edit_id`), ADD KEY `edit_assignments_paper_id` (`paper_id`), ADD KEY `edit_assignments_director_id` (`director_id`);

--
-- 資料表索引 `edit_decisions`
--
ALTER TABLE `edit_decisions`
  ADD PRIMARY KEY (`edit_decision_id`), ADD KEY `edit_decisions_paper_id` (`paper_id`), ADD KEY `edit_decisions_director_id` (`director_id`);

--
-- 資料表索引 `email_templates`
--
ALTER TABLE `email_templates`
  ADD PRIMARY KEY (`email_id`), ADD UNIQUE KEY `email_templates_email_key` (`email_key`,`assoc_type`,`assoc_id`), ADD KEY `email_templates_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `email_templates_data`
--
ALTER TABLE `email_templates_data`
  ADD UNIQUE KEY `email_templates_data_pkey` (`email_key`,`locale`,`assoc_type`,`assoc_id`);

--
-- 資料表索引 `email_templates_default`
--
ALTER TABLE `email_templates_default`
  ADD PRIMARY KEY (`email_id`), ADD KEY `email_templates_default_email_key` (`email_key`);

--
-- 資料表索引 `email_templates_default_data`
--
ALTER TABLE `email_templates_default_data`
  ADD UNIQUE KEY `email_templates_default_data_pkey` (`email_key`,`locale`);

--
-- 資料表索引 `groups`
--
ALTER TABLE `groups`
  ADD PRIMARY KEY (`group_id`), ADD KEY `groups_assoc` (`assoc_type`,`assoc_id`);

--
-- 資料表索引 `group_memberships`
--
ALTER TABLE `group_memberships`
  ADD UNIQUE KEY `group_memberships_pkey` (`user_id`,`group_id`);

--
-- 資料表索引 `group_settings`
--
ALTER TABLE `group_settings`
  ADD UNIQUE KEY `group_settings_pkey` (`group_id`,`locale`,`setting_name`), ADD KEY `group_settings_group_id` (`group_id`);

--
-- 資料表索引 `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`), ADD KEY `notifications_by_user` (`product`,`user_id`,`level`,`context`);

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
  ADD PRIMARY KEY (`paper_id`), ADD KEY `papers_user_id` (`user_id`), ADD KEY `papers_sched_conf_id` (`sched_conf_id`), ADD KEY `papers_track_id` (`track_id`);

--
-- 資料表索引 `paper_authors`
--
ALTER TABLE `paper_authors`
  ADD PRIMARY KEY (`author_id`), ADD KEY `paper_authors_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_author_settings`
--
ALTER TABLE `paper_author_settings`
  ADD UNIQUE KEY `paper_author_settings_pkey` (`author_id`,`locale`,`setting_name`), ADD KEY `author_settings_author_id` (`author_id`);

--
-- 資料表索引 `paper_comments`
--
ALTER TABLE `paper_comments`
  ADD PRIMARY KEY (`comment_id`), ADD KEY `paper_comments_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_email_log`
--
ALTER TABLE `paper_email_log`
  ADD PRIMARY KEY (`log_id`), ADD KEY `paper_email_log_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_event_log`
--
ALTER TABLE `paper_event_log`
  ADD PRIMARY KEY (`log_id`), ADD KEY `paper_event_log_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_files`
--
ALTER TABLE `paper_files`
  ADD PRIMARY KEY (`file_id`,`revision`), ADD KEY `paper_files_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_galleys`
--
ALTER TABLE `paper_galleys`
  ADD PRIMARY KEY (`galley_id`), ADD KEY `paper_galleys_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_html_galley_images`
--
ALTER TABLE `paper_html_galley_images`
  ADD UNIQUE KEY `paper_html_galley_images_pkey` (`galley_id`,`file_id`);

--
-- 資料表索引 `paper_notes`
--
ALTER TABLE `paper_notes`
  ADD PRIMARY KEY (`note_id`), ADD KEY `paper_notes_paper_id` (`paper_id`), ADD KEY `paper_notes_user_id` (`user_id`), ADD KEY `paper_notes_file_id` (`file_id`);

--
-- 資料表索引 `paper_search_keyword_list`
--
ALTER TABLE `paper_search_keyword_list`
  ADD PRIMARY KEY (`keyword_id`), ADD UNIQUE KEY `paper_search_keyword_text` (`keyword_text`);

--
-- 資料表索引 `paper_search_objects`
--
ALTER TABLE `paper_search_objects`
  ADD PRIMARY KEY (`object_id`);

--
-- 資料表索引 `paper_search_object_keywords`
--
ALTER TABLE `paper_search_object_keywords`
  ADD UNIQUE KEY `paper_search_object_keywords_pkey` (`object_id`,`pos`), ADD KEY `paper_search_object_keywords_keyword_id` (`keyword_id`);

--
-- 資料表索引 `paper_settings`
--
ALTER TABLE `paper_settings`
  ADD UNIQUE KEY `paper_settings_pkey` (`paper_id`,`locale`,`setting_name`), ADD KEY `paper_settings_paper_id` (`paper_id`);

--
-- 資料表索引 `paper_supplementary_files`
--
ALTER TABLE `paper_supplementary_files`
  ADD PRIMARY KEY (`supp_id`), ADD KEY `paper_supplementary_files_file_id` (`file_id`), ADD KEY `paper_supplementary_files_paper_id` (`paper_id`), ADD KEY `paper_supplementary_files_public_issue_id` (`public_supp_file_id`);

--
-- 資料表索引 `paper_supp_file_settings`
--
ALTER TABLE `paper_supp_file_settings`
  ADD UNIQUE KEY `paper_supp_file_settings_pkey` (`supp_id`,`locale`,`setting_name`), ADD KEY `paper_supp_file_settings_supp_id` (`supp_id`);

--
-- 資料表索引 `paypal_transactions`
--
ALTER TABLE `paypal_transactions`
  ADD PRIMARY KEY (`txn_id`);

--
-- 資料表索引 `plugin_settings`
--
ALTER TABLE `plugin_settings`
  ADD UNIQUE KEY `plugin_settings_pkey` (`plugin_name`,`locale`,`sched_conf_id`,`conference_id`,`setting_name`), ADD KEY `plugin_settings_plugin_name` (`plugin_name`);

--
-- 資料表索引 `published_papers`
--
ALTER TABLE `published_papers`
  ADD PRIMARY KEY (`pub_id`), ADD UNIQUE KEY `published_papers_paper_id` (`paper_id`), ADD KEY `published_papers_sched_conf_id` (`sched_conf_id`), ADD KEY `published_papers_public_paper_id` (`public_paper_id`);

--
-- 資料表索引 `queued_payments`
--
ALTER TABLE `queued_payments`
  ADD PRIMARY KEY (`queued_payment_id`);

--
-- 資料表索引 `registrations`
--
ALTER TABLE `registrations`
  ADD PRIMARY KEY (`registration_id`), ADD UNIQUE KEY `registration_sched_conf_id` (`sched_conf_id`,`user_id`), ADD KEY `registration_domain` (`domain`);

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
  ADD UNIQUE KEY `registration_option_settings_pkey` (`option_id`,`locale`,`setting_name`), ADD KEY `registration_option_settings_type_id` (`option_id`);

--
-- 資料表索引 `registration_types`
--
ALTER TABLE `registration_types`
  ADD PRIMARY KEY (`type_id`);

--
-- 資料表索引 `registration_type_settings`
--
ALTER TABLE `registration_type_settings`
  ADD UNIQUE KEY `registration_type_settings_pkey` (`type_id`,`locale`,`setting_name`), ADD KEY `registration_type_settings_type_id` (`type_id`);

--
-- 資料表索引 `review_assignments`
--
ALTER TABLE `review_assignments`
  ADD PRIMARY KEY (`review_id`), ADD KEY `review_assignments_paper_id` (`paper_id`), ADD KEY `review_assignments_reviewer_id` (`reviewer_id`), ADD KEY `review_assignments_form_id` (`review_form_id`);

--
-- 資料表索引 `review_forms`
--
ALTER TABLE `review_forms`
  ADD PRIMARY KEY (`review_form_id`);

--
-- 資料表索引 `review_form_elements`
--
ALTER TABLE `review_form_elements`
  ADD PRIMARY KEY (`review_form_element_id`), ADD KEY `review_form_elements_review_form_id` (`review_form_id`);

--
-- 資料表索引 `review_form_element_settings`
--
ALTER TABLE `review_form_element_settings`
  ADD UNIQUE KEY `review_form_element_settings_pkey` (`review_form_element_id`,`locale`,`setting_name`), ADD KEY `review_form_element_settings_review_form_element_id` (`review_form_element_id`);

--
-- 資料表索引 `review_form_responses`
--
ALTER TABLE `review_form_responses`
  ADD KEY `review_form_responses_pkey` (`review_form_element_id`,`review_id`);

--
-- 資料表索引 `review_form_settings`
--
ALTER TABLE `review_form_settings`
  ADD UNIQUE KEY `review_form_settings_pkey` (`review_form_id`,`locale`,`setting_name`), ADD KEY `review_form_settings_review_form_id` (`review_form_id`);

--
-- 資料表索引 `review_stages`
--
ALTER TABLE `review_stages`
  ADD UNIQUE KEY `review_stages_pkey` (`paper_id`,`stage`), ADD KEY `review_stages_paper_id` (`paper_id`);

--
-- 資料表索引 `roles`
--
ALTER TABLE `roles`
  ADD UNIQUE KEY `roles_pkey` (`conference_id`,`sched_conf_id`,`user_id`,`role_id`), ADD KEY `roles_conference_id` (`conference_id`), ADD KEY `roles_sched_conf_id` (`sched_conf_id`), ADD KEY `roles_user_id` (`user_id`), ADD KEY `roles_role_id` (`role_id`);

--
-- 資料表索引 `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`), ADD KEY `room_building_id` (`building_id`);

--
-- 資料表索引 `room_settings`
--
ALTER TABLE `room_settings`
  ADD UNIQUE KEY `room_settings_pkey` (`room_id`,`locale`,`setting_name`), ADD KEY `room_settings_room_id` (`room_id`);

--
-- 資料表索引 `rt_contexts`
--
ALTER TABLE `rt_contexts`
  ADD PRIMARY KEY (`context_id`), ADD KEY `rt_contexts_version_id` (`version_id`);

--
-- 資料表索引 `rt_searches`
--
ALTER TABLE `rt_searches`
  ADD PRIMARY KEY (`search_id`), ADD KEY `rt_searches_context_id` (`context_id`);

--
-- 資料表索引 `rt_versions`
--
ALTER TABLE `rt_versions`
  ADD PRIMARY KEY (`version_id`), ADD KEY `rt_versions_conference_id` (`conference_id`), ADD KEY `rt_versions_version_key` (`version_key`);

--
-- 資料表索引 `scheduled_tasks`
--
ALTER TABLE `scheduled_tasks`
  ADD UNIQUE KEY `scheduled_tasks_pkey` (`class_name`);

--
-- 資料表索引 `sched_confs`
--
ALTER TABLE `sched_confs`
  ADD PRIMARY KEY (`sched_conf_id`), ADD KEY `sched_conf_path` (`path`), ADD KEY `sched_conf_conference_id` (`conference_id`), ADD KEY `sched_confs_start_end_date` (`start_date`,`end_date`);

--
-- 資料表索引 `sched_conf_settings`
--
ALTER TABLE `sched_conf_settings`
  ADD UNIQUE KEY `sched_conf_settings_pkey` (`sched_conf_id`,`locale`,`setting_name`), ADD KEY `sched_conf_settings_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `sessions`
--
ALTER TABLE `sessions`
  ADD UNIQUE KEY `sessions_pkey` (`session_id`), ADD KEY `sessions_user_id` (`user_id`);

--
-- 資料表索引 `site_settings`
--
ALTER TABLE `site_settings`
  ADD UNIQUE KEY `site_settings_pkey` (`setting_name`,`locale`);

--
-- 資料表索引 `special_events`
--
ALTER TABLE `special_events`
  ADD PRIMARY KEY (`special_event_id`), ADD KEY `special_event_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `special_event_settings`
--
ALTER TABLE `special_event_settings`
  ADD UNIQUE KEY `special_event_settings_pkey` (`special_event_id`,`locale`,`setting_name`), ADD KEY `special_event_settings_special_event_id` (`special_event_id`);

--
-- 資料表索引 `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`static_page_id`);

--
-- 資料表索引 `static_page_settings`
--
ALTER TABLE `static_page_settings`
  ADD UNIQUE KEY `static_page_settings_pkey` (`static_page_id`,`locale`,`setting_name`), ADD KEY `static_page_settings_static_page_id` (`static_page_id`);

--
-- 資料表索引 `temporary_files`
--
ALTER TABLE `temporary_files`
  ADD PRIMARY KEY (`file_id`), ADD KEY `temporary_files_user_id` (`user_id`);

--
-- 資料表索引 `time_blocks`
--
ALTER TABLE `time_blocks`
  ADD PRIMARY KEY (`time_block_id`), ADD UNIQUE KEY `time_block_unique` (`sched_conf_id`,`start_time`,`end_time`);

--
-- 資料表索引 `time_block_settings`
--
ALTER TABLE `time_block_settings`
  ADD UNIQUE KEY `time_block_settings_pkey` (`time_block_id`,`locale`,`setting_name`), ADD KEY `time_block_settings_time_block_id` (`time_block_id`);

--
-- 資料表索引 `tracks`
--
ALTER TABLE `tracks`
  ADD PRIMARY KEY (`track_id`), ADD KEY `tracks_sched_conf_id` (`sched_conf_id`);

--
-- 資料表索引 `track_directors`
--
ALTER TABLE `track_directors`
  ADD UNIQUE KEY `track_directors_pkey` (`sched_conf_id`,`track_id`,`user_id`), ADD KEY `track_directors_sched_conf_id` (`sched_conf_id`), ADD KEY `track_directors_track_id` (`track_id`), ADD KEY `track_directors_user_id` (`user_id`);

--
-- 資料表索引 `track_settings`
--
ALTER TABLE `track_settings`
  ADD UNIQUE KEY `track_settings_pkey` (`track_id`,`locale`,`setting_name`), ADD KEY `track_settings_track_id` (`track_id`);

--
-- 資料表索引 `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `users_username` (`username`), ADD UNIQUE KEY `users_email` (`email`);

--
-- 資料表索引 `user_settings`
--
ALTER TABLE `user_settings`
  ADD UNIQUE KEY `user_settings_pkey` (`user_id`,`locale`,`setting_name`,`assoc_type`,`assoc_id`), ADD KEY `user_settings_user_id` (`user_id`);

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
  MODIFY `conference_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
  MODIFY `email_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=38;
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
  MODIFY `context_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=248;
--
-- 使用資料表 AUTO_INCREMENT `rt_searches`
--
ALTER TABLE `rt_searches`
  MODIFY `search_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=1295;
--
-- 使用資料表 AUTO_INCREMENT `rt_versions`
--
ALTER TABLE `rt_versions`
  MODIFY `version_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=20;
--
-- 使用資料表 AUTO_INCREMENT `sched_confs`
--
ALTER TABLE `sched_confs`
  MODIFY `sched_conf_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
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
  MODIFY `track_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- 使用資料表 AUTO_INCREMENT `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
