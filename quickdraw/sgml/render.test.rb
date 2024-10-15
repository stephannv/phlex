# frozen_string_literal: true

require "sgml_helper"

include SGMLHelper

test "render safe object" do
  safe_object_class = Data.define(:value) do
    include Phlex::SGML::SafeObject

    def to_s
      value.to_s
    end
  end

  expect(
    phlex do
      render safe("< Back")

      whitespace

      render safe_object_class.new(value: "Go >")
    end
  ) == %(< Back Go >)
end
