class mcollective (
  $server   = false,
  $host     = 'mcollective',
  $port     = 61613,
  $username = 'mcollective',
  $password = undef,
) {
  class { 'mcollective::config':
    host     => $host,
    port     => $port,
    username => $username,
    password => $password,
  } ->
  class { 'mcollective::service': }
}
