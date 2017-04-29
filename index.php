<?php
/**
 * Created by PhpStorm.
 * User: xolseg
 * Date: 4/27/17
 * Time: 2:31 AM
 */
include ('config.php');
error_reporting(E_ALL);
ini_set('display_errors', 'On');
ini_set('html_errors', 'On');

$link = mysqli_connect($host, $user, $password);
mysqli_select_db($link, $db) OR DIE("Not found connection");
$result = mysqli_query($link, "SELECT name,url FROM nodes");
    echo '<table border="1" cols="5" width="800">';
    echo '<tr><td align=\'center\' width=\'30\'>Node</td><td align=\'center\' width=\'20\'>VM</td><td align=\'center\' width=\'20\'>Status</td><td align=\'center\' width=\'20\'>Actions</td></tr>';

while ($row = mysqli_fetch_array($result)) {
    $node=$row['url'];
    $uri = "qemu+ssh://root@$node/system";
    $credentials = Array(VIR_CRED_AUTHNAME => "$usernode", VIR_CRED_PASSPHRASE => "$passnode");
    $conn = libvirt_connect($uri, false, $credentials);
    $domains = libvirt_list_domain_resources($conn); //get info vm
    foreach ($domains as $item) {
        #status online or offline
        $status = libvirt_domain_is_active($item);
        if($status!=0){
            $status = '<span class="online" style="color:green;">Online</span>';
        }else{
            $status = '<span class="offline" style="color:red;">Offline</span>';
        }

        #hostname
        print "<tr><td>".libvirt_connect_get_hostname($conn)."</td>";
        #vmname
        print "<td>".libvirt_domain_get_name($item)."</td>";
        #status vm
        print "<td>".$status."</td>";
      }
}
echo "</table>";
