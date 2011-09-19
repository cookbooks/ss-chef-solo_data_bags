# Thanks to https://gist.github.com/967980 for the original inspiration.
# Code here was adapted from Chef codebase introduced in version 0.10.4.

##
# Determines if the version of Chef is older than 0.10.4.
#
# @return [true,false] whether or not this is an "old" chef gem
def is_chef_version_old?
  version = Chef::VERSION.split('.')
  version.first == "0" && version.slice(1, 2).join('.').to_f < 10.4
end

if Chef::Config[:solo] && is_chef_version_old?
  Chef::Log.info("Data bag support added for pre-0.10.4 chef-solo.")

  class Chef
    class DataBag
      ##
      # Load a Data Bag by name via local data_bag_path if run in solo mode.
      # NOTE: `Chef::Config[:data_bag_path].first` exists for versions of
      # vagrant 0.8.2 and older. It was setting the value to be an Array
      # rather than a String.
      def self.load_local(name)
        unless File.directory?(Chef::Config[:data_bag_path].first)
          raise Chef::Exceptions::InvalidDataBagPath, "Data bag path '#{Chef::Config[:data_bag_path]}' is invalid"
        end

        Dir.glob(File.join(Chef::Config[:data_bag_path].first, name, "*.json")).inject({}) do |bag, f|
          item = JSON.parse(IO.read(f))
          bag[item['id']] = item
          bag
        end
      end
    end

    class DataBagItem
      def self.from_hash(h)
        item = new
        item.raw_data = h
        item
      end

      ##
      # Load a Data Bag Item by name via local data_bag_path if run in solo
      # mode.
      def self.load_local(data_bag, name)
        bag = Chef::DataBag.load_local(data_bag)
        item = bag[name]

        if item.kind_of?(DataBagItem)
          item
        else
          item = from_hash(item)
          item.data_bag(data_bag)
          item
        end
      end
    end

    module Mixin
      module Language
        def data_bag(bag)
          DataBag.validate_name!(bag.to_s)
          rbag = DataBag.load_local(bag)
          rbag.keys
        rescue Exception
          Log.error("Failed to list data bag items in data bag: #{bag.inspect}")
          raise
        end

        def data_bag_item(bag, item)
          # Chef::DataBag.validate_name! and
          # Chef::DataBagItem.validate_name! were introduced in v0.9.16 so
          # they may not exist
          if DataBag.respond_to?("validate_name!")
            DataBag.validate_name!(bag.to_s)
          end
          if DataBagItem.respond_to?("validate_name!")
            DataBagItem.validate_id!(item)
          end

          DataBagItem.load_local(bag, item)
        rescue Exception
          Log.error("Failed to load data bag item: #{bag.inspect} #{item.inspect}")
          raise
        end
      end
    end
  end
end
