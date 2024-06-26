<?php

/**
 * @file TimelineForm.inc.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class TimelineForm
 * @ingroup manager_form
 *
 * @brief Form for creating and modifying scheduled conference tracks.
 */

//$Id$

import('form.Form');

class TimelineForm extends Form {

	/** @var boolean can edit metadata */
	var $canEdit;

	/**
	 * Constructor.
	 * @param $trackId int omit for a new track
	 */
	function TimelineForm($overrideDates = false, $readOnly = false) {
		$this->canEdit = false;
		if (!$readOnly && Validation::isConferenceManager()) {
			$this->canEdit = true;
		}

		if ($this->canEdit) {
			parent::Form('manager/timelineEdit.tpl');
		} else {
			parent::Form('manager/timelineView.tpl');
		}
                
                //echo $schedConf->getSetting('endDate');

		if (!$overrideDates) {
			// Conference start must happen before conference end
			$this->addCheck(new FormValidatorCustom($this, 'endDate', 'required', 'manager.timeline.form.conferenceEndDateBeforeConferenceStart',
				create_function('$endDate,$form',
				'return ($endDate >= $form->getData(\'startDate\'));'),
				array(&$this)));

			// Conference start must happen before site move to archive
			$this->addCheck(new FormValidatorCustom($this, 'siteEndDate', 'required', 'manager.timeline.form.siteEndDateBeforeConferenceStart',
				create_function('$endDate,$form',
				'return ($endDate >= $form->getData(\'startDate\'));'),
				array(&$this)));

			// Conference start must happen after submission close
			$this->addCheck(new FormValidatorCustom($this, 'startDate', 'required', 'manager.timeline.form.conferenceStartDateBeforeSubmissionsClose',
				create_function('$startDate,$form',
				'return ($startDate >= $form->getData(\'submissionsCloseDate\'));'),
				array(&$this)));

			// Conference site start must happen before site end
			$this->addCheck(new FormValidatorCustom($this, 'siteStartDate', 'required', 'manager.timeline.form.siteEndDateBeforeSiteStart',
				create_function('$siteStartDate,$form',
				'return ($siteStartDate <= $form->getData(\'siteEndDate\'));'),
				array(&$this)));

			// Conference start must happen after site go-live
			$this->addCheck(new FormValidatorCustom($this, 'siteStartDate', 'required', 'manager.timeline.form.conferenceStartBeforeSiteStart',
				create_function('$siteStartDate,$form',
				'return ($siteStartDate <= $form->getData(\'startDate\'));'),
				array(&$this)));

			// Move to Conference Archive must come after Last Day of Conf
			$this->addCheck(new FormValidatorCustom($this, 'siteEndDate', 'required', 'manager.timeline.form.siteEndBeforeLastDay',
				create_function('$siteEndDate,$form',
				'return ($siteEndDate >= $form->getData(\'endDate\'));'),
				array(&$this)));

			// regAuthorOpenDate must be before regAuthorCloseDate
			$this->addCheck(new FormValidatorCustom($this, 'regAuthorOpenDate', 'required', 'manager.timeline.form.regAuthorCloseDateBeforeRegAuthorOpenDate',
				create_function('$regAuthorOpenDate,$form',
				'return ($regAuthorOpenDate <= $form->getData(\'regAuthorCloseDate\'));'),
				array(&$this)));

			// regReviewerOpenDate must be before regReviewerCloseDate
			$this->addCheck(new FormValidatorCustom($this, 'regReviewerOpenDate', 'required', 'manager.timeline.form.regReviewerCloseDateBeforeRegReviewerOpenDate',
				create_function('$regReviewerOpenDate,$form',
				'return ($regReviewerOpenDate <= $form->getData(\'regReviewerCloseDate\'));'),
				array(&$this)));

			// Submission CfP must come before Close Submissions
			$this->addCheck(new FormValidatorCustom($this, 'showCFPDate', 'required', 'manager.timeline.form.submissionsCloseBeforeCFP',
				create_function('$showCFPDate,$form',
				'return ($showCFPDate <= $form->getData(\'submissionsCloseDate\'));'),
				array(&$this)));
		}
		$this->addCheck(new FormValidatorPost($this));
	}

