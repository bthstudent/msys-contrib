<?php
/**
 * searchLDAP
 *
 * Searches a specifed LDAP host for specified key
 *
 * @param string $ldaphost The LDAP host to use
 * @param string $binddn Bind DN
 * @param string $bindpw Bind PW
 * @param string $searchbase Search base
 * @param string $searchfilter The searchfilter, upto, and not including '='
 * @param string $searchterm The value to search for, e.g. PNR
 *
 * @return boolean True if match is found, else false
 *
 **/
function searchLDAP($ldaphost, $binddn, $bindpw, $searcbase, $searchfilter, $searchterm) {

    $ds=ldap_connect($ldaphost);

    if ($ds) {
        $r=ldap_bind($ds, $binddn, $bindpw);
        $sr=ldap_search($ds, $searcbase, $searchfilter . "=" . $searchterm);
        if ($sr) {
            $result = ldap_count_entries($ds, $sr);
            ldap_close($ds);

            if ($result == 1) {
                return true;
            }
        } else {
            error_log(ldap_error($ds));
        }
    }

    return false;
}
