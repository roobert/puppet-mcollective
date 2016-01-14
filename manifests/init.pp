class mcollective (
  $server   = false,
  $host     = 'mcollective',
  $port     = 5671,
  $username = undef,
  $password = undef,
) {
  class { 'mcollective::config':
    server   => $server,
    host     => $host,
    port     => $port,
    username => $username,
    password => $password,
  } ->
  class { 'mcollective::service': }
}