	/**
	 * Get the earliest and latest dates for the conference. These should
	 * be included on the timeline form date ranges as possibilities.
	 * @return array ($earliestDate, $latestDate)
	 */
	function getOutsideDates(&$schedConf) {
		$dates = array();
		if ($schedConf->getStartDate()) $dates[] = strtotime($schedConf->getStartDate());
		if ($schedConf->getEndDate()) $dates[] = strtotime($schedConf->getEndDate());
		foreach (array(
			'startDate', 'endDate',
			'regAuthorOpenDate', 'regAuthorCloseDate',
			'showCFPDate',
			'submissionsOpenDate', 'submissionsCloseDate',
			'regReviewerOpenDate', 'regReviewerCloseDate', 'closeReviewProcessDate',
			'postAbstractsDate', 'postScheduleDate', 'postPapersDate', 'postScheduleDate',
			'delayOpenAccessDate', 'closeCommentsDate'
		) as $dateSettingName) {
			$dateSetting = $schedConf->getSetting($dateSettingName);
			if ($dateSetting) $dates[] = $dateSetting;
		}

		$earliestDate = $latestDate = time();
		foreach ($dates as $date) {
			if (!$earliestDate || $earliestDate > $date) $earliestDate = $date;
			if (!$latestDate || $latestDate < $date) $latestDate = $date;
		}

		$secsPerYear = 60 * 60 * 24 * 366; // (Rounding up)
		$earliestDate = min($earliestDate, time() - $secsPerYear); // Last year must be included
		$latestDate = max($latestDate, time() + ($secsPerYear * SCHED_CONF_DATE_YEAR_OFFSET_FUTURE));

		return array($earliestDate, $latestDate);
	}

	/**
	 * Display the form.
	 */
	function display() {
		$schedConf =& Request::getSchedConf();
		$templateMgr =& TemplateManager::getManager();
		$templateMgr->assign('helpTopicId','conference.currentConferences.timeline');

		list($earliestDate, $latestDate) = $this->getOutsideDates($schedConf);
		$templateMgr->assign('firstYear', strftime('%Y', $earliestDate));
		$templateMgr->assign('lastYear', strftime('%Y', $latestDate));

		parent::display();
	}

