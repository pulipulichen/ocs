<?php

/**
 * @file SchedConfHandler.inc.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class SchedConfHandler
 * @ingroup pages_schedConf
 *
 * @brief Handle requests for scheduled conference functions.
 *
 */

// $Id$


import('schedConf.SchedConfAction');
import('payment.ocs.OCSPaymentManager');
import('handler.Handler');

class SchedConfHandler extends Handler {
	/**
	 * Constructor
	 **/
	function SchedConfHandler() {
		parent::Handler();

		$this->addCheck(new HandlerValidatorConference($this));
		$this->addCheck(new HandlerValidatorSchedConf($this));
	}

	/**
	 * Display scheduled conference view page.
	 */
	function index($args) {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		$this->setupTemplate($conference, $schedConf);
		$enableAnnouncements = $conference->getSetting('enableAnnouncements');

		if ($enableAnnouncements) {
			$enableAnnouncementsHomepage = $conference->getSetting('enableAnnouncementsHomepage');
			if ($enableAnnouncementsHomepage) {
				$numAnnouncementsHomepage = $conference->getSetting('numAnnouncementsHomepage');
				$announcementDao =& DAORegistry::getDAO('AnnouncementDAO');
				$announcements =& $announcementDao->getNumAnnouncementsNotExpiredByConferenceId($conference->getId(), $schedConf->getId(), $numAnnouncementsHomepage);
				$templateMgr->assign('announcements', $announcements);
				$templateMgr->assign('enableAnnouncementsHomepage', $enableAnnouncementsHomepage);
			}
		}

		$templateMgr->assign('schedConf', $schedConf);

                AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_MANAGER, LOCALE_COMPONENT_OCS_DIRECTOR)); // FIXME: For timeline constants
                $templateMgr->assign('pageHierarchyRoot', true);
		$templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, $conference->getSetting('path'), 'index'), AppLocale::Translate('navigation.home'), true)));
                
		$templateMgr->assign('homepageImage', $conference->getLocalizedSetting('homepageImage'));
		$templateMgr->assign('homepageImageAltText', $conference->getLocalizedSetting('homepageImageAltText'));
		$templateMgr->assign('helpTopicId', 'user.currentArchives');
                
                
                // ----------------------
                $roleDao =& DAORegistry::getDAO('RoleDAO');
                $user = Request::getUser();

