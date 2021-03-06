require File.expand_path('../../../spec_helper', __FILE__)
require File.expand_path('../fixtures/classes', __FILE__)

describe "Kernel#initialize_dup" do
  before do
    ScratchPad.clear
  end

  it "is a private method" do
    Kernel.should have_private_instance_method(:initialize_dup, false)
  end

  it "is called when object is cloned" do
    obj = KernelSpecs::Dup.new
    obj.dup
    ScratchPad.recorded.should == obj.object_id
  end

  it "calls initialize_copy by default" do
    obj = KernelSpecs::Duplicate.new(1, :a)
    other = KernelSpecs::Duplicate.new(2, :a)
    obj.send(:initialize_dup, other)
    ScratchPad.recorded.should == obj.object_id
  end
end
