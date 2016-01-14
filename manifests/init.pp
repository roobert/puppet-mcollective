class mcollective (
  $server   = false,
  $host     = 'mcollective',
  $port     = 5671,
  $username = undef,
  $password = undef,
) {
  class { 'mcollective::config':  } ->
  class { 'mcollective::service': }
}
