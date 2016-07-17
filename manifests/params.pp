# == Class: kibana
#
# Default parameters
#

class kibana::params {
  $version                       = '4.1.10-linux-x64'
  $download_path                 = 'http://download.elastic.co/kibana/kibana'
  $install_root                  = '/opt'
  $babel_dir                     = '/tmp/kibana'
  $config_dir                    = '/etc/kibana'
  $log_dir                       = '/var/log/kibana'
  $pid_dir                       = '/var/run/kibana'
  $service_ensure                = true
  $service_enabled               = true
  $bind_port                     = 5601
  $bind_host                     = '127.0.0.1'
  $elasticsearch_url             = 'http://localhost:9200'
  $elasticsearch_preserve_host   = true
  $kibana_index                  = '.kibana'
  $kibana_elasticsearch_username = ''
  $kibana_elasticsearch_password = ''
  $default_app_id                = 'discover'
  $request_timeout               = 300000
  $shard_timeout                 = 0
}
