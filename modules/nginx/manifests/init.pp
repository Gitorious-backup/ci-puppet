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

  # Docroot location
  file { '/var/local/www':
    ensure  => directory,
    group   => 'root',
    owner   => 'root',
    source  => 'puppet:///modules/nginx/www',
    recurse => true,
    require => Service['nginx'],
  }

  # SSL (HTTPS) cert
  file { 'ci.gitorious.org.crt':
    ensure  => file,
    path    => '/etc/pki/tls/certs/ci.gitorious.org.crt',
    group   => 'root',
    owner   => 'root',
    mode    => '0644',
    source  => 'puppet:///modules/nginx/ci.gitorious.org.crt',
    notify  => Service['nginx'],
  }

  # Remove old SSL cert
  file { 'gitoriousci.ktdreyer.com-chained.crt':
    ensure  => absent,
    path    => '/etc/pki/tls/certs/gitoriousci.ktdreyer.com-chained.crt',
    notify  => Service['nginx'],
  }
}
