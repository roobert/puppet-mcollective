class mcollective::service {
  include puppet_agent

  service { 'mcollective':
    ensure  => running,
    enable  => true,
    require => Package['puppet-agent'],
  }
}
