# Description

Adds [Data Bag][data_bag] support for older versions of *chef-solo*.

# Requirements

## Chef

Chef versions lower than 0.10.4 may benefit. There is no reason to use this
cookbook for Chef version 0.10.4 and higher as the feature is part of the
core.

## Platform

Tested on Mac OS X 10.6.8 and Ubuntu 10.10 but should work any platform
that is supported by Chef.

## Cookbooks

There are no external cookbook dependencies.

# Recipes

## default

This recipe is a no-op and does nothing.

# Attributes

There are no attributes to define or configure.

# Usage

Simply include the cookbook in your chef repository and
`libraries/solo_data_bags` will be loaded in the chef-solo run to add Data
Bag support.

# Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every seperate change you make.

# License and Author

Author:: Fletcher Nichol (<fnichol@nichol.ca>)

Copyright 2011, Fletcher Nichol

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

[data_bag]: http://wiki.opscode.com/display/chef/Data+Bags
[repo]:     https://github.com/fnichol/chef-solo_data_bags
[issues]:   https://github.com/fnichol/chef-solo_data_bags/issues
