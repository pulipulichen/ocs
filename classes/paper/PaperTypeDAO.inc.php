<?php

/**
 * @file PaperTypeDAO.inc.php
 *
 * Copyright (c) 2000-2012 John Willinsky
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * @class PaperTypeDAO
 * @ingroup paper
 * @see PaperType, ControlledVocabDAO
 *
 * @brief Operations for retrieving and modifying PaperType objects
 */

//$Id$


import('controlledVocab.ControlledVocabDAO');

define('PAPER_TYPE_SYMBOLIC', 'paperType');

class PaperTypeDAO extends ControlledVocabDAO {
	function build($schedConfId) {
		return parent::build(PAPER_TYPE_SYMBOLIC, ASSOC_TYPE_SCHED_CONF, $schedConfId);
	}

	function getPaperTypes($schedConfId) {
		$paperTypes = $this->build($schedConfId);
		$paperTypeEntryDao =& DAORegistry::getDAO('PaperTypeEntryDAO');
		return $paperTypeEntryDao->getByControlledVocabId($paperTypes->getId());
	}
        
        function getPaperType($typeId) {
            //$types = $this->getPaperTypes($schedConfId);
            //$controlledVocabDao =& DAORegistry::getDAO('ControlledVocabDAO');
            $schedConf =& Request::getSchedConf();
            
            $paperTypeEntryIterator = $this->getPaperTypes($schedConf->getId());
            while ($paperTypeEntry =& $paperTypeEntryIterator->next()) {
                    //if (!in_array($paperTypeEntry->getId(), $paperTypeIds)) {
                    //        $paperTypeEntryDao->deleteObject($paperTypeEntry);
                    //}
                    //unset($paperTypeEntry);
                if ($paperTypeEntry->getId() == $typeId) {
                    return $paperTypeEntry;
                }
            }
            //$sessionTypes = $controlledVocabDao->enumerateBySymbolic('paperType', ASSOC_TYPE_SCHED_CONF, $schedConf->getId());
            //print_r($sessionTypes);
            
        }
}

?>
