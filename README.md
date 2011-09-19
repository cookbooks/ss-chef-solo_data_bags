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

# Installation

Depending on the situation and use case there are several ways to install
this cookbook. All the methods listed below assume a tagged version release
is the target, but omit the tags to get the head of development. A valid
Chef repository structure like the [Opscode repo][chef_repo] is also assumed.

## From the Opscode Community Platform

To install this cookbook from the Opscode platform, use the *knife* command:

    knife cookbook site install solo_data_bags

## Using Librarian

The [Librarian][librarian] gem aims to be Bundler for your Chef cookbooks.
Include a reference to the cookbook in a **Cheffile** and run
`librarian-chef install`. To install with Librarian:

    gem install librarian
    cd chef-repo
    librarian-chef init
    cat >> Cheffile <<END_OF_CHEFFILE
    cookbook 'solo_data_bags',
      :git => 'git://github.com/fnichol/chef-solo_data_bags.git', :ref => 'v0.0.4'
    END_OF_CHEFFILE
    librarian-chef install

## Using knife-github-cookbooks

The [knife-github-cookbooks][kgc] gem is a plugin for *knife* that supports
installing cookbooks directly from a GitHub repository. To install with the
plugin:

    gem install knife-github-cookbooks
    cd chef-repo
    knife cookbook github install fnichol/chef-solo_data_bags/v0.0.4

## As a Git Submodule

A common practice (which is getting dated) is to add cookbooks as Git
submodules. This is accomplishes like so:

    cd chef-repo
    git submodule add git://github.com/fnichol/chef-solo_data_bags.git cookbooks/solo_data_bags
    git submodule init && git submodule update

**Note:** the head of development will be linked here, not a tagged release.

## As a Tarball

If the cookbook needs to downloaded temporarily just to be uploaded to a Chef
Server or Opscode Hosted Chef, then a tarball installation might fit the bill:

    cd chef-repo/cookbooks
    curl -Ls https://github.com/fnichol/chef-solo_data_bags/tarball/v0.0.4 | tar xfz - && \
      mv fnichol-chef-solo_data_bags-* solo_data_bags

# Usage

Simply include the cookbook in your chef repository and
`libraries/solo_data_bags` will be loaded in the chef-solo run to add Data
Bag support.

# Recipes

## default

This recipe is a no-op and does nothing.

# Attributes

There are no attributes to define or configure.

# Development

* Source hosted at [GitHub][repo]
* Report issues/Questions/Feature requests on [GitHub Issues][issues]

Pull requests are very welcome! Make sure your patches are well tested.
Ideally create a topic branch for every separate change you make.

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

[chef_repo]:  https://github.com/opscode/chef-repo
[data_bag]:   http://wiki.opscode.com/display/chef/Data+Bags
[kgc]:        https://github.com/websterclay/knife-github-cookbooks#readme
[librarian]:  https://github.com/applicationsonline/librarian#readme

[repo]:     https://github.com/fnichol/chef-solo_data_bags
[issues]:   https://github.com/fnichol/chef-solo_data_bags/issues
