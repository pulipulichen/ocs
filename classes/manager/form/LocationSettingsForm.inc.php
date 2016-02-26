<?php

/**
 * @defgroup manager_form
 */

/**
 * @file LocationSettingsForm.inc.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class LocationForm
 * @ingroup manager_form
 *
 * @brief Form for modifying scheduled conference location settings.
 *
 */

// $Id$


import('form.Form');

class LocationSettingsForm extends Form {

	/** @var array the setting names */
	var $settings;

	/**
	 * Constructor.
	 */
	function LocationSettingsForm() {
		parent::Form('manager/locationSettings.tpl');

		$this->addCheck(new FormValidatorPost($this));
	}

	/**
	 * Display the form.
	 */
	function display() {
		import('file.PublicFileManager');
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		$site =& Request::getSite();
		$templateMgr->assign('helpTopicId','conference.currentConferences.location');
		$templateMgr->assign('publicSchedConfFilesDir', Request::getBaseUrl() . '/' . PublicFileManager::getSchedConfFilesPath($schedConf->getId()));
		$templateMgr->assign('locationFiles', $schedConf->getSetting('locationFiles'));
		parent::display();
	}

	/**
	 * Initialize form data from current settings.
	 */
	function initData() {
		$schedConf =& Request::getSchedConf();
		$this->_data = array();
		$this->_data['locationDescription'] = $schedConf->getSetting('locationDescription');
	}
	
	/**
	 * Get the list of field names for which localized settings are used.
	 * @return array
	 */
	function getLocaleFieldNames() {
		return array('locationDescription', 'locationFileTitle');
	}

	/**
	 * Assign form data to user-submitted data.
	 */
	function readInputData() {
		$this->readUserVars(array('locationDescription', 'locationFileTitle'));
	}

	/**
	 * Save modified settings.
	 */
	function execute() {
		$schedConf =& Request::getSchedConf();
		$settingsDao =& DAORegistry::getDAO('SchedConfSettingsDAO');

		foreach ($this->_data as $name => $value) {
			$settingsDao->updateSetting(
				$schedConf->getId(),
				$name,
				$value,
				$this->settings[$name],
				true // Localized
			);
		}
	}
}

?>
