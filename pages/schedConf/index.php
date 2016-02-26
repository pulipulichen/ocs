<?php

/**
 * @defgroup pages_schedConf
 */
 
/**
 * @file pages/schedConf/index.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @brief Handle requests for scheduled conference functions.
 *
 * @ingroup pages_schedConf
 */

//$Id$


switch ($op) {
	case 'index':
	case 'trackPolicies':
	case 'overview':
	case 'timeline':
	case 'cfp':
	case 'registration':
        case 'deleteRegistration':
        case 'updateRegistration':
	case 'register':
	case 'program':
        case 'page':
        case 'survey':
        case 'surveyExport':
	case 'schedule':
	case 'accommodation':
        case 'location':
	case 'presentations':
		define('HANDLER_CLASS', 'SchedConfHandler');
		import('pages.schedConf.SchedConfHandler');
		break;
}

?>
