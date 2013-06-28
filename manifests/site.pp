node 'ci.gitorious.org' {
  # Dependencies for Jenkins
  class {'java':}
  class {'git':}
  class {'nginx':}
  class {'cacert': }
  class {'iptables::webserver': }
  class {'stdlib':}

  # Main Gitorious.org Jenkins module
  class {'gitorious_jenkins':}

  # This host will also serve as a builder (slave).
  class {'gitorious_jenkins::builder':}
  gitorious_jenkins::slave {'gitorious':
    ssh_key => 'AAAAB3NzaC1yc2EAAAABIwAAAQEAwc1/yqhRkCwMqmlYjKw/3WJt0DIFfyCHoVlP/vnC7O8zLnhqKSOrr4mQy0T0vFQi2zvbOEPu8nIWuHYKpGL/lQWjGE1A+GnqcOxxyQRf6P7edFp9zDgD2yIr7IAhyLljgUr2oBvPBx5AQCyjEbv3/iyUA76vJyCC2IQ9m2JFP6fZTrBH2SQNkRCsNWVPEh2Ll+Ze6zPrLlxjalILQ4hv5m2AJazmOeHMwyosXLahMwyFoYOpTK5zBWs5FrK8hBNbXndeYP4B6UpnfB0Q9R1H3bLv8yks+wLQjsnFGE4YMcIqFupqtZ//uQBKWhpUcrq+XqKIsq5PlnqfLwqNk00nOw==',
  }
}
