class mcollective::service {
  include puppet_agent

  service { 'mcollective':
    ensure  => running,
    enabled => true,
    require => Package['puppet-agent'],
  }
}
