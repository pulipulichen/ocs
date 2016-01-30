<?php

class SubmissionHelper {
    static function getUniqueEditAssignments($editAssignments) {
        $output = array();
        $directors = array();
        foreach ($editAssignments AS $editAssignment) {
            $directorId = $editAssignment->getDirectorId();
            if (in_array($directorId, $directors) === FALSE) {
                $directors[] = $directorId;
                $output[] = $editAssignment;
            }
        }
        return $output;
    }
}