require 'i18n/tasks/key_pattern_matching'
require 'i18n/tasks/data/tree/node'

module I18n::Tasks
  module Data::Router
    # Route based on key name
    class PatternRouter
      include ::I18n::Tasks::KeyPatternMatching

      attr_reader :routes
      # @option data_config write [Array] of routes
      # @example
      #   {write:
      #     # keys matched top to bottom
      #     [['devise.*', 'config/locales/devise.%{locale}.yml'],
      #     # default catch-all (same as ['*', 'config/locales/%{locale}.yml'])
      #     'config/locales/%{locale}.yml']}
      def initialize(_adapter, data_config)
        @routes_config = data_config[:write]
        @routes = compile_routes @routes_config
      end

      # Route keys to destinations
      # @param forest [I18n::Tasks::LocaleTree::Siblings] forest roots are locales.
      # @return [Hash] mapping of destination => [ [key, value], ... ]
      def route(locale, forest, &block)
        return to_enum(:route, locale, forest) unless block
        locale = locale.to_s
        out = {}
        forest.keys(root: false) do |key, _node|
          pattern, path = routes.detect { |route| route[0] =~ key }
          if pattern
            key_match = $~
            path      = path % {locale: locale}
            path.gsub!(/\\\d+/) { |m| key_match[m[1..-1].to_i] }
            (out[path] ||= Set.new) << "#{locale}.#{key}"
          else
            raise CommandError.new("Cannot route key #{key}. Routes are #{@routes_config.inspect}")
          end
        end
        out.each do |dest, keys|
          block.yield dest,
                      forest.select_keys { |key, _| keys.include?(key) }
        end
      end

      private

      def compile_routes(routes)
        routes.map { |x| x.is_a?(String) ? ['*', x] : x }.map { |x|
          [compile_key_pattern(x[0]), x[1]]
        }
      end
    end
  end
end

