<?php /* Smarty version 2.6.26, created on 2016-01-07 03:23:19
         compiled from notification/settings.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'notification/settings.tpl', 15, false),array('function', 'url', 'notification/settings.tpl', 17, false),array('function', 'fieldLabel', 'notification/settings.tpl', 28, false),array('modifier', 'in_array', 'notification/settings.tpl', 27, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "notification.settings"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.settingsDescription"), $this);?>
</p>

<form id="notificationSettings" method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'saveSettings'), $this);?>
">

<!-- Submission events -->
<?php if (! $this->_tpl_vars['canOnlyRead'] && ! $this->_tpl_vars['canOnlyReview']): ?>
<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.submissions"), $this);?>
</h4>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.paperSubmitted",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationPaperSubmitted" type="checkbox" name="notificationPaperSubmitted"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_PAPER_SUBMITTED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationPaperSubmitted','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationPaperSubmitted" type="checkbox" name="emailNotificationPaperSubmitted"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_PAPER_SUBMITTED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationPaperSubmitted','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.metadataModified",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationMetadataModified" type="checkbox" name="notificationMetadataModified"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_METADATA_MODIFIED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationMetadataModified','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationMetadataModified" type="checkbox" name="emailNotificationMetadataModified"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_METADATA_MODIFIED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationMetadataModified','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.suppFileModified",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationSuppFileModified" type="checkbox" name="notificationSuppFileModified"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_SUPP_FILE_MODIFIED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationSuppFileModified','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationSuppFileModified" type="checkbox" name="emailNotificationSuppFileModified"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_SUPP_FILE_MODIFIED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationSuppFileModified','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<br />

<?php if (! $this->_tpl_vars['canOnlyRead']): ?>
<!-- Reviewing events -->
<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.reviewing"), $this);?>
</h4>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.reviewerComment",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationReviewerComment" type="checkbox" name="notificationReviewerComment"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_REVIEWER_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationReviewerComment','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationReviewerComment" type="checkbox" name="emailNotificationReviewerComment"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_REVIEWER_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationReviewerComment','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.reviewerFormComment",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationReviewerFormComment" type="checkbox" name="notificationReviewerFormComment"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_REVIEWER_FORM_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationReviewerFormComment','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationReviewerFormComment" type="checkbox" name="emailNotificationReviewerFormComment"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_REVIEWER_FORM_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationReviewerFormComment','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.directorDecisionComment",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationDirectorDecisionComment" type="checkbox" name="notificationDirectorDecisionComment"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_DIRECTOR_DECISION_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationDirectorDecisionComment','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationDirectorDecisionComment" type="checkbox" name="emailNotificationDirectorDecisionComment"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_DIRECTOR_DECISION_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationDirectorDecisionComment','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<br />
<?php endif; ?>

<!-- Editing events -->
<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.editing"), $this);?>
</h4>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.galleyModified",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationGalleyModified" type="checkbox" name="notificationGalleyModified"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_GALLEY_MODIFIED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationGalleyModified','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationGalleyModified" type="checkbox" name="emailNotificationGalleyModified"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_GALLEY_MODIFIED)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationGalleyModified','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.submissionComment",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationSubmissionComment" type="checkbox" name="notificationSubmissionComment"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_SUBMISSION_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationSubmissionComment','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationSubmissionComment" type="checkbox" name="emailNotificationSubmissionComment"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_SUBMISSION_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationSubmissionComment','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<br />
<?php endif; ?>

<!-- Site events -->
<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.site"), $this);?>
</h4>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.userComment",'param' => $this->_tpl_vars['titleVar']), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationUserComment" type="checkbox" name="notificationUserComment"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_USER_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationUserComment','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationUserComment" type="checkbox" name="emailNotificationUserComment"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_USER_COMMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationUserComment','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<ul>
	<li><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.type.newAnnouncement"), $this);?>
</li>
	<ul class="plain">
		<li><span>
			<input id="notificationNewAnnouncement" type="checkbox" name="notificationNewAnnouncement"<?php if (! ((is_array($_tmp=@NOTIFICATION_TYPE_NEW_ANNOUNCEMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['notificationSettings']) : in_array($_tmp, $this->_tpl_vars['notificationSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'notificationNewAnnouncement','key' => "notification.allow"), $this);?>

		</span></li>
		<li><span>
			<input id="emailNotificationNewAnnouncement" type="checkbox" name="emailNotificationNewAnnouncement"<?php if (((is_array($_tmp=@NOTIFICATION_TYPE_NEW_ANNOUNCEMENT)) ? $this->_run_mod_handler('in_array', true, $_tmp, $this->_tpl_vars['emailSettings']) : in_array($_tmp, $this->_tpl_vars['emailSettings']))): ?> checked="checked"<?php endif; ?> />
			<?php echo $this->_plugins['function']['fieldLabel'][0][0]->smartyFieldLabel(array('name' => 'emailNotificationNewAnnouncement','key' => "notification.email"), $this);?>

		</span></li>
	</ul>
</ul>

<br />

<p><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "form.submit"), $this);?>
" class="button defaultButton" />  <input type="button" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.cancel"), $this);?>
" class="button" onclick="document.location.href='<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'notification'), $this);?>
'" /></p>

</form>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>