	/**
	 * Initialize form data from current settings.
	 */
	function initData() {
		$schedConf =& Request::getSchedConf();

                //echo $schedConf->getSetting('endDate');
		$this->_data = array(
			'siteStartDate' => $schedConf->getStartDate(),
			'siteEndDate' => $schedConf->getEndDate(),

			'startDate' => $schedConf->getSetting('startDate'),
			'endDate' => $schedConf->getSetting('endDate'),

			'regAuthorOpenDate' => $schedConf->getSetting('regAuthorOpenDate'),
			'regAuthorCloseDate' => $schedConf->getSetting('regAuthorCloseDate'),
			'showCFPDate' => $schedConf->getSetting('showCFPDate'),
			'submissionsOpenDate' => $schedConf->getSetting('submissionsOpenDate'),
			'submissionsCloseDate' => $schedConf->getSetting('submissionsCloseDate'),
			'regReviewerOpenDate' => $schedConf->getSetting('regReviewerOpenDate'),
			'regReviewerCloseDate' => $schedConf->getSetting('regReviewerCloseDate'),
			'closeReviewProcessDate' => $schedConf->getSetting('closeReviewProcessDate'),
			'postAbstracts' => $schedConf->getSetting('postAbstracts'),
			'postAbstractsDate' => $schedConf->getSetting('postAbstractsDate'),
			'postSchedule' => $schedConf->getSetting('postSchedule'),
			'postScheduleDate' => $schedConf->getSetting('postScheduleDate'),
			'postPapers' => $schedConf->getSetting('postPapers'),
			'postPapersDate' => $schedConf->getSetting('postPapersDate'),
                    
			'postTimeline' => $schedConf->getSetting('postTimeline'),
                        'postTimelineOrder' => $schedConf->getSetting('postTimelineOrder'),
                        'postTimelineNavOrder' => $schedConf->getSetting('postTimelineNavOrder'),
			'postOverview' => $schedConf->getSetting('postOverview'),
                        'postOverviewOrder' => $schedConf->getSetting('postOverviewOrder'),
                        'postOverviewNavOrder' => $schedConf->getSetting('postOverviewNavOrder'),
                        'postAnnouncement' => $schedConf->getSetting('postAnnouncement'),
                        'postAnnouncementOrder' => $schedConf->getSetting('postAnnouncementOrder'),
                        'postAnnouncementNavOrder' => $schedConf->getSetting('postAnnouncementNavOrder'),
			'postCFP' => $schedConf->getSetting('postCFP'),
                        'postCFPOrder' => $schedConf->getSetting('postCFPOrder'),
                        'postCFPNavOrder' => $schedConf->getSetting('postCFPNavOrder'),
			'postProposalSubmission' => $schedConf->getSetting('postProposalSubmission'),
                        'postProposalSubmissionOrder' => $schedConf->getSetting('postProposalSubmissionOrder'),
                        'postProposalSubmissionNavOrder' => $schedConf->getSetting('postProposalSubmissionNavOrder'),
			'postTrackPolicies' => $schedConf->getSetting('postTrackPolicies'),
                        'postTrackPoliciesOrder' => $schedConf->getSetting('postTrackPoliciesOrder'),
                        'postTrackPoliciesNavOrder' => $schedConf->getSetting('postTrackPoliciesNavOrder'),
			'postProgram' => $schedConf->getSetting('postProgram'),
                        'postProgramOrder' => $schedConf->getSetting('postProgramOrder'),
                        'postProgramNavOrder' => $schedConf->getSetting('postProgramNavOrder'),
                        'postContact' => $schedConf->getSetting('postContact'),
                        'postContactOrder' => $schedConf->getSetting('postContactOrder'),
                        'postContactNavOrder' => $schedConf->getSetting('postContactNavOrder'),
			'postPresentations' => $schedConf->getSetting('postPresentations'),
                        'postPresentationsOrder' => $schedConf->getSetting('postPresentationsOrder'),
                        'postPresentationsNavOrder' => $schedConf->getSetting('postPresentationsNavOrder'),
			'postAccommodation' => $schedConf->getSetting('postAccommodation'),
                        'postAccommodationOrder' => $schedConf->getSetting('postAccommodationOrder'),
                        'postAccommodationNavOrder' => $schedConf->getSetting('postAccommodationNavOrder'),
                        'postLocation' => $schedConf->getSetting('postLocation'),
                        'postLocationOrder' => $schedConf->getSetting('postLocationOrder'),
                        'postLocationNavOrder' => $schedConf->getSetting('postLocationNavOrder'),
			'postSupporters' => $schedConf->getSetting('postSupporters'),
                        'postSupportersOrder' => $schedConf->getSetting('postSupportersOrder'),
                        'postSupportersNavOrder' => $schedConf->getSetting('postSupportersNavOrder'),
			'postPayment' => $schedConf->getSetting('postPayment'),
                        'postPaymentOrder' => $schedConf->getSetting('postPaymentOrder'),
                        'postPaymentNavOrder' => $schedConf->getSetting('postPaymentNavOrder'),
                    
			'delayOpenAccess' => $schedConf->getSetting('delayOpenAccess'),
			'delayOpenAccessDate' => $schedConf->getSetting('delayOpenAccessDate'),
			'closeComments' => $schedConf->getSetting('closeComments'),
			'closeCommentsDate' => $schedConf->getSetting('closeCommentsDate')
		);

		// Make sure the initial values are passable
		$timing = array(
			//  site go-live happens before conference start
			array('siteStartDate', 'startDate'),

			//  Submission CfP is before Close Submissions
			array('showCFPDate', 'submissionsCloseDate'),

			//  submissions close before the conference starts
			array('submissionsCloseDate', 'startDate'),

			// conference begins before it ends
			array('startDate', 'endDate'),

			// conference start happens before site moves to archive
			array('startDate', 'siteEndDate' ),

			//  conference site starts before site end
			array('siteStartDate', 'siteEndDate'),

			//  last day of conf is before conference archive
			array('endDate', 'siteEndDate'),

			//  regAuthorOpenDate is before regAuthorCloseDate
			array('regAuthorOpenDate', 'regAuthorCloseDate'),

			//  regReviewerOpenDate is before regReviewerCloseDate
			array('regReviewerOpenDate', 'regReviewerCloseDate')
		);

		// Ensure the default dates for the form are acceptable
		while (!$timingCorrect) {
			foreach ($timing as $rule) {
				$timingCorrect = true;
				if ($this->getData($rule[0]) == NULL) {
					$this->setData($rule[0], time());
                                }
				if ($this->getData($rule[1]) == NULL) {
					$this->setData($rule[1], time());
                                }

				if ($this->getData($rule[0]) >= $this->getData($rule[1])) {
                                    
                                    // 避免換一天，還是保持同一天
                                    $nextDay = mktime(0, 0, 0, date('m', $this->getData($rule[0])), date('d', $this->getData($rule[0])) + 1, date('Y', $this->getData($rule[0])));
                                    $nextDay--;
					$this->setData($rule[1], $nextDay);
					$timingCorrect = false;
				}
			}
		}

	}

