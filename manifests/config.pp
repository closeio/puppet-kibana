# Write kibana configuration file
class kibana::config inherits kibana {

  # Write config
  file { "${config_dir}/kibana.yml":
    ensure  => file,
    content => template('kibana/kibana.yml.erb'),
    require => File["${install_root}/kibana"]
  }

}
