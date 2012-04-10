require 'spec_helper'

describe Memdash do
  it "records gets" do
    expect{ dalli.get("key") }.to change{ Memdash::Report.count }.by(1)
  end

  it "records sets" do
    expect{ dalli.set("key", "value") }.to change{ Memdash::Report.count }.by(1)
  end
end
