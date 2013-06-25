# Gitorious.org config for a Jenkins builder

class gitorious_jenkins::builder {

  # Homedir parent location for slave account(s)
  file { '/var/local/jenkins':
    ensure => directory,
    group  => 'root',
    owner  => 'root',
    mode   => '0755',
  }

  # The Gitorious test suite requires MySQL.
  # We can install and enable MySQL, but there are still manual steps required.
  # 1. Run mysql_secure_installation
  # 2. Run mysql -p
  # 3. mysql> CREATE DATABASE gitorious_test;
  # 4. mysql> CREATE USER 'gitorious'@'localhost' IDENTIFIED BY 'gitorious';
  # 5. mysql> GRANT ALL ON gitorious_test.* TO 'gitorious'@'localhost';
  package { 'mysql-server':
    ensure => installed,
  }
  service { 'mysqld':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Package['mysql-server'],
  }

  # Other dependencies (for bundler's gem installations)
  package { [
    'gcc',
    'gcc-c++',
    'ImageMagick-devel',
    'libxml2-devel',
    'libxslt-devel',
    'make',
    'mysql-devel',
    'ruby-devel',
    'sphinx',
  ]:
    ensure => installed,
  }

}
