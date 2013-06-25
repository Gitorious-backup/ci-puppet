# Gitorious Nginx web server config for Jenkins

class nginx {
  package { 'nginx':
    ensure => installed,
  }

  service { 'nginx':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['nginx'],
  }

  # Vhost configuration
  file { '/etc/nginx/conf.d':
    ensure  => directory,
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/nginx/conf.d',
    recurse => true,
    require => Package['nginx'],
    notify  => Service['nginx'],
  }

  # SSL (HTTPS) cert
  file { 'gitoriousci.ktdreyer.com-chained.crt':
    ensure  => file,
    path    => '/etc/pki/tls/certs/gitoriousci.ktdreyer.com-chained.crt',
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/nginx/gitoriousci.ktdreyer.com-chained.crt',
    notify  => Service['nginx'],
  }
}
