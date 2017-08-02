name 'trace3'
maintainer 'The Authors'
maintainer_email 'you@example.com'
license 'All Rights Reserved'
description 'Installs/Configures trace3'
long_description 'Installs/Configures trace3'
version '0.1.4'
chef_version '>= 12.1' if respond_to?(:chef_version)

# The `issues_url` points to the location where issues for this cookbook are
# tracked.  A `View Issues` link will be displayed on this cookbook's page when
# uploaded to a Supermarket.
#
# issues_url 'https://github.com/<insert_org_here>/trace3/issues'

# The `source_url` points to the development repository for this cookbook.  A
# `View Source` link will be displayed on this cookbook's page when uploaded to
# a Supermarket.
#
# source_url 'https://github.com/<insert_org_here>/trace3'
depends 'iis', '6.7.2'
depends 'iisnode', '0.1.3'
depends 'windows_firewall', '3.0.2'
depends 'powershell', '6.1.0'
