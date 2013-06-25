# Gitorious.org config for Jenkins

class gitorious_jenkins {
  # Depend on the Jenkins module, from GitHub.
  # (and add our java dependency here, too.)
  class {'jenkins':
    require     => [
      Class['java'],
    ],
    config_hash => {
      'JENKINS_PORT'     => { 'value' => '8080' },
      'JENKINS_AJP_PORT' => { 'value' => '-1' },
      'JENKINS_ARGS'     => { 'value' =>
        '--prefix=/jenkins --httpListenAddress=127.0.0.1' },
    },
  }

  # Install Jenkins plugins.
  jenkins::plugin {
    'git' : ;
    'git-client' : ;
  }
}
