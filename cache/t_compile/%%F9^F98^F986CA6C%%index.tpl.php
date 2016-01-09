<?php /* Smarty version 2.6.26, created on 2016-01-06 08:14:03
         compiled from manager/index.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'manager/index.tpl', 16, false),array('function', 'url', 'manager/index.tpl', 21, false),array('function', 'call_hook', 'manager/index.tpl', 35, false),array('block', 'iterate', 'manager/index.tpl', 40, false),array('modifier', 'assign', 'manager/index.tpl', 77, false),)), $this); ?>
<?php echo ''; ?><?php $this->assign('pageTitle', "manager.conferenceSiteManagement"); ?><?php echo ''; ?><?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/header.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?><?php echo ''; ?>


<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.managementPages"), $this);?>
</h3>
<div id="description">
<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.managementPages.description"), $this);?>


<ul class="plain">
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'setup'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.websiteManagement"), $this);?>
</a></li>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'schedConfs','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfs"), $this);?>
</a></li>
	<?php if ($this->_tpl_vars['announcementsEnabled']): ?>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'announcements','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.announcements"), $this);?>
</a></li>
	<?php endif; ?>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'reviewForms'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.reviewForms"), $this);?>
</a></li>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'emails','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.emails"), $this);?>
</a></li>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'rtadmin'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.readingTools"), $this);?>
</a></li>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'files'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.filesBrowser"), $this);?>
</a></li>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'languages'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.languages"), $this);?>
</a></li>
	<?php if ($this->_tpl_vars['loggingEnabled']): ?>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'conferenceEventLog','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.conferenceEventLog"), $this);?>
</a></li>
	<?php endif; ?>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'plugins'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.plugins"), $this);?>
</a></li>
	<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Manager::Index::ManagementPages"), $this);?>

</ul>
</div>
<div id="currentConfs">
<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.currentConferences"), $this);?>
</h3>
<?php $this->_tag_stack[] = array('iterate', array('from' => 'schedConfs','item' => 'schedConf')); $_block_repeat=true;$this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], null, $this, $_block_repeat);while ($_block_repeat) { ob_start(); ?>
	<h4><?php echo $this->_tpl_vars['schedConf']->getFullTitle(); ?>
</h4>
	<ul class="plain">
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'schedConfSetup'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.schedConfSetup"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'timeline'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.timeline"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'tracks','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "track.tracks"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'groups','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.groups"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'program'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.program"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'importexport'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.importExport"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'statistics'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.statistics"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'registration','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.registration"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'scheduler'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.scheduler"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'paymentSettings'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.payment.paymentSettings"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'accommodation'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.accommodation"), $this);?>
</a></li>
		<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'people','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.roles"), $this);?>
</a></li>
		<li>
			<h4><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.roles"), $this);?>
</h4>

			<ul class="plain">
				<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'people','path' => 'directors','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.directors"), $this);?>
</a></li>
				<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'people','path' => 'trackDirectors','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.trackDirectors"), $this);?>
</a></li>
				<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'people','path' => 'reviewers','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.reviewers"), $this);?>
</a></li>
				<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'people','path' => 'authors','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.authors"), $this);?>
</a></li>
				<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('schedConf' => $this->_tpl_vars['schedConf']->getPath(),'page' => 'manager','op' => 'people','path' => 'readers','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.readers"), $this);?>
</a></li>
				<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Manager::Index::SchedConfRoles"), $this);?>

			</ul>
		</li>
		<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Manager::Index::SchedConfFuncs",'schedConf' => $this->_tpl_vars['schedConf']), $this);?>

</ul>
<?php $_block_content = ob_get_contents(); ob_end_clean(); $_block_repeat=false;echo $this->_plugins['block']['iterate'][0][0]->smartyIterate($this->_tag_stack[count($this->_tag_stack)-1][1], $_block_content, $this, $_block_repeat); }  array_pop($this->_tag_stack); ?>
</div>
<div id="users">
<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.users"), $this);?>
</h3>

<ul class="plain">
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'people','path' => 'all','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.people.allEnrolledUsers"), $this);?>
</a></li>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'enrollSearch','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.people.allSiteUsers"), $this);?>
</a></li>
	<?php echo ((is_array($_tmp=$this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'manager'), $this))) ? $this->_run_mod_handler('assign', true, $_tmp, 'managementUrl') : $this->_plugins['modifier']['assign'][0][0]->smartyAssign($_tmp, 'managementUrl'));?>

	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'createUser','source' => $this->_tpl_vars['managementUrl']), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.people.createUser"), $this);?>
</a></li>
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'mergeUsers'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.people.mergeUsers"), $this);?>
</a></li>
	<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Manager::Index::Users"), $this);?>

</ul>
</div>

<div id="roles">
<h3><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "manager.roles"), $this);?>
</h3>

<ul class="plain">
	<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('op' => 'people','path' => 'managers','clearPageContext' => 1), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "user.role.managers"), $this);?>
</a></li>
	<?php echo $this->_plugins['function']['call_hook'][0][0]->smartyCallHook(array('name' => "Templates::Manager::Index::Roles"), $this);?>

</ul>
</div>
<?php $_smarty_tpl_vars = $this->_tpl_vars;
$this->_smarty_include(array('smarty_include_tpl_file' => "common/footer.tpl", 'smarty_include_vars' => array()));
$this->_tpl_vars = $_smarty_tpl_vars;
unset($_smarty_tpl_vars);
 ?>