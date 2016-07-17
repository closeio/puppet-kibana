# == Class: kibana
#
# This class downloads and installs Kibana
# (We don't install via package because Kibana devs don't maintain them :-P)
#

class kibana (
  $version                       = $kibana::params::version,
  $download_path                 = $kibana::params::download_path,
  $install_root                  = $kibana::params::install_root,
  $babel_dir                     = $kibana::params::babel_dir,
  $config_dir                    = $kibana::params::config_dir,
  $log_dir                       = $kibana::params::log_dir,
  $pid_dir                       = $kibana::params::pid_dir,
  $service_ensure                = $kibana::params::service_ensure,
  $service_enabled               = $kibana::params::service_enabled,
  $bind_host                     = $kibana::params::bind_host,
  $bind_port                     = $kibana::params::bind_port,
  $elasticsearch_url             = $kibana::params::elasticsearch_url,
  $elasticsearch_preserve_host   = $kibana::params::elasticsearch_preserve_host,
  $kibana_index                  = $kibana::params::kibana_index,
  $kibana_elasticsearch_username = $kibana::params::kibana_elasticsearch_username,
  $kibana_elasticsearch_password = $kibana::params::kibana_elasticsearch_password,
  $default_app_id                = $kibana::params::default_app_id,
  $request_timeout               = $kibana::params::request_timeout,
  $shard_timeout                 = $kibana::params::shard_timeout,
) inherits kibana::params {

  class {'kibana::install': } ->
  class {'kibana::config': } ->
  class {'kibana::service': }

}