//                $isConferenceManager = false;
//                $isDirector = false;
//                $isTrackDirector = false;
//                $isAuthor = false;
//                if (isset($user)) {
//                    $roles =& $roleDao->getRolesByUserId($user->getId(), $conference->getId(), $schedConf->getId());
//                    foreach ($roles AS $role) {
//                        $roleId = $role->_data['roleId'];
//                        //echo $roleId . "|";
//                        if (intval($roleId) === 4096) {
//                            $isConferenceManager = true;
//                        }
//                        else if (intval($roleId) === 256) {
//                            $isDirector = true;
//                        }
//                        else if (intval($roleId) === 128) {
//                            $isTrackDirector = true;
//                        }
//                        else if (intval($roleId) === 64) {
//                            $isAuthor = true;
//                        }
//                    }
//                }
                //$roles =& $roleDao->getRolesByUserId($user->getId(), $conference->getId());
                //print_r($roles);
                $templateMgr->assign('isConferenceManager', Validation::isConferenceManager($conference->getId()));
                $templateMgr->assign('isDirector', Validation::isDirector($conference->getId(), $schedConf->getId()));
                $templateMgr->assign('isTrackDirector', Validation::isTrackDirector($conference->getId(), $schedConf->getId()));
                $templateMgr->assign('isAuthor', Validation::isAuthor($conference->getId(), $schedConf->getId()));
                $templateMgr->assign('isIndex', true);
                // -------------------------
                $templateMgr->assign("conferenceUrl", Request::url(null, 'index'));
                $templateMgr->assign("schedConfUrl", Request::url(null, $conference->getSetting('path')));
                $templateMgr->assign("conferenceId", $conference->getId());
                $templateMgr->assign("schedConfId", $schedConf->getId());
                $templateMgr->assign("directorUrl", Request::url(null, $conference->getSetting('path'), 'director'));
                $templateMgr->assign("trackDirectorUrl", Request::url(null, $conference->getSetting('path'), 'trackDirector'));
                $templateMgr->assign("authorUrl", Request::url(null, $conference->getSetting('path'), 'author'));
                $templateMgr->assign("managerUrl", Request::url(null, $conference->getSetting('path'), 'manager'));
                // --------------------------
                
		$templateMgr->display('schedConf/index.tpl');

	}

	/**
	 * Display track policies
	 */
	function trackPolicies() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		$templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
			array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

		$trackDao =& DAORegistry::getDAO('TrackDAO');
		$trackDirectorsDao =& DAORegistry::getDAO('TrackDirectorsDAO');
		$tracks = array();
		$tracks =& $trackDao->getSchedConfTracks($schedConf->getId());
		$tracks =& $tracks->toArray();
		$templateMgr->assign_by_ref('tracks', $tracks);
		$trackDirectors = array();
		foreach ($tracks as $track) {
			$trackDirectors[$track->getId()] =& $trackDirectorsDao->getDirectorsByTrackId($schedConf->getId(), $track->getId());
		}
		$templateMgr->assign_by_ref('trackDirectors', $trackDirectors);

		$templateMgr->assign('helpTopicId', 'conference.currentConferences.tracks');
		$templateMgr->display('schedConf/trackPolicies.tpl');
	}

	/**
	 * Display conference overview page
	 */
	function overview() {
            
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, null, 'index'), AppLocale::Translate('navigation.home'), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

		$templateMgr->assign('overview', $schedConf->getLocalizedSetting('overview'));

		$templateMgr->assign('helpTopicId', 'user.home');
		$templateMgr->display('schedConf/overview.tpl');
	}

	/**
	 * Display read-only timeline
	 */
	function timeline() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);
		AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_MANAGER)); // FIXME: For timeline constants
		import('manager.form.TimelineForm');
                
                $templateMgr->assign('pageHierarchyRoot', true);
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, $conference->getSetting('path'), 'index'), AppLocale::Translate('navigation.home'), true), 
                        array(Request::url(null, null, 'index'), AppLocale::Translate('schedConf.timeline'), true)));
                
                
		if (checkPhpVersion('5.0.0')) { // WARNING: This form needs $this in constructor
			$timelineForm = new TimelineForm(false, true);
		} else {
			$timelineForm =& new TimelineForm(false, true);
		}
		$timelineForm->initData();
		$timelineForm->display();
	}

	/**
	 * Display conference CFP page
	 */
	function cfp() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		SchedConfHandler::setupTemplate($conference,$schedConf);
		AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_AUTHOR));

                //$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		$templateMgr->assign('pageHierarchyRoot', true);
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, $conference->getSetting('path'), 'index'), AppLocale::Translate('navigation.home'), true), 
                        array(Request::url(null, null, 'index'), AppLocale::Translate('schedConf.cfp.title'), true)));
                
                
		$templateMgr->assign('cfpMessage', $schedConf->getLocalizedSetting('cfpMessage'));
                $templateMgr->assign('authorProfileTemplate', $schedConf->getLocalizedSetting('authorProfileTemplate'));
		$templateMgr->assign('authorGuidelines', $schedConf->getLocalizedSetting('authorGuidelines'));
                $templateMgr->assign('addSuppFileMessage', $schedConf->getLocalizedSetting('addSuppFileMessage'));
                $templateMgr->assign('stepFinalMessage', $schedConf->getLocalizedSetting('stepFinalMessage'));
                $templateMgr->assign('uploadInstructions', $schedConf->getLocalizedSetting('uploadInstructions'));

		$submissionsOpenDate = $schedConf->getSetting('submissionsOpenDate');
		$submissionsCloseDate = $schedConf->getSetting('submissionsCloseDate');

		if(!$submissionsOpenDate || !$submissionsCloseDate || time() < $submissionsOpenDate) {
			// Too soon
			$acceptingSubmissions = false;
			$notAcceptingSubmissionsMessage = __('author.submit.notAcceptingYet');
		} elseif (time() > $submissionsCloseDate) {
			// Too late
			$acceptingSubmissions = false;
			$notAcceptingSubmissionsMessage = __('author.submit.submissionDeadlinePassed', array('closedDate' => strftime(Config::getVar('general', 'date_format_short'), $submissionsCloseDate)));
		} else {
			$acceptingSubmissions = true;
		}

		$templateMgr->assign('acceptingSubmissions', $acceptingSubmissions);
		if (!$acceptingSubmissions) $templateMgr->assign('notAcceptingSubmissionsMessage', $notAcceptingSubmissionsMessage);
		$templateMgr->assign('helpTopicId', 'conference.currentConferences.setup.submissions');
		$templateMgr->display('schedConf/cfp.tpl');
	}

	/**
	 * Display conference registration page
	 */
	function registration() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$paymentManager =& OCSPaymentManager::getManager();
		if (!$paymentManager->isConfigured()) {
                    //Request::redirect(null, null, 'index');
                    echo "payment manager is not configured";
                    return;
                }

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, null, 'index'), AppLocale::Translate('navigation.home'), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

		$user =& Request::getUser();
		$registrationDao =& DAORegistry::getDAO('RegistrationDAO');
		if ($user && ($registrationId = $registrationDao->getRegistrationIdByUser($user->getId(), $schedConf->getId()))) {
			// This user has already registered.
			$registration =& $registrationDao->getRegistration($registrationId);

			import('payment.ocs.OCSPaymentManager');
			$paymentManager =& OCSPaymentManager::getManager();

			if (!$paymentManager->isConfigured() || !$registration || $registration->getDatePaid()) {
				// If the system isn't fully configured or the registration is already paid,
				// display a message and block the user from going further.
                                
                                $this->_registrationDisplay($registration);
                                
                                return;
			}
		}

		$typeId = (int) Request::getUserVar('registrationTypeId');
		if ($typeId) {
			// A registration type has been chosen
			import('registration.form.UserRegistrationForm');

			if (checkPhpVersion('5.0.0')) { // WARNING: This form needs $this in constructor
				$form = new UserRegistrationForm($typeId);
			} else {
				$form =& new UserRegistrationForm($typeId);
			}
			if ($form->isLocaleResubmit()) {
				$form->readInputData();
			} else {
				$form->initData();
			}
			$form->display();
		} else {
			// A registration type has not been chosen; prompt for one.
			$registrationTypeDao =& DAORegistry::getDAO('RegistrationTypeDAO');
			$registrationTypes =& $registrationTypeDao->getRegistrationTypesBySchedConfId($schedConf->getId());
			$templateMgr->assign_by_ref('registrationTypes', $registrationTypes);
			return $templateMgr->display('registration/selectRegistrationType.tpl');
		}
	}
        
        function _registrationDisplay($registration) {
            import('registration.form.UserRegistrationForm');
                                
            $typeId = $registration->getTypeId();

            if (checkPhpVersion('5.0.0')) { // WARNING: This form needs $this in constructor
                    $form = new UserRegistrationForm($typeId);
            } else {
                    $form =& new UserRegistrationForm($typeId);
            }
            if ($form->isLocaleResubmit()) {
                    $form->readInputData();
            } else {
                    $form->initData();
            }

            //echo $registration->getTypeId();
            $registrationTypeDao =& DAORegistry::getDAO('RegistrationTypeDAO');
            $registrationType =& $registrationTypeDao->getRegistrationType(
                    $registration->getTypeId()
            );
//            if ($registrationType->getCost() > 0) {
//                //$templateMgr->assign('message', 'schedConf.registration.alreadyRegisteredAndPaid');
//            }
//            else {
//                //$templateMgr->assign('message', 'schedConf.registration.alreadyRegisteredNoPaid');
//            }

            //$templateMgr->assign('email', $schedConf->getSetting('contactEmail'));
            //$templateMgr->assign('backLinkLabel', 'common.back');
            //$templateMgr->assign('backLink', Request::url(null, null, 'index'));
            //return $templateMgr->display('common/message.tpl');

            $form->display();
        }
        
        /**
	 * Display conference registration page
	 */
	function deleteRegistration() {
            $user =& Request::getUser();
            if (isset($user)) {
                $registrationDao =& DAORegistry::getDAO('RegistrationDAO');
                $registrationDao->deleteRegistrationsByUserId($user->getUserId());
            }
            Request::redirect(null, null, null, 'registration');
        }
        
        /**
	 * Display conference registration page
	 */
	function updateRegistration() {
            $user =& Request::getUser();
            $schedConf =& Request::getSchedConf();
            $registrationDao =& DAORegistry::getDAO('RegistrationDAO');
            
            if ($user && ($registrationId = $registrationDao->getRegistrationIdByUser($user->getId(), $schedConf->getId()))) {
                $registration =& $registrationDao->getRegistration($registrationId);
                $registration->setSpecialRequests(Request::getUserVar("specialRequests"));
                $registration->setSurvey(Request::getUserVar("survey"));
                $registration->setApplicationForm(Request::getUserVar("applicationForm"));
                //$registration->setData("applicationForm", Request::getUserVar("applicationForm"), null);
                //$registration->setData("survey", Request::getUserVar("survey"), null);
                
                $registrationDao->updateRegistration($registration);
                //echo $registration->getData("applicationForm");
                //exit;
            }
            //echo Request::getUserVar("specialRequests");
            //exit;
            Request::redirect(null, null, null, 'registration');
        }

	/**
	 * Handle submission of the user registration form
	 */
	function register() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$paymentManager =& OCSPaymentManager::getManager();
		if (!$paymentManager->isConfigured()) {
                    Request::redirect(null, null, 'index');
                }

		$user =& Request::getUser();
		$registrationDao =& DAORegistry::getDAO('RegistrationDAO');
		if ($user && ($registrationId = $registrationDao->getRegistrationIdByUser($user->getId(), $schedConf->getId()))) {
			// This user has already registered.
			$registration =& $registrationDao->getRegistration($registrationId);
                        $this->_updateRegistration($registrationDao, $registration);
//                        $isUpdate = Request::getUserVar("update");
                        if ( !$registration || $registration->getDatePaid() ) {
				// And they have already paid. Redirect to a message explaining.
//                                $notifyEmail = Request::getUserVar("notifyEmail");
//                                
//                                if ($notifyEmail) {
//                                    echo "有！";
//                                    exit;
//                                    //$this->notifyEmail($registration->getTypeId());
//                                }
//                                else {
//                                    echo '沒有!!';
//                                    exit;
//                                }
                                
				Request::redirect(null, null, null, 'registration');
			} else {
				// Allow them to resubmit the form to change type or pay again.
				$registrationDao->deleteRegistrationById($registrationId);
			}
		}

		$templateMgr =& TemplateManager::getManager();
		$templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
			array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

		import('registration.form.UserRegistrationForm');
		$typeId = (int) Request::getUserVar('registrationTypeId');
		if (checkPhpVersion('5.0.0')) { // WARNING: This form needs $this in constructor
			$form = new UserRegistrationForm($typeId);
		} else {
			$form =& new UserRegistrationForm($typeId);
		}
		$form->readInputData();
		if ($form->validate()) {
			if (($registrationError = $form->execute()) != REGISTRATION_SUCCESSFUL) {
				$templateMgr->assign('isUserLoggedIn', Validation::isLoggedIn()); // In case a user was just created, make sure they appear logged in
				if ($registrationError == REGISTRATION_FAILED) {
					// User not created
					$templateMgr->assign('message', 'schedConf.registration.failed');
					$templateMgr->assign('backLinkLabel', 'common.back');
					$templateMgr->assign('backLink', Request::url(null, null, 'index'));
					$templateMgr->display('common/message.tpl');
				} elseif ($registrationError == REGISTRATION_NO_PAYMENT) {
					// Automatic payment failed; display a generic
					// "you will be contacted" message.
					$templateMgr->assign('message', 'schedConf.registration.noPaymentMethodAvailable');
					$templateMgr->assign('backLinkLabel', 'common.back');
					$templateMgr->assign('backLink', Request::url(null, null, 'index'));
					$templateMgr->display('common/message.tpl');
				} elseif ($registrationError == REGISTRATION_FREE) {
					// Registration successful; no payment required (free)
					$templateMgr->assign('message', 'schedConf.registration.free');
					$templateMgr->assign('backLinkLabel', 'common.back');
					$templateMgr->assign('backLink', Request::url(null, null, 'index'));
					//$templateMgr->display('common/message.tpl');
                                        //$registration =& $registrationDao->getRegistration($registrationId);
                                        //$this->_registrationDisplay($registration);
                                        //$this->_updateRegistration($registrationDao, $registration);
                                        $notifyEmail = Request::getUserVar("notifyEmail");
                                        $registrationTypeId = (int) Request::getUserVar("registrationTypeId");
                                        if ($notifyEmail) {
                                            $this->notifyEmail($registrationTypeId);
                                        }
                                        Request::redirect(null, null, null, 'registration');
                                        return;
				}
			}
			// Otherwise, payment is handled for us.
		} else {
			$templateMgr->assign('isUserLoggedIn', Validation::isLoggedIn()); // In case a user was just created, make sure they appear logged in
			$form->display();
		}
	}
        
        function _updateRegistration($registrationDao, $registration) {
            $registration->setSpecialRequests(Request::getUserVar("specialRequests"));
            $registration->setSurvey(Request::getUserVar("survey"));
            $registration->setApplicationForm(Request::getUserVar("applicationForm"));
            $registrationDao->updateRegistration($registration);
        }
        
        function notifyEmail($typeId) {
            
		$schedConf =& Request::getSchedConf();
                
                // Send user registration notification email
                $userDao =& DAORegistry::getDAO('UserDAO');
                $registrationTypeDao =& DAORegistry::getDAO('RegistrationTypeDAO');

                $schedConfName = $schedConf->getSchedConfTitle();
                $schedConfId = $schedConf->getId();
                $user = Request::getUser();
                $registrationType =& $registrationTypeDao->getRegistrationType($typeId);

                list($registrationEmail, $registrationName, $registrationContactSignature) = $this->getRegistrationContactInformation($schedConfId);

                $paramArray = array(
                        'registrantName' => $user->getFullName(),
                        'schedConfName' => $schedConfName,
                        'registrationType' => $registrationType->getRegistrationTypeName(),
                         //'username' => $user->getUsername(),
                         'username' => $user->getEmail(),
                        'registrationContactSignature' => $registrationContactSignature 
                );

                import('mail.MailTemplate');
                $mail = new MailTemplate('REGISTRATION_NOTIFY', null, null, null, null, false);
                $mail->setFrom($registrationEmail, $registrationName);
                $mail->assignParams($paramArray);
                $mail->addRecipient($user->getEmail(), $user->getFullName());
                $mail->send();
        }
        
        /**
	 * Get the scheduled conference's contact information
	 * @param $schedConfId int
	 * @return array
	 */
	function getRegistrationContactInformation($schedConfId) {
		$schedConfSettingsDao =& DAORegistry::getDAO('SchedConfSettingsDAO');
		
		$registrationName = $schedConfSettingsDao->getSetting($schedConfId, 'registrationName');
		$registrationEmail = $schedConfSettingsDao->getSetting($schedConfId, 'registrationEmail');
		$registrationPhone = $schedConfSettingsDao->getSetting($schedConfId, 'registrationPhone');
		$registrationFax = $schedConfSettingsDao->getSetting($schedConfId, 'registrationFax');
		$registrationMailingAddress = $schedConfSettingsDao->getSetting($schedConfId, 'registrationMailingAddress');
		$registrationContactSignature = $registrationName;

		if ($registrationMailingAddress != '') $registrationContactSignature .= "\n" . $registrationMailingAddress;
		if ($registrationPhone != '') $registrationContactSignature .= "\n" . AppLocale::Translate('user.phone') . ': ' . $registrationPhone;
		if ($registrationFax != '')	$registrationContactSignature .= "\n" . AppLocale::Translate('user.fax') . ': ' . $registrationFax;

		$registrationContactSignature .= "\n" . AppLocale::Translate('user.email') . ': ' . $registrationEmail;
		
		return array($registrationEmail, $registrationName, $registrationContactSignature);
	}
        

	/**
	 * Display conference program page
	 */
	function program() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

                //AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_DIRECTOR)); // FIXME: director.allTracks
                
                $templateMgr->assign('pageHierarchyRoot', true);
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, $conference->getSetting('path'), 'index'), AppLocale::Translate('navigation.home'), true), 
                        array(Request::url(null, null, 'index'), AppLocale::Translate('schedConf.program.title'), true))
                        );
                
		$templateMgr->assign('program', $schedConf->getSetting('program', AppLocale::getLocale()));
		$templateMgr->assign('programFile', $schedConf->getSetting('programFile', AppLocale::getLocale()));
		$templateMgr->assign('programFileTitle', $schedConf->getSetting('programFileTitle', AppLocale::getLocale()));
		$templateMgr->assign('helpTopicId', 'conference.currentConferences.program');
                
		$templateMgr->display('schedConf/program.tpl');
	}
        
        /**
	 * Display conference program page
	 */
	function page() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();
                
                $url = Request::getUserVar('url');
                $title = Request::getUserVar('title');

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

                //AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_DIRECTOR)); // FIXME: director.allTracks
                
                $templateMgr->assign('pageHierarchyRoot', true);
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, $conference->getSetting('path'), 'index'), AppLocale::Translate('navigation.home'), true), 
                        array(Request::url(null, null, 'index'), $title, true)));
                
		$templateMgr->assign('title', $title);
                $templateMgr->assign('url', $url);
		$templateMgr->assign('helpTopicId', 'conference.currentConferences.page');
                
		$templateMgr->display('schedConf/page.tpl');
	}
        
        function survey() {
                if (Validation::isLoggedIn() === FALSE) {
                    Validation::redirectLogin();
		}
            
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();
                
                $id = Request::getUserVar('id');
                $navItems = $conference->getLocalizedSetting('navItems');
                $navItem = $navItems[intval($id)];
                $title = $navItem["name"];

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

                //AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_DIRECTOR)); // FIXME: director.allTracks
                
                $templateMgr->assign('pageHierarchyRoot', true);
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, $conference->getSetting('path'), 'index'), AppLocale::Translate('navigation.home'), true), 
                        array(Request::url(null, null, 'index'), $title, true)));
                
                //$data = Request::getUserVar('data');
                $user = Request::getUser();
                
                
                
                if ($user) {
                    $settingKey = 'survey_' . $conference->getId() . "_" . $id;
                    if (Request::getUserVar('save') !== null) {
                        $data = Request::getUserVar('data');
                        $user->updateSetting($settingKey, $data, 'string', $conference->getId());
                    }
                    else {
                        $data = $user->getSetting($settingKey);
                    }
                }
                if (!$data) {
                    $data = '{}';
                }
                
		$templateMgr->assign('title', $title);
                $templateMgr->assign('survey', $navItem["survey"]);
                $templateMgr->assign('data', $data);
		$templateMgr->assign('helpTopicId', 'conference.currentConferences.survey');
                
		$templateMgr->display('schedConf/survey.tpl');
	}
        
        function navPage() {
		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();
                
                $id = Request::getUserVar('id');
                $navItems = $conference->getLocalizedSetting('navItems');
                $navItem = $navItems[intval($id)];
                $title = $navItem["name"];

		$templateMgr =& TemplateManager::getManager();
		SchedConfHandler::setupTemplate($conference,$schedConf);

                $templateMgr->assign('pageHierarchyRoot', true);
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, $conference->getSetting('path'), 'index'), AppLocale::Translate('navigation.home'), true), 
                        array(Request::url(null, null, 'index'), $title, true)));
                
		$templateMgr->assign('title', $title);
                $templateMgr->assign('navPage', $navItem["navPage"]);
                $templateMgr->assign('navId', $id);
		$templateMgr->assign('helpTopicId', 'conference.currentConferences.navPage');
                
		$templateMgr->display('schedConf/navPage.tpl');
	}
        
        function surveyExport() {
            
            $id = Request::getUserVar('id');
            
            $conferenceSettingsDao =& DAORegistry::getDAO('ConferenceSettingsDAO');
            $conference =& Request::getConference();
            $output = $conferenceSettingsDao->getSurvey($conference->getId(), $id);
            
            
            //print_r($output);
            
            header('Content-Disposition: attachment; filename="export_survey_'.$conference->getId().'_'.$id.'.csv"');
            header('Content-Type: text/csv'); # Don't use application/force-download - it's not a real MIME type, and the Content-Disposition header is sufficient
            header('Content-Length: ' . strlen($output));
            header('Connection: close');
            
            echo $output;
        }

	/**
	 * Display conference schedule page
	 */
	function schedule() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$postScheduleDate = $schedConf->getSetting('postScheduleDate');
		if (!$postScheduleDate || time() < $postScheduleDate || !$schedConf->getSetting('postSchedule')) Request::redirect(null, null, 'schedConf');
		$templateMgr =& TemplateManager::getManager();
		$templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
			array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		SchedConfHandler::setupTemplate($conference, $schedConf);

		$buildingDao =& DAORegistry::getDAO('BuildingDAO');
		$roomDao =& DAORegistry::getDAO('RoomDAO');

		$buildingsAndRooms = $allRooms = array();
		$buildings =& $buildingDao->getBuildingsBySchedConfId($schedConf->getId());
		while ($building =& $buildings->next()) {
			$buildingId = $building->getId();
			$rooms =& $roomDao->getRoomsByBuildingId($buildingId);
			$buildingsAndRooms[$buildingId] = array(
				'building' => &$building
			);
			while ($room =& $rooms->next()) {
				$roomId = $room->getId();
				$buildingsAndRooms[$buildingId]['rooms'][$roomId] =& $room;
				$allRooms[$roomId] =& $room;
				unset($room);
			}
			unset($building);
			unset($rooms);
		}
		$templateMgr->assign_by_ref('buildingsAndRooms', $buildingsAndRooms);
		$templateMgr->assign_by_ref('allRooms', $allRooms);

		// Merge special events and papers into an array by time/date
		$itemsByTime = array();

		$publishedPaperDao =& DAORegistry::getDAO('PublishedPaperDAO');
		$publishedPapers =& $publishedPaperDao->getPublishedPapers($schedConf->getId(), PAPER_SORT_ORDER_TIME);
		while ($paper =& $publishedPapers->next()) {
			if ($paper->getStartTime()) {
				$startTime = strtotime($paper->getStartTime());
				$itemsByTime[$startTime][] =& $paper;
			}
			unset($paper);
		}
		unset($publishedPapers);

		$specialEventDao =& DAORegistry::getDAO('SpecialEventDAO');
		$specialEvents =& $specialEventDao->getSpecialEventsBySchedConfId($schedConf->getId());
		while ($specialEvent =& $specialEvents->next()) {
			$startTime = strtotime($specialEvent->getStartTime());
			if ($startTime) $itemsByTime[$startTime][] =& $specialEvent;
			unset($specialEvent);
		}
		unset($specialEvents);

		// WARNING: $itemsByTime contains both PublishedPapers and
		// SpecialEvents; both implement getStartTime() and
		// getEndTime.
		ksort($itemsByTime);
		foreach ($itemsByTime as $startTime => $junk) {
			uasort($itemsByTime[$startTime], create_function('$a, $b', 'return strtotime($a->getEndTime()) - strtotime($b->getEndTime());'));
		}

		// Read in schedule layout settings
		if ($schedConf->getSetting('mergeSchedules')) {
			ksort($itemsByTime);
		}
		$templateMgr->assign('showEndTime', $schedConf->getSetting('showEndTime'));
		$templateMgr->assign('showAuthors', $schedConf->getSetting('showAuthors'));
		$templateMgr->assign('hideNav', $schedConf->getSetting('hideNav'));
		$templateMgr->assign('hideLocations', $schedConf->getSetting('hideLocations'));

		$templateMgr->assign_by_ref('itemsByTime', $itemsByTime);
		$templateMgr->assign('conference.currentConferences.scheduler');

		if($schedConf->getSetting('layoutType') == SCHEDULE_LAYOUT_COMPACT) {
			$templateMgr->display('schedConf/schedules/compact.tpl');
		} else if($schedConf->getSetting('layoutType') == SCHEDULE_LAYOUT_EXPANDED || !$schedConf->getSetting('layoutType')) {
			$templateMgr->display('schedConf/schedules/expanded.tpl');
		}
	}

	/**
	 * Display conference accommodation page
	 */
	function accommodation() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, null, 'index'), AppLocale::Translate('navigation.home'), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

		$templateMgr->assign('accommodationDescription', $schedConf->getLocalizedSetting('accommodationDescription'));
		$templateMgr->assign('accommodationFiles', $schedConf->getLocalizedSetting('accommodationFiles'));

		$templateMgr->assign('helpTopicId', 'conference.currentConferences.accommodation');
		$templateMgr->display('schedConf/accommodation.tpl');
	}
        
        /**
	 * Display conference accommodation page
	 */
	function location() {
		$this->addCheck(new HandlerValidatorSchedConf($this));
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		$templateMgr =& TemplateManager::getManager();
		//$templateMgr->assign('pageHierarchy', array(
		//	array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
		//	array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
                $templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, null, 'index'), AppLocale::Translate('navigation.home'), true)));
		SchedConfHandler::setupTemplate($conference,$schedConf);

		$templateMgr->assign('locationDescription', $schedConf->getLocalizedSetting('locationDescription'));

		$templateMgr->assign('helpTopicId', 'conference.currentConferences.location');
		$templateMgr->display('schedConf/location.tpl');
	}

	/**
	 * Display the presentations
	 */
	function presentations() {
		$this->validate();

		$conference =& Request::getConference();
		$schedConf =& Request::getSchedConf();

		import('schedConf.SchedConfAction');

		$mayViewProceedings = SchedConfAction::mayViewProceedings($schedConf);
		$mayViewPapers = SchedConfAction::mayViewPapers($schedConf, $conference);

		$templateMgr =& TemplateManager::getManager();
		SchedConfHandler::setupTemplate($conference, $schedConf);
		AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_DIRECTOR)); // FIXME: director.allTracks

		$templateMgr->assign('pageHierarchy', array(
			array(Request::url(null, 'index', 'index'), $conference->getConferenceTitle(), true),
			array(Request::url(null, null, 'index'), $schedConf->getSchedConfTitle(), true)));
		$templateMgr->assign('helpTopicId', 'editorial.trackDirectorsRole.presentations');
		$templateMgr->assign_by_ref('schedConf', $schedConf);

		$templateMgr->assign('mayViewProceedings', $mayViewProceedings);
		$templateMgr->assign('mayViewPapers', $mayViewPapers);

		if($mayViewProceedings) {
			$publishedPaperDao =& DAORegistry::getDAO('PublishedPaperDAO');
			$trackDao =& DAORegistry::getDAO('TrackDAO');

			$tracks =& $trackDao->getTrackTitles($schedConf->getId());

			// Get the user's search conditions, if any
			$searchField = Request::getUserVar('searchField');
			$searchMatch = Request::getUserVar('searchMatch');
			$search = Request::getUserVar('search');

			$searchInitial = Request::getUserVar('searchInitial');
			if (!empty($searchInitial)) {
				$searchField = SUBMISSION_FIELD_AUTHOR;
				$searchMatch = 'initial';
				$search = $searchInitial;
			}

			$templateMgr->assign('fieldOptions', Array(
				SUBMISSION_FIELD_TITLE => 'paper.title',
				SUBMISSION_FIELD_AUTHOR => 'user.role.author'
			));

			$previewAbstracts = (
				$schedConf->getSetting('reviewMode') == REVIEW_MODE_BOTH_SEQUENTIAL &&
				$schedConf->getSetting('previewAbstracts')
			);

			$publishedPapers =& $publishedPaperDao->getPublishedPapersInTracks($schedConf->getId(), Request::getUserVar('track'), $searchField, $searchMatch, $search, $previewAbstracts);

			// Set search parameters
			$duplicateParameters = array(
				'searchField', 'searchMatch', 'search', 'searchInitial', 'track'
			);
			foreach ($duplicateParameters as $param)
				$templateMgr->assign($param, Request::getUserVar($param));

			$templateMgr->assign('alphaList', explode(' ', __('common.alphaList')));
			$templateMgr->assign('trackOptions', array(0 => AppLocale::Translate('director.allTracks')) + $tracks);
			$templateMgr->assign_by_ref('publishedPapers', $publishedPapers);
		}

		$templateMgr->display('schedConf/papers.tpl');
	}

	/**
	 * Given a scheduled conference, set up the template with all the
	 * required variables for schedConf/view.tpl to function properly.
	 * @param $schedConf object The scheduled conference to display
	 * 	the cover page will be displayed. Otherwise table of contents
	 * 	will be displayed.
	 */
	function setupTemplate(&$conference, &$schedConf) {
		parent::setupTemplate();
		$templateMgr =& TemplateManager::getManager();
		AppLocale::requireComponents(array(LOCALE_COMPONENT_OCS_MANAGER));

		// Ensure the user is entitled to view the scheduled conference...
		if (isset($schedConf) && ($conference->getEnabled() || (
				Validation::isDirector($conference->getId()) ||
				Validation::isConferenceManager($conference->getId())))) {
			// Assign header and content for home page
			$templateMgr->assign('displayPageHeaderTitle', $conference->getPageHeaderTitle(true));
			$templateMgr->assign('displayPageHeaderLogo', $conference->getPageHeaderLogo(true));
			$templateMgr->assign('displayPageHeaderTitleAltText', $conference->getLocalizedSetting('homeHeaderTitleImageAltText'));
			$templateMgr->assign('displayPageHeaderLogoAltText', $conference->getLocalizedSetting('homeHeaderLogoImageAltText'));
			$templateMgr->assign_by_ref('schedConf', $schedConf);
			$templateMgr->assign('additionalHomeContent', $conference->getLocalizedSetting('additionalHomeContent'));
		} else {
			Request::redirect(null, 'index');
		}

		if ($styleFileName = $schedConf->getStyleFileName()) {
			import('file.PublicFileManager');
			$publicFileManager = new PublicFileManager();
			$templateMgr->addStyleSheet(
				Request::getBaseUrl() . '/' . $publicFileManager->getConferenceFilesPath($conference->getId()) . '/' . $styleFileName
			);
		}
                $this->checkRole($conference, $schedConf);
                
                $templateMgr->assign("conferenceUrl", Request::url(null, 'index'));
                $templateMgr->assign("conferenceId", $conference->getId());
                $templateMgr->assign("schedConfId", $schedConf->getId());
                $templateMgr->assign("schedConfUrl", Request::url(null, $conference->getSetting('path')));
                $templateMgr->assign("conferencePath", $conference->getSetting('path'));
	}
        
        function checkRole(&$conference, &$schedConf) {
                $templateMgr =& TemplateManager::getManager();
                $templateMgr->assign('isConferenceManager', Validation::isConferenceManager($conference->getId()));
                $templateMgr->assign('isDirector', Validation::isDirector($conference->getId(), $schedConf->getId()));
                $templateMgr->assign('isTrackDirector', Validation::isTrackDirector($conference->getId(), $schedConf->getId()));
                $templateMgr->assign('isAuthor', Validation::isAuthor($conference->getId(), $schedConf->getId()));
        }

	function validate() {
		parent::validate();

		$schedConf =& Request::getSchedConf();
		if(!SchedConfAction::mayViewSchedConf($schedConf)) {
			Request::redirect(null, 'index');
		}

		return true;
	}
}

?>
