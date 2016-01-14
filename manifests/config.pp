class mcollective::config {
  if $mcollective::server == true {
    file { '/etc/puppetlabs/mcollective/server.cfg':
      content => template('mcollective/server.cfg.erb'),
      mode    => '0600',
      owner   => 'root',
      group   => 'root',
      notify  => Service['mcollective'],
    }
  }

  file { '/etc/puppetlabs/mcollective/client.cfg':
    content => template('mcollective/client.cfg.erb'),
    mode    => '0600',
    owner   => 'root',
    group   => 'root',
    notify  => Service['mcollective'],
  }
}
