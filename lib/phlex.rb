# frozen_string_literal: true

require "erb"
require "set"
require_relative "phlex/version"

module Phlex
	autoload :ArgumentError, "phlex/errors/argument_error"
	autoload :DoubleRenderError, "phlex/errors/double_render_error"
	autoload :BlackHole, "phlex/black_hole"
	autoload :CSV, "phlex/csv"
	autoload :Callable, "phlex/callable"
	autoload :Context, "phlex/context"
	autoload :DeferredRender, "phlex/deferred_render"
	autoload :ElementClobberingGuard, "phlex/element_clobbering_guard"
	autoload :Elements, "phlex/elements"
	autoload :Error, "phlex/error"
	autoload :FIFO, "phlex/fifo"
	autoload :HTML, "phlex/html"
	autoload :Helpers, "phlex/helpers"
	autoload :Kit, "phlex/kit"
	autoload :NameError, "phlex/errors/name_error"
	autoload :SGML, "phlex/sgml"
	autoload :SVG, "phlex/svg"

	Escape = ERB::Escape
	ATTRIBUTE_CACHE = FIFO.new
	SUPPORTS_FIBER_STORAGE = RUBY_ENGINE == "ruby"
	Null = Object.new.freeze

	CACHED_FILES = Set.new

	def self.__expand_attribute_cache__(file_path)
		unless CACHED_FILES.include?(file_path)
			CACHED_FILES << file_path
			Phlex::ATTRIBUTE_CACHE.expand(File.size(file_path))
		end
	end
end

def 💪
	Phlex
end
