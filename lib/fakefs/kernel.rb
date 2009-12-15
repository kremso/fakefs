module Kernel
  private

  alias :original_open :open

  def open(name, *rest, &block)
    if name =~ /\|.*/ then
      original_open(name, *rest, &block)
    else
      FakeFS::File.open(name, *rest, &block)
    end
  end

  module_function :open
end
