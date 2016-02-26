<?php

/**
 * @file ManagerLocationHandler.inc.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class ManagerLocationHandler
 * @ingroup pages_manager
 *
 * @brief Handle requests for changing scheduled conference location settings. 
 */

//$Id$

import('pages.manager.ManagerHandler');

class ManagerLocationHandler extends ManagerHandler {
	/**
	 * Constructor
	 **/
	function ManagerLocationHandler() {
		parent::ManagerHandler();
	}

	/**
	 * Display form to edit location settings.
	 */
	function location() {
		$this->validate();
		$this->setupTemplate(true);

		$schedConf =& Request::getSchedConf();
		if (!$schedConf) Request::redirect (null, null, 'index');

		import('manager.form.LocationSettingsForm');

		$settingsForm = new LocationSettingsForm();
		if ($settingsForm->isLocaleResubmit()) {
			$settingsForm->readInputData();
		} else {
			$settingsForm->initData();
		}
		$settingsForm->display();
	}

	/**
	 * Save changes to location settings.
	 */
	function saveLocationSettings() {
		$this->validate();
		$this->setupTemplate(true);

		$schedConf =& Request::getSchedConf();
		if (!$schedConf) Request::redirect (null, null, 'index');

		import('manager.form.LocationSettingsForm');

		$settingsForm = new LocationSettingsForm();
		$settingsForm->readInputData();

		$editData = false;

		$locationFiles =& $schedConf->getSetting('locationFiles');
		if (Request::getUserVar('uploadLocationFile')) {
			// Get a numeric key for this file.
			$thisFileKey = 0;
			if (isset($locationFiles[$settingsForm->getFormLocale()])) foreach ($locationFiles[$settingsForm->getFormLocale()] as $key => $junk) {
				$thisFileKey = $key + 1;
			}

			import('file.PublicFileManager');
			$fileManager = new PublicFileManager();
			$success = !$fileManager->uploadError('locationFile');
			if ($success && $success = $fileManager->uploadedFileExists('locationFile')) {
				$oldName = $fileManager->getUploadedFileName('locationFile');
				$extension = $fileManager->getExtension($oldName);
				if (!$extension) break;
				$uploadName = 'location-' . $thisFileKey . '.' . $extension;
				if ($success && $success = $fileManager->uploadSchedConfFile($schedConf->getId(), 'locationFile', $uploadName)) {
					$value = array(
						'name' => $oldName,
						'uploadName' => $uploadName,
						'dateUploaded' => Core::getCurrentDate(),
						'title' => Request::getUserVar('locationFileTitle')
					);
					$locationFiles[$settingsForm->getFormLocale()][$thisFileKey] =& $value;
					$settingsForm->setData('locationFiles', $locationFiles);
					$settingsForm->setData('locationFileTitle', '');
					$schedConf->updateSetting('locationFiles', $locationFiles, 'object', true);
				}
			}
			if (!$success) {
				$settingsForm->addError('locationFiles', __('common.uploadFailed'));
			}
			$editData = true;
		} else {
			$formLocale = $settingsForm->getFormLocale();
			$deleteKey = null;
			if (isset($locationFiles[$formLocale])) {
				foreach ($locationFiles[$formLocale] as $key => $junk) {
					if (Request::getUserVar("deleteLocationFile-$formLocale-$key")) $deleteKey = $key;
				}
			}
			if ($deleteKey !== null) {
				import('file.PublicFileManager');
				$fileManager = new PublicFileManager();
				if ($fileManager->removeSchedConfFile($schedConf->getId(), $locationFiles[$formLocale][$deleteKey]['uploadName'])) {
					unset($locationFiles[$formLocale][$deleteKey]);
					$schedConf->updateSetting('locationFiles', $locationFiles, 'object', true);
				}
				$editData = true;
			}
		}

		if (!$editData && $settingsForm->validate()) {
			$settingsForm->execute();

			$templateMgr =& TemplateManager::getManager();
			$templateMgr->assign(array(
				'currentUrl' => Request::url(null, null, null, 'location'),
				'pageTitle' => 'schedConf.location',
				'message' => 'common.changesSaved',
				'backLink' => Request::url(null, null, Request::getRequestedPage()),
				'backLinkLabel' => 'manager.conferenceSiteManagement'
			));
			$templateMgr->display('common/message.tpl');

		} else {
			$settingsForm->display();
		}
	}

}
?>
