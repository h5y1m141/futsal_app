module ViewMacros
  extend ActiveSupport::Concern

  class Form
    def initialize(action, root = nil)
      @action = action
      @root = root
    end

    def tag_xpath(tag, name)
      "//form[@action=\"#{@action}\"]//#{tag}[@name=\"#{@root ? "#{@root}[#{name}]" : name}\"]"
    end

    %w(input textarea).each do |tag|
      define_method("#{tag}_xpath") do |name|
        tag_xpath(tag, name)
      end
    end
  end

  module ClassMethods
  end

  def form(action, root = nil, &block)
    form = Form.new(action, root)
    block.(form)
  end
end

RSpec.configure do |config|
  config.include ViewMacros, type: :view
end
