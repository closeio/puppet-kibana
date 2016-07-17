puppet-kibana
=============

Puppet module for installing Kibana by downloading and extracting the tarball from elastic.co.

(Interested in working on projects like this? [Close.io](http://close.io) is looking for [great engineers](http://jobs.close.io) to join our team)

Requires
========

### Modules:

``stdlib`` by puppetlabs for curl binary used to download Kibana

Limitations
===========

This module has been tested on Ubuntu 14.04 and should run without problems on
* Debian 6+
* Ubuntu 10.04 and newer

Usage
=====

### Classes

``kibana``
This class downloads and installs Kibana

### Parameters

``version``
String. Version of Kibana to install. Defaults to 4.1.10-linux-x64.

``download_path``
String. Base URL for Kibana downloads. Defaults to http://download.elastic.co/kibana/kibana.

``install_root``
String. The root directory where the Kibana tarball will be extracted.  Defaults to /opt,
so that Kibana is installed in /opt/kibana-${version} (which is symlinked by /opt/kibana).

``babel_dir``
String. Some versions of Kibana 4 allow specifying BABEL_CACHE_PATH. Defaults to /tmp/kibana.

``config_dir``
String. Location of the kibana.yml config file. Defaults to /etc/kibana.

``log_dir``
String. Location to write logs. Defaults to /var/log/kibana.

``pid_dir``
String. Location to pid file. Defaults to /var/run/kibana.

``service_ensure``
Boolean. If true, Kibana daemon should be started after install. Defaults to true.

``service_enabled``
Boolean. If true, Kibana daemon should be started at boot. Defaults to true.

``bind_host``
String. The address to bind to. Set to 0.0.0.0 to bind to all interfaces. Defaults to 127.0.0.1.

``bind_port``
Integer. The port to bind to. Defaults to 5601.

``elasticsearch_url``
String. URL of backend Elasticsearch cluster. Defaults to http://localhost:9200.

``elasticsearch_preserve_host``
Boolean. When set to true, will send the hostname specified in ``elasticsearch_url``. If you set it to false,
then the host you use to connect to *this* Kibana instance will be sent. Defaults to true.

``kibana_index``
String. Name of the Elasticsearch index used to store Kibana dashboards. Defaults to ``.kibana``.

``kibana_elasticsearch_username``
String. Username used to authenticate to Elasticsearch if required. Defaults to ``''``.

``kibana_elasticsearch_password``
String. Password used to authenticate to Elasticsearch if required. Defaults to ``''``.

``default_app_id``
String. Default Kibana app to display. Defaults to ``discover``.

``request_timeout``
Integer. Time in milliseconds to wait for responses from the back end or Elasticsearch.
This must be > 0. Defaults to 300000 (5 minutes).

``shard_timeout``
Integer. Time in milliseconds for Elasticsearch to wait for responses from shards.
Set to 0 to disable. Defaults to 0, disabled.

Contributing
============
Pull requests are greatly appreciated!