	/**
	 * Assign form data to user-submitted data.
	 */
	function readInputData() {
		$this->readUserDateVars(array(
			'siteStartDate', 'siteEndDate',
			'startDate', 'endDate',
			'regAuthorOpenDate', 'regAuthorCloseDate',
			'showCFPDate',
			'submissionsOpenDate', 'submissionsCloseDate',
			'regReviewerOpenDate', 'regReviewerCloseDate', 'closeReviewProcessDate',
			'postAbstractsDate', 'postPapersDate', 'postScheduleDate',
			'delayOpenAccessDate',
			'closeCommentsDate'
		));

		$this->readUserVars(array(
			'postAbstracts',
			'postPapers',
			'postSchedule',
			'delayOpenAccess',
			'closeComments',
                    
			'postTimeline',
                        'postTimelineOrder',
                        'postTimelineNavOrder',
			'postOverview',
                        'postOverviewOrder',
                        'postOverviewNavOrder',
                        'postAnnouncement',
                        'postAnnouncementOrder',
                        'postAnnouncementNavOrder',
			'postCFP',
                        'postCFPOrder',
                        'postCFPNavOrder',
			'postProposalSubmission',
                        'postProposalSubmissionOrder',
                        'postProposalSubmissionNavOrder',
			'postTrackPolicies',
                        'postTrackPoliciesOrder',
                        'postTrackPoliciesNavOrder',
			'postProgram',
                        'postProgramOrder',
                        'postProgramNavOrder',
                        'postContact',
                        'postContactOrder',
                        'postContactNavOrder',
			'postPresentations',
                        'postPresentationsOrder',
                        'postPresentationsNavOrder',
			'postAccommodation',
                        'postAccommodationOrder',
                        'postAccommodationNavOrder',
                        'postLocation',
                        'postLocationOrder',
                        'postLocationNavOrder',
			'postSupporters',
                        'postSupportersOrder',
                        'postSupportersNavOrder',
			'postPayment',
                        'postPaymentOrder',
                        'postPaymentNavOrder'
		));
	}

