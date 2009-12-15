require 'test_helper'

class KernelTest < Test::Unit::TestCase
  include FakeFS

  def test_fake_kernel_can_create_subprocesses
    out = open("|echo -n 'foo'")
    assert_equal 'foo', out.gets
  end

  def test_fake_kernel_can_create_new_file
    open('/path/to/file', "w") do |f|
      f << "test"
    end
    assert_kind_of FakeFile, FileSystem.fs['path']['to']['file']
  end
end
