class mcollective (
  $server   = false,
  $host     = 'mcollective',
  $port     = 61613,
  $username = undef,
  $password = undef,
) {
  class { 'mcollective::config':  } ->
  class { 'mcollective::service': }
}
