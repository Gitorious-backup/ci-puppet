# Parameters:
# config_hash = {} (Default)
# Hash with config options to set in sysconfig/jenkins defaults/jenkins
#
# Example use
#
# class{ 'jenkins::config':
#   config_hash => {
#     'PORT' => { 'value' => '9090' }, 'AJP_PORT' => { 'value' => '9009' }
#   }
# }
#
class jenkins::config( $config_hash = {} ) {
  Class['Jenkins::Package']->Class['Jenkins::Config']
  create_resources( 'jenkins::sysconfig', $config_hash )
}

