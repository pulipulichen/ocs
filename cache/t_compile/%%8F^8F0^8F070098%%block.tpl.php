<?php /* Smarty version 2.6.26, created on 2016-01-06 08:12:07
         compiled from file:D:%5Cxampp%5Chtdocs%5Cocs/plugins/blocks/navigation/block.tpl */ ?>
<?php require_once(SMARTY_CORE_DIR . 'core.load_plugins.php');
smarty_core_load_plugins(array('plugins' => array(array('function', 'translate', 'file:D:\\xampp\\htdocs\\ocs/plugins/blocks/navigation/block.tpl', 12, false),array('function', 'url', 'file:D:\\xampp\\htdocs\\ocs/plugins/blocks/navigation/block.tpl', 15, false),array('function', 'html_options_translate', 'file:D:\\xampp\\htdocs\\ocs/plugins/blocks/navigation/block.tpl', 22, false),array('modifier', 'date_format', 'file:D:\\xampp\\htdocs\\ocs/plugins/blocks/navigation/block.tpl', 41, false),)), $this); ?>
	<div class="block" id="sidebarNavigation">
		<span class="blockTitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "plugins.block.navigation.conferenceContent"), $this);?>
</span>
		
		<span class="blockSubtitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.search"), $this);?>
</span>
		<form method="post" action="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'search','op' => 'results'), $this);?>
">
		<table>
		<tr>
			<td><input type="text" id="query" name="query" size="15" maxlength="255" value="" class="textField" /></td>
		</tr>
		<tr>
			<td><select name="searchField" size="1" class="selectMenu">
				<?php echo $this->_plugins['function']['html_options_translate'][0][0]->smartyHtmlOptionsTranslate(array('options' => $this->_tpl_vars['paperSearchByOptions']), $this);?>

			</select></td>
		</tr>
		<tr>
			<td><input type="submit" value="<?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "common.search"), $this);?>
" class="button" /></td>
		</tr>
		</table>
		</form>
		
		<br />
	
		<?php if ($this->_tpl_vars['currentSchedConf'] && ( $this->_tpl_vars['schedConfPostOverview'] || $this->_tpl_vars['schedConfShowCFP'] || $this->_tpl_vars['schedConfPostPolicies'] || $this->_tpl_vars['schedConfShowProgram'] || $this->_tpl_vars['schedConfPostPresentations'] || $this->_tpl_vars['schedConfPostSchedule'] || $this->_tpl_vars['schedConfPostPayment'] || $this->_tpl_vars['schedConfPostAccommodation'] || $this->_tpl_vars['schedConfPostSupporters'] || $this->_tpl_vars['schedConfPostTimeline'] )): ?>
		<span class="blockSubtitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.contents"), $this);?>
</span>

		<ul class="plain">
			<?php if ($this->_tpl_vars['schedConfPostOverview']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'overview'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.overview"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfShowCFP']): ?>
				<li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'cfp'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.cfp"), $this);?>
</a><?php if ($this->_tpl_vars['submissionsOpenDate']): ?> (<?php echo ((is_array($_tmp=$this->_tpl_vars['submissionsOpenDate'])) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatLong'])); ?>
 - <?php echo ((is_array($_tmp=$this->_tpl_vars['submissionsCloseDate'])) ? $this->_run_mod_handler('date_format', true, $_tmp, $this->_tpl_vars['dateFormatLong']) : smarty_modifier_date_format($_tmp, $this->_tpl_vars['dateFormatLong'])); ?>
)<?php endif; ?></li>
			<?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfPostTrackPolicies']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'trackPolicies'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.trackPolicies"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfShowProgram']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'program'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.program"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfPostPresentations']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'presentations'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.presentations.short"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfPostSchedule']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'schedule'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.schedule"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfPostPayment']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'registration'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.registration"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfPostAccommodation']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'accommodation'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.accommodation"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfPostSupporters']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'about','op' => 'organizingTeam'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.supporters"), $this);?>
</a></li><?php endif; ?>
			<?php if ($this->_tpl_vars['schedConfPostTimeline']): ?><li>&#187; <a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'schedConf','op' => 'timeline'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "schedConf.timeline"), $this);?>
</a></li><?php endif; ?>
		</ul>
		<?php endif; ?>

		<?php if ($this->_tpl_vars['currentConference']): ?>
		<span class="blockSubtitle"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browse"), $this);?>
</span>
		<ul>
			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'search','op' => 'schedConfs'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browseByConference"), $this);?>
</a></li>
			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'search','op' => 'authors'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browseByAuthor"), $this);?>
</a></li>
			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('page' => 'search','op' => 'titles'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.browseByTitle"), $this);?>
</a></li>
			<?php if ($this->_tpl_vars['hasOtherConferences']): ?>
			<li><a href="<?php echo $this->_plugins['function']['url'][0][0]->smartyUrl(array('conference' => 'index'), $this);?>
"><?php echo $this->_plugins['function']['translate'][0][0]->smartyTranslate(array('key' => "navigation.otherConferences"), $this);?>
</a></li>
			<?php endif; ?>
		</ul>
		<?php endif; ?>
	</div>