	/**
	 * Save track.
	 */
	function execute() {
		$schedConfDao =& DAORegistry::getDao('SchedConfDAO');
		$schedConf =& Request::getSchedConf();

		import('conference.log.ConferenceLog');
		import('conference.log.ConferenceEventLogEntry');

		//
		// Don't log these, since they aren't particularly nefarious.
		//

		// Website start date and end date.

		if ($schedConf->getStartDate() != $this->_data['siteStartDate']) {
			$schedConf->setStartDate($this->_data['siteStartDate']);
			$schedConfDao->updateSchedConf($schedConf);
		}

		if ($schedConf->getEndDate() != $this->_data['siteEndDate']) {
			$schedConf->setEndDate($this->_data['siteEndDate']);
			$schedConfDao->updateSchedConf($schedConf);
		}

		// Conference Information display flags
		$schedConf->updateSetting('postTimeline', $this->getData('postTimeline'), 'bool');
                $schedConf->updateSetting('postTimelineOrder', $this->getData('postTimelineOrder'), 'int');
                $schedConf->updateSetting('postTimelineNavOrder', $this->getData('postTimelineNavOrder'), 'int');
		$schedConf->updateSetting('postOverview', $this->getData('postOverview'), 'bool');
                $schedConf->updateSetting('postOverviewOrder', $this->getData('postOverviewOrder'), 'int');
                $schedConf->updateSetting('postOverviewNavOrder', $this->getData('postOverviewNavOrder'), 'int');
                $schedConf->updateSetting('postAnnouncement', $this->getData('postAnnouncement'), 'bool');
                $schedConf->updateSetting('postAnnouncementOrder', $this->getData('postAnnouncementOrder'), 'int');
                $schedConf->updateSetting('postAnnouncementNavOrder', $this->getData('postAnnouncementNavOrder'), 'int');
		$schedConf->updateSetting('postCFP', $this->getData('postCFP'), 'bool');
                $schedConf->updateSetting('postCFPOrder', $this->getData('postCFPOrder'), 'int');
                $schedConf->updateSetting('postCFPNavOrder', $this->getData('postCFPNavOrder'), 'int');
		$schedConf->updateSetting('postProposalSubmission', $this->getData('postProposalSubmission'), 'bool');
                $schedConf->updateSetting('postProposalSubmissionOrder', $this->getData('postProposalSubmissionOrder'), 'int');
                $schedConf->updateSetting('postProposalSubmissionNavOrder', $this->getData('postProposalSubmissionNavOrder'), 'int');
		$schedConf->updateSetting('postTrackPolicies', $this->getData('postTrackPolicies'), 'bool');
                $schedConf->updateSetting('postTrackPoliciesOrder', $this->getData('postTrackPoliciesOrder'), 'int');
                $schedConf->updateSetting('postTrackPoliciesNavOrder', $this->getData('postTrackPoliciesNavOrder'), 'int');
		$schedConf->updateSetting('postProgram', $this->getData('postProgram'), 'bool');
                $schedConf->updateSetting('postProgramOrder', $this->getData('postProgramOrder'), 'int');
                $schedConf->updateSetting('postProgramNavOrder', $this->getData('postProgramNavOrder'), 'int');
                $schedConf->updateSetting('postContact', $this->getData('postContact'), 'bool');
                $schedConf->updateSetting('postContactOrder', $this->getData('postContactOrder'), 'int');
                $schedConf->updateSetting('postContactNavOrder', $this->getData('postContactNavOrder'), 'int');
		$schedConf->updateSetting('postPresentations', $this->getData('postPresentations'), 'bool');
                $schedConf->updateSetting('postPresentationsOrder', $this->getData('postPresentationsOrder'), 'int');
                $schedConf->updateSetting('postPresentationsNavOrder', $this->getData('postPresentationsNavOrder'), 'int');
		$schedConf->updateSetting('postAccommodation', $this->getData('postAccommodation'), 'bool');
                $schedConf->updateSetting('postAccommodationOrder', $this->getData('postAccommodationOrder'), 'int');
                $schedConf->updateSetting('postAccommodationNavOrder', $this->getData('postAccommodationNavOrder'), 'int');
                $schedConf->updateSetting('postLocation', $this->getData('postLocation'), 'bool');
                $schedConf->updateSetting('postLocationOrder', $this->getData('postLocationOrder'), 'int');
                $schedConf->updateSetting('postLocationNavOrder', $this->getData('postLocationNavOrder'), 'int');
		$schedConf->updateSetting('postSupporters', $this->getData('postSupporters'), 'bool');
                $schedConf->updateSetting('postSupportersOrder', $this->getData('postSupportersOrder'), 'int');
                $schedConf->updateSetting('postSupportersNavOrder', $this->getData('postSupportersNavOrder'), 'int');
		$schedConf->updateSetting('postPayment', $this->getData('postPayment'), 'bool');
                $schedConf->updateSetting('postPaymentOrder', $this->getData('postPaymentOrder'), 'int');
                $schedConf->updateSetting('postPaymentNavOrder', $this->getData('postPaymentNavOrder'), 'int');


		//
		// Log the rest.
		//

		$dateFormatShort = Config::getVar('general', 'date_format_short');

		// Physical scheduled conference start date and end date
		if ($schedConf->getSetting('startDate') != $this->_data['startDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.startDateChanged',
				array(	'oldStartDate' => strftime($dateFormatShort, $schedConf->getSetting('startDate')),
					'newStartDate' => strftime($dateFormatShort, $this->_data['startDate'])));
			$schedConf->updateSetting('startDate', $this->_data['startDate'], 'date');
		}

		if ($schedConf->getSetting('endDate') != $this->_data['endDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.endDateChanged',
				array('oldEndDate' => strftime($dateFormatShort, $schedConf->getSetting('endDate')),
					'newEndDate' => strftime($dateFormatShort, $this->_data['endDate'])));
			$schedConf->updateSetting('endDate', $this->_data['endDate'], 'date');
		}

		if ($schedConf->getSetting('regAuthorOpenDate') != $this->_data['regAuthorOpenDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.regAuthorOpenDateChanged',
				array('oldRegAuthorOpenDate' => strftime($dateFormatShort, $schedConf->getSetting('regAuthorOpenDate')),
					'newRegAuthorOpenDate' => strftime($dateFormatShort, $this->_data['regAuthorOpenDate'])));
			$schedConf->updateSetting('regAuthorOpenDate', $this->_data['regAuthorOpenDate'], 'date');
		}
		if ($schedConf->getSetting('regAuthorCloseDate') != $this->_data['regAuthorCloseDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.regAuthorCloseDateChanged',
				array('oldRegAuthorCloseDate' => strftime($dateFormatShort, $schedConf->getSetting('regAuthorCloseDate')),
					'newRegAuthorCloseDate' => strftime($dateFormatShort, $this->_data['regAuthorCloseDate'])));
			$schedConf->updateSetting('regAuthorCloseDate', $this->_data['regAuthorCloseDate'], 'date');
		}
		if ($schedConf->getSetting('showCFPDate') != $this->_data['showCFPDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.showCFPDateChanged',
				array(	'oldShowCFPDate' => strftime($dateFormatShort, $schedConf->getSetting('showCFPDate')),
					'newShowCFPDate' => strftime($dateFormatShort, $this->_data['showCFPDate'])));
			$schedConf->updateSetting('showCFPDate', $this->_data['showCFPDate'], 'date');
		}

		if ($schedConf->getSetting('submissionsOpenDate') != $this->_data['submissionsOpenDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.submissionsOpenDateChanged',
				array(	'oldSubmissionsOpenDate' => strftime($dateFormatShort, $schedConf->getSetting('submissionsOpenDate')),
					'newSubmissionsOpenDate' => strftime($dateFormatShort, $this->_data['submissionsOpenDate'])));
			$schedConf->updateSetting('submissionsOpenDate', $this->_data['submissionsOpenDate'], 'date');
		}
		if ($schedConf->getSetting('submissionsCloseDate') != $this->_data['submissionsCloseDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.submissionsCloseDateChanged',
				array('oldSubmissionsCloseDate' => strftime($dateFormatShort, $schedConf->getSetting('submissionsCloseDate')),
					'newSubmissionsCloseDate' => strftime($dateFormatShort, $this->_data['submissionsCloseDate'])));
			$schedConf->updateSetting('submissionsCloseDate', $this->_data['submissionsCloseDate'], 'date');
		}
		if ($schedConf->getSetting('regReviewerOpenDate') != $this->_data['regReviewerOpenDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.regReviewerOpenDateChanged',
				array('oldRegReviewerOpenDate' => strftime($dateFormatShort, $schedConf->getSetting('regReviewerOpenDate')),
					'newRegReviewerOpenDate' => strftime($dateFormatShort, $this->_data['regReviewerOpenDate'])));
			$schedConf->updateSetting('regReviewerOpenDate', $this->_data['regReviewerOpenDate'], 'date');
		}
		if ($schedConf->getSetting('regReviewerCloseDate') != $this->_data['regReviewerCloseDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.regReviewerCloseDateChanged',
				array('oldRegReviewerCloseDate' => strftime($dateFormatShort, $schedConf->getSetting('regReviewerCloseDate')),
					'newRegReviewerCloseDate' => strftime($dateFormatShort, $this->_data['regReviewerCloseDate'])));
			$schedConf->updateSetting('regReviewerCloseDate', $this->_data['regReviewerCloseDate'], 'date');
		}
		if ($schedConf->getSetting('postAbstractsDate') != $this->_data['postAbstractsDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.postAbstractsDateChanged',
				array(	'oldPostAbstractsDate' => strftime($dateFormatShort, $schedConf->getSetting('postAbstractsDate')),
					'newPostAbstractsDate' => strftime($dateFormatShort, $this->_data['postAbstractsDate'])));
			$schedConf->updateSetting('postAbstractsDate', $this->_data['postAbstractsDate'], 'date');
		}
		if ($schedConf->getSetting('postAbstracts') != $this->_data['postAbstracts']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.postAbstractsChanged',
				array(	'oldPostAbstracts' => __($schedConf->getSetting('postAbstracts')?'common.true':'common.false'),
					'newPostAbstracts' => __($this->_data['postAbstracts'])?'common.true':'common.false'));
			$schedConf->updateSetting('postAbstracts', $this->_data['postAbstracts'], 'bool');
		}
		if ($schedConf->getSetting('postScheduleDate') != $this->_data['postScheduleDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.postScheduleDateChanged',
				array(  'oldPostScheduleDate' => strftime($dateFormatShort, $schedConf->getSetting('postPapersDate')),
					'newPostScheduleDate' => strftime($dateFormatShort, $this->_data['postPapersDate'])));
			$schedConf->updateSetting('postScheduleDate', $this->_data['postScheduleDate'], 'date');
		}
		if ($schedConf->getSetting('postSchedule') != $this->_data['postSchedule']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.postScheduleChanged',
				array(  'oldPostSchedule' => __($schedConf->getSetting('postSchedule')?'common.true':'common.false'),
					'newPostSchedule' => __($this->_data['postSchedule']?'common.true':'common.false')));
			$schedConf->updateSetting('postSchedule', $this->_data['postSchedule'], 'bool');
		}
		if ($schedConf->getSetting('postPapersDate') != $this->_data['postPapersDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.postPapersDateChanged',
				array(	'oldPostPapersDate' => strftime($dateFormatShort, $schedConf->getSetting('postPapersDate')),
					'newPostPapersDate' => strftime($dateFormatShort, $this->_data['postPapersDate'])));
			$schedConf->updateSetting('postPapersDate', $this->_data['postPapersDate'], 'date');
		}
		if ($schedConf->getSetting('postPapers') != $this->_data['postPapers']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.postPapersChanged',
				array(	'oldPostPapers' => __($schedConf->getSetting('postPapers')?'common.true':'common.false'),
					'newPostPapers' => __($this->_data['postPapers']?'common.true':'common.false')));
			$schedConf->updateSetting('postPapers', $this->_data['postPapers'], 'bool');
		}
		if ($schedConf->getSetting('delayOpenAccessDate') != $this->_data['delayOpenAccessDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.delayOpenAccessDateChanged',
				array(	'oldDelayOpenAccessDate' => strftime($dateFormatShort, $schedConf->getSetting('delayOpenAccessDate')),
					'newDelayOpenAccessDate' => strftime($dateFormatShort, $this->_data['delayOpenAccessDate'])));
			$schedConf->updateSetting('delayOpenAccessDate', $this->_data['delayOpenAccessDate'], 'date');
		}
		if ($schedConf->getSetting('delayOpenAccess') != $this->_data['delayOpenAccess']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.delayOpenAccessChanged',
				array(	'oldDelayOpenAccess' => __($schedConf->getSetting('delayOpenAccess')?'common.true':'common.false'),
					'newDelayOpenAccess' => __($this->_data['delayOpenAccess']?'common.true':'common.false')));
			$schedConf->updateSetting('delayOpenAccess', $this->_data['delayOpenAccess'], 'bool');
		}
		if ($schedConf->getSetting('closeCommentsDate') != $this->_data['closeCommentsDate']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.closeCommentsDateChanged',
				array(	'oldCloseCommentsDate' => strftime($dateFormatShort, $schedConf->getSetting('closeCommentsDate')),
					'newCloseCommentsDate' => strftime($dateFormatShort, $this->_data['closeCommentsDate'])));
			$schedConf->updateSetting('closeCommentsDate', $this->_data['closeCommentsDate'], 'date');
		}
		if ($schedConf->getSetting('closeComments') != $this->_data['closeComments']) {
			ConferenceLog::logEvent(
				$schedConf->getConferenceId(),
				$schedConf->getId(),
				CONFERENCE_LOG_CONFIGURATION,
				LOG_TYPE_DEFAULT,
				0, 'log.timeline.closeCommentsChanged',
				array(	'oldCloseComments' => __($schedConf->getSetting('closeComments')?'common.true':'common.false'),
					'newCloseComments' => __($this->_data['closeComments']?'common.true':'common.false')));
			$schedConf->updateSetting('closeComments', $this->_data['closeComments'], 'bool');
		}
	}
}

?>
