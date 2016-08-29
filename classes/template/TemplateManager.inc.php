<?php

/**
 * @file TemplateManager.inc.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class TemplateManager
 * @ingroup template
 *
 * @brief Class for accessing the underlying template engine.
 * Currently integrated with Smarty (from http://smarty.php.net/).
 *
 */

// $Id$


import('search.PaperSearch');
import('file.PublicFileManager');
import('template.PKPTemplateManager');

class TemplateManager extends PKPTemplateManager {
    /**
     * Constructor.
     * Initialize template engine and assign basic template variables.
     */
    function TemplateManager() {
        parent::PKPTemplateManager();

        if (!defined('SESSION_DISABLE_INIT')) {
            /**
             * Kludge to make sure no code that tries to connect to
             * the database is executed (e.g., when loading
             * installer pages).
             */

            $conference =& Request::getConference();
            $schedConf =& Request::getSchedConf();
            $site =& Request::getSite();
            if (isset($schedConf)) {
                $this->assign('schedConfAcronym', $schedConf->getLocalizedSetting('acronym'));
            }

            $this->assign('siteTitle', $site->getLocalizedTitle());

            $siteFilesDir = Request::getBaseUrl() . '/' . PublicFileManager::getSiteFilesPath();
            $this->assign('sitePublicFilesDir', $siteFilesDir);

            $this->assign('homeContext', array('conference' => 'index', 'schedConf' => 'index'));

            $siteStyleFilename = PublicFileManager::getSiteFilesPath() . '/' . $site->getSiteStyleFilename();
            if (file_exists($siteStyleFilename)) $this->addStyleSheet(Request::getBaseUrl() . '/' . $siteStyleFilename);

            if (isset($conference)) {
                $schedConfDao =& DAORegistry::getDAO('SchedConfDAO');
                $archivedSchedConfsExist = $schedConfDao->archivedSchedConfsExist($conference->getId());
                $currentSchedConfsExist = $schedConfDao->currentSchedConfsExist($conference->getId());
                $this->assign('archivedSchedConfsExist', $archivedSchedConfsExist);
                $this->assign('currentSchedConfsExist', $currentSchedConfsExist);

                $this->assign_by_ref('currentConference', $conference);
                $conferenceTitle = $conference->getConferenceTitle();

                $this->assign('numPageLinks', $conference->getSetting('numPageLinks'));
                $this->assign('itemsPerPage', $conference->getSetting('itemsPerPage'));

                // Load and apply theme plugin, if chosen
                $themePluginPath = $conference->getSetting('conferenceTheme');

                if (!empty($themePluginPath)) {
                        // Load and activate the theme
                        $themePlugin =& PluginRegistry::loadPlugin('themes', $themePluginPath);
                        if ($themePlugin) $themePlugin->activate($this);
                }

                // Assign additional navigation bar items
                $navMenuItems =& $conference->getLocalizedSetting('navItems');
                $this->assign_by_ref('navMenuItems', $navMenuItems);

                $this->assign('publicFilesDir', Request::getBaseUrl() . '/' . PublicFileManager::getConferenceFilesPath($conference->getId()));
                $this->assign('displayPageHeaderTitle', $conference->getPageHeaderTitle());
                $this->assign('displayPageHeaderSubTitle', $conference->getLocalizedSetting('homeHeaderSubTitle'));
                $this->assign('displayPageHeaderLogo', $conference->getPageHeaderLogo());
                $this->assign('displayPageHeaderTitleAltText', $conference->getLocalizedSetting('pageHeaderTitleImageAltText'));
                $this->assign('displayPageHeaderLogoAltText', $conference->getLocalizedSetting('pageHeaderLogoImageAltText'));
                $this->assign('displayFavicon', $conference->getLocalizedFavicon());
                $this->assign('faviconDir', Request::getBaseUrl() . '/' . PublicFileManager::getConferenceFilesPath($conference->getId()));
                $this->assign('alternatePageHeader', $conference->getLocalizedSetting('conferencePageHeader'));
                $this->assign('metaSearchDescription', $conference->getLocalizedSetting('searchDescription'));
                $this->assign('metaSearchKeywords', $conference->getLocalizedSetting('searchKeywords'));
                $this->assign('metaCustomHeaders', $conference->getLocalizedSetting('customHeaders'));
                $this->assign('enableAnnouncements', $conference->getSetting('enableAnnouncements'));

                $this->assign('pageFooter', $conference->getLocalizedSetting('conferencePageFooter'));
                $this->assign('displayCreativeCommons', $conference->getSetting('postCreativeCommons'));
                $this->assign('analyticsTrackingID', $conference->getSetting('analyticsTrackingID'));

                $this->assign('currentConferenceHome', Request::url(null, $conference->getSetting("path"), 'index'));

                if (isset($schedConf)) {
                    $navMenuItemOrder = array();


                    // This will be needed if inheriting public conference files from the scheduled conference.
                    $this->assign('publicSchedConfFilesDir', Request::getBaseUrl() . '/' . PublicFileManager::getSchedConfFilesPath($schedConf->getId()));
                    $this->assign('primaryLocale', $conference->getSetting('primaryLocale'));
                    $this->assign('alternateLocales', $conference->getPrimaryLocale());

                    $this->assign_by_ref('currentSchedConf', $schedConf);

                    // Assign common sched conf vars:
                    $currentTime = time();
                    $submissionsCloseDate = $schedConf->getSetting('submissionsCloseDate');
                    $this->assign('submissionsCloseDate', $submissionsCloseDate);

                    $this->assign('schedConfPostOverview', $schedConf->getSetting('postOverview'));
                    $this->assign('schedConfPostOverviewOrder', $schedConf->getSetting('postOverviewOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Overview');
                    
                    $this->assign('schedConfPostAnnouncement', $schedConf->getSetting('postAnnouncement'));
                    $this->assign('schedConfPostAnnouncementOrder', $schedConf->getSetting('postAnnouncementOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Announcement');
                    
                    
                    $this->assign('schedConfPostTimeline', $schedConf->getSetting('postTimeline'));
                    $this->assign('schedConfPostTimelineOrder', $schedConf->getSetting('postTimelineOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Timeline');
                    
                    // CFP displayed
                    $showCFPDate = $schedConf->getSetting('showCFPDate');
                    $postCFP = $schedConf->getSetting('postCFP');
                    if ($postCFP && $showCFPDate && $submissionsCloseDate && $currentTime > $showCFPDate && $currentTime < $submissionsCloseDate) {
                        $this->assign('schedConfShowCFP', true);
                        $this->assign('schedConfShowCFPOrder', $schedConf->getSetting('postCFPOrder'));
                        $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'CFP');
                    }
                    
                    $this->assign('schedConfPostPayment', $schedConf->getSetting('postPayment'));
                    $this->assign('schedConfPostPaymentOrder', $schedConf->getSetting('postPaymentOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Payment');
                    
                    
                    $this->assign('schedConfPostTrackPolicies', $schedConf->getSetting('postTrackPolicies'));
                    $this->assign('schedConfPostTrackPoliciesOrder', $schedConf->getSetting('postTrackPoliciesOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'TrackPolicies');

                    $this->assign('schedConfPostPresentations', $schedConf->getSetting('postPresentations'));
                    $this->assign('schedConfPostPresentationsOrder', $schedConf->getSetting('postPresentationsOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Presentations');

                    $this->assign('schedConfPostLocation', $schedConf->getSetting('postLocation'));
                    $this->assign('schedConfPostLocationOrder', $schedConf->getSetting('postLocationOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Location');
                    
                    $this->assign('schedConfPostAccommodation', $schedConf->getSetting('postAccommodation'));
                    $this->assign('schedConfPostAccommodationOrder', $schedConf->getSetting('postAccommodationOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Accommodation');


                    $this->assign('schedConfPostSupporters', $schedConf->getSetting('postSupporters'));
                    $this->assign('schedConfPostSupportersOrder', $schedConf->getSetting('postSupportersOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Supporters');

                    // Schedule displayed
                    $postScheduleDate = $schedConf->getSetting('postScheduleDate');
                    if ($postScheduleDate && $currentTime > $postScheduleDate && $schedConf->getSetting('postSchedule')) {
                        $this->assign('schedConfPostSchedule', true);
                    }

                    // Program
                    //if ($schedConf->getSetting('postProgram') && ($schedConf->getSetting('program') || $schedConf->getSetting('programFile'))) {
                        $this->assign('schedConfShowProgram', true);
                        $this->assign('schedConfShowProgramOrder', $schedConf->getSetting('postProgramOrder'));
                        $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Program');
                    //}

                    // Contact & Contact Email
                    if ($schedConf->getSetting('postContact') && ($schedConf->getSetting('postContact') || $schedConf->getSetting('postContact'))) {
                        $this->assign('schedConfShowContact', true);
                        $this->assign('schedConfShowContactOrder', $schedConf->getSetting('postContactOrder'));
                        $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'Contact');
                    }

                    if ($schedConf->getSetting('contactEmail') && ($schedConf->getSetting('contactEmail') || $schedConf->getSetting('contactEmail'))) {
                        $this->assign('schedConfContactEmail', $schedConf->getSetting('contactEmail'));
                    }

                    // Submissions open
                    $submissionsOpenDate = $schedConf->getSetting('submissionsOpenDate');
                    $postSubmission = $schedConf->getSetting('postProposalSubmission');
                    $this->assign('submissionsOpenDate', $submissionsOpenDate);
                    $this->assign('schedConfShowProposalSubmissionOrder', $schedConf->getSetting('postProposalSubmissionOrder'));
                    $this->_addNavMenuItemOrder($schedConf, $navMenuItemOrder, 'ProposalSubmission');

                    import('payment.ocs.OCSPaymentManager');
                    $paymentManager =& OCSPaymentManager::getManager();
                    $this->assign('schedConfPaymentsEnabled', $paymentManager->isConfigured());

                    // 再加入 $navMenuItems
                    foreach ($navMenuItems AS $navItemId => $navItem) {
                        $navItemOrder = 90;
                        if (isset($navItem["order"]) && trim($navItem["order"]) !== "") {
                            $navItemOrder = trim($navItem["order"]);
                        }
                        
                        if (is_array($navMenuItemOrder[$navItemOrder]) === FALSE) {
                            $navMenuItemOrder[$navItemOrder] = array();
                        }
                        $navMenuItemOrder[$navItemOrder][] = 'schedConfNavItem' . $navItemId;
                    }
                    
                    ksort($navMenuItemOrder);
                    $this->assign('schedConfNavMenuItemOrder', $navMenuItemOrder);
                    
                    //print_r($navMenuItemOrder);
                }   //if (isset($schedConf)) {

                // Assign conference stylesheet and footer
                $conferenceStyleSheet = $conference->getSetting('conferenceStyleSheet');
                if ($conferenceStyleSheet) {
                        $this->addStyleSheet(Request::getBaseUrl() .
                        '/' . PublicFileManager::getConferenceFilesPath($conference->getId()) .
                        '/' . $conferenceStyleSheet['uploadName']);
                }

                // Assign scheduled conference stylesheet and footer (after conference stylesheet!)
                if($schedConf) {
                    $schedConfStyleSheet = $schedConf->getSetting('schedConfStyleSheet');
                    if ($schedConfStyleSheet) {
                        $this->addStyleSheet(Request::getBaseUrl() .
                        '/' .	PublicFileManager::getSchedConfFilesPath($schedConf->getId()) .
                        '/' . $schedConfStyleSheet['uploadName']);
                    }
                }
            } else { // Not within conference context
                // Add the site-wide logo, if set for this locale or the primary locale
                $displayPageHeaderTitle = $site->getLocalizedPageHeaderTitle();
                $this->assign('displayPageHeaderTitle', $displayPageHeaderTitle);
                if (isset($displayPageHeaderTitle['altText'])) {
                    $this->assign('displayPageHeaderTitleAltText', $displayPageHeaderTitle['altText']);
                }
                $this->assign('publicFilesDir', Request::getBaseUrl() . '/' . PublicFileManager::getSiteFilesPath());
            }
        }
    }

    function _addNavMenuItemOrder($schedConf, & $navMenuItemOrder, $key, $defaultOrder = 0) {
        //echo 'post' . $key . $schedConf->getSetting('post' . $key) . '|';
        //echo 'port' . $key . '|';
        if ($schedConf->getSetting('post' . $key) === true) {
            $defaultOrder = 90;
            if (is_int($schedConf->getSetting('post'.$key. 'Order'))) {
                $defaultOrder = $schedConf->getSetting('post'.$key. 'Order');
            }
            if (is_array($navMenuItemOrder[$defaultOrder]) === FALSE) {
                $navMenuItemOrder[$defaultOrder] = array();
            }
            $navMenuItemOrder[$defaultOrder][] = 'schedConfPost' . $key;
        }
    }

    /**
     * Smarty usage: {get_help_id key="(dir)*.page.topic" url="boolean"}
     *
     * Custom Smarty function for retrieving help topic ids.
     * Direct mapping of page topic key to a numerical value representing the associated help topic xml file
     * @params $params array associative array, must contain "key" parameter for string to translate
     * @params $smarty Smarty
     * @return numerical help topic id
     */
    function smartyGetHelpId($params, &$smarty) {
            import('help.Help');
            $help =& Help::getHelp();
            if (isset($params) && !empty($params)) {
                    if (isset($params['key'])) {
                            $key = $params['key'];
                            unset($params['key']);
                            $translatedKey = $help->translate($key);
                    } else {
                            $translatedKey = $help->translate('');
                    }

                    if ($params['url'] == "true") {
                            return Request::url(null, null, 'help', 'view', explode('/', $translatedKey));
                    } else {
                            return $translatedKey;
                    }
            }
    }

    /**
     * Smarty usage: {help_topic key="(dir)*.page.topic" text="foo"}
     *
     * Custom Smarty function for creating anchor tags
     * @params $params array associative array
     * @params $smarty Smarty
     * @return anchor link to related help topic
     */
    function smartyHelpTopic($params, &$smarty) {
            import('help.Help');
            $help =& Help::getHelp();
            if (isset($params) && !empty($params)) {
                    $translatedKey = isset($params['key']) ? $help->translate($params['key']) : $help->translate('');
                    $link = Request::url(null, null, 'help', 'view', explode('/', $translatedKey));
                    $text = isset($params['text']) ? $params['text'] : '';
                    return "<a href=\"$link\">$text</a>";
            }
    }

    /**
     * Display page links for a listing of items that has been
     * divided onto multiple pages.
     * Usage:
     * {page_links
     * 	name="nameMustMatchGetRangeInfoCall"
     * 	iterator=$myIterator
     *	additional_param=myAdditionalParameterValue
     * }
     */
    function smartyPageLinks($params, &$smarty) {
            $iterator = $params['iterator'];
            $name = $params['name'];
            if (isset($params['anchor'])) {
                    $anchor = $params['anchor'];
                    unset($params['anchor']);
            } else {
                    $anchor = null;
            }

            // 禁止使用anchor
            $anchor = null;

            if (isset($params['all_extra'])) {
                    $allExtra = ' ' . $params['all_extra'];
                    unset($params['all_extra']);
            } else {
                    $allExtra = '';
            }

            unset($params['iterator']);
            unset($params['name']);

            $numPageLinks = $smarty->get_template_vars('numPageLinks');
            if (!is_numeric($numPageLinks)) $numPageLinks=10;

            $page = $iterator->getPage();
            $pageCount = $iterator->getPageCount();
            $itemTotal = $iterator->getCount();

            $pageBase = max($page - floor($numPageLinks / 2), 1);
            $paramName = $name . 'Page';

            if ($pageCount<=1) {
                return '';
            }

            $value = '';

            if ($page>1) {
                    $params[$paramName] = 1;
                    $value .= '<li><a href="' . Request::url(null, null, null, null, Request::getRequestedArgs(), $params, $anchor, true) . '"' . $allExtra . '>&lt;&lt;</a></li>';
                    $params[$paramName] = $page - 1;
                    $value .= '<li><a href="' . Request::url(null, null, null, null, Request::getRequestedArgs(), $params, $anchor, true) . '"' . $allExtra . '>&lt;</a></li>';
            }

            for ($i=$pageBase; $i<min($pageBase+$numPageLinks, $pageCount+1); $i++) {
                    if ($i == $page) {
                            $value .= '<li class="active"><a href="#">'. $i . "</a></li>";
                    } else {
                            $params[$paramName] = $i;
                            $value .= '<li><a href="' . Request::url(null, null, null, null, Request::getRequestedArgs(), $params, $anchor, true) . '"' . $allExtra . '>' . $i . '</a></li>';
                    }
            }
            if ($page < $pageCount) {
                    $params[$paramName] = $page + 1;
                    $value .= '<li><a href="' . Request::url(null, null, null, null, Request::getRequestedArgs(), $params, $anchor, true) . '"' . $allExtra . '>&gt;</a></li>';
                    $params[$paramName] = $pageCount;
                    $value .= '<li><a href="' . Request::url(null, null, null, null, Request::getRequestedArgs(), $params, $anchor, true) . '"' . $allExtra . '>&gt;&gt;</a></li>';
            }
            $value = '<nav><ul class="pagination">' . $value . "</ul></nav>";
            return $value;
    }
}

?>
