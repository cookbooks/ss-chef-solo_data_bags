maintainer       "Fletcher Nichol"
maintainer_email "fnichol@nichol.ca"
license          "Apache 2.0"
description      "Adds Data Bag support for older versions of chef-solo"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.4"

%w{ debian ubuntu suse centos redhat fedora mac_os_x }.each do |os|
  supports os
end
