<?php /* Smarty version 2.6.26, created on 2016-01-06 08:14:13
         compiled from notification/index.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'notification/index.tpl', 18, false),array('function', 'url', 'notification/index.tpl', 24, false),array('function', 'page_info', 'notification/index.tpl', 77, false),array('function', 'page_links', 'notification/index.tpl', 78, false),array('block', 'iterate', 'notification/index.tpl', 34, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "notification.notifications"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<table width="100%">
	<tr>
		<td><?php if ($this->_tpl_vars['isUserLoggedIn']): ?>
				<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.notificationsDescription",'unreadCount' => $this->_tpl_vars['unread'],'readCount' => $this->_tpl_vars['read'],'settingsUrl' => $this->_tpl_vars['url']), $this);?>
</p>
			<?php else: ?>
				<p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.notificationsPublicDescription",'emailUrl' => $this->_tpl_vars['emailUrl']), $this);?>
</p>
			<?php endif; ?>
		</td>
		<td><ul class="plain">
			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'getNotificationFeedUrl','path' => 'rss'), $this);?>
" class="icon"><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/pkp/templates/images/rss10_logo.gif" alt="RSS 1.0"/></a></li>
			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'getNotificationFeedUrl','path' => 'rss2'), $this);?>
" class="icon"><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/pkp/templates/images/rss20_logo.gif" alt="RSS 2.0"/></a></li>
			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'getNotificationFeedUrl','path' => 'atom'), $this);?>
" class="icon"><img src="<?php echo $this->_tpl_vars['baseUrl']; ?>
/lib/pkp/templates/images/atom10_logo.gif" alt="Atom 1.0"/></a></li>
		</ul></td>
	</tr>
</table>

<br/>

<div id="notifications">
<?php $this->_tag_stack[] = array('iterate', array('from' => 'notifications','item' => 'notification')); $_block_repeat=true;$this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
	<table width="100%" class="notifications">
		<tr>
			<td width="25"><img src="<?php echo $this->_tpl_vars['notification']->getIconLocation(); ?>
" alt="&#187;"/></td>
			<td class="notificationContent" colspan="2" width="80%">
				<?php echo $this->_tpl_vars['notification']->getDateCreated(); ?>

			</td>
			<?php if ($this->_tpl_vars['notification']->getLocation() != null): ?>
				<td class="notificationFunction" style="min-width:60px"><a href="<?php echo $this->_tpl_vars['notification']->getLocation(); ?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.location"), $this);?>
</a></td>
			<?php else: ?>
				<td class="notificationFunction"></td>
			<?php endif; ?>
			<?php if ($this->_tpl_vars['isUserLoggedIn']): ?>
				<td class="notificationFunction"><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'delete','path' => $this->_tpl_vars['notification']->getId()), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.delete"), $this);?>
</a></td>
			<?php endif; ?>
		</tr>
		<tr>
			<td width="25">&nbsp;</td>
			<td class="notificationContent">
				<?php if ($this->_tpl_vars['notification']->getIsUnread()): ?>
					<?php if ($this->_tpl_vars['notification']->getIsLocalized()): ?><p style="font-weight: bold"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['notification']->getContents(),'param' => $this->_tpl_vars['notification']->getParam()), $this);?>
</p>
					<?php else: ?><p style="font-weight: bold"><?php echo $this->_tpl_vars['notification']->getContents(); ?>
<?php endif; ?>
				<?php else: ?>
					<?php if ($this->_tpl_vars['notification']->getIsLocalized()): ?><p><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => $this->_tpl_vars['notification']->getContents(),'param' => $this->_tpl_vars['notification']->getParam()), $this);?>
</p>
					<?php else: ?><p><?php echo $this->_tpl_vars['notification']->getContents(); ?>
</p><?php endif; ?>
				<?php endif; ?>
			</td>
		</tr>
	</table>
	<div class="separator" style="margin-left:25px"></div>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
<?php if ($this->_tpl_vars['notifications']->wasEmpty()): ?>
	<table class="notifications">
		<tr>
			<td colspan="2" class="nodata"><h5><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "notification.noneExist"), $this);?>
</h5></td>
		</tr>
		<tr>
			<td colspan="2" class="endseparator">&nbsp;</td>
		</tr>
	</table>
<?php else: ?>
	<table class="notifications">
		<tr>
			<td align="left"><?php echo $this->_plugins['function']['page_info'][0][0]->smartyPageInfo(array('iterator' => $this->_tpl_vars['notifications']), $this);?>
</td>
			<td align="right"><?php echo $this->_plugins['function']['page_links'][0][0]->smartyPageLinks(array('anchor' => 'notifications','name' => 'notifications','iterator' => $this->_tpl_vars['notifications']), $this);?>
</td>
		</tr>
	</table>
<?php endif; ?>

</div>

<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>