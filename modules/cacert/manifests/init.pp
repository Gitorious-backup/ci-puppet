# Install CACert.org CA.

class cacert {

  # From https://www.cacert.org/certs/root.crt
  file { '/etc/pki/tls/certs/cacert-class1.crt':
    ensure => present,
    source => 'puppet:///modules/cacert/root.crt',
    owner  => 'root',
    group  => 'root',
  }
  # Obtain this symlink hash value by running:
  # openssl x509 -in cacert-class1.crt -noout -hash
  file { '/etc/pki/tls/certs/99d0fa06.0':
    ensure => link,
    target => 'cacert-class1.crt',
  }

  # From https://www.cacert.org/certs/class3.crt
  file { '/etc/pki/tls/certs/cacert-class3.crt':
    ensure => present,
    source => 'puppet:///modules/cacert/class3.crt',
    owner  => 'root',
    group  => 'root',
  }
  # Obtain this symlink hash value by running:
  # openssl x509 -in cacert-class3.crt -noout -hash
  file { '/etc/pki/tls/certs/590d426f.0':
    ensure => link,
    target => 'cacert-class3.crt',
  }
}
