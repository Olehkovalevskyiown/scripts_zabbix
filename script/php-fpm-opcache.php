<?php
if ($_SERVER['SERVER_ADDR'] != $_SERVER['REMOTE_ADDR']){
    header('HTTP/1.1 401 Unauthorized', true, 401);
    exit;
}
  $status = opcache_get_status(false);
  echo json_encode($status);
  echo "\n";
?>
