require_relative "version"
require "vagrant"

module VagrantPlugins
  module Down
    class Plugin < Vagrant.plugin("2")

      name "vagrant-down"
      description "This plugin is an alias for the `destroy` command."

      command :down do
        Command
      end

    end

    class Command < Vagrant.plugin(2, :command)

      def self.synopsis
        'alias for destroy command'
      end

      def execute
        options = {
          force: false
        }

        opts = OptionParser.new do |o|
          o.banner = "Usage: vagrant down [vm-name]"
          o.separator ""

          o.on("-f", "--force", "Destroy without confirmation.") do |f|
            options[:force] = f
          end
        end

        # Parse the options
        argv = parse_options(opts)
        return if !argv

        @logger.debug("'Destroy' each target VM...")
        declined = false
        with_target_vms(argv, :reverse => true) do |vm|
          action_env = vm.action(
            :destroy, :force_confirm_destroy => options[:force])

          declined = true if action_env.has_key?(:force_confirm_destroy_result) &&
            action_env[:force_confirm_destroy_result] == false
        end

        # Success if no confirms were declined
        declined ? 1 : 0
      end
    end
  end
end
