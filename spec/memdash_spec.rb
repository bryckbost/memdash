require 'spec_helper'

describe Memdash do
  before do
    Dalli::Client.memdash_ttl = 2
  end

  it "records gets" do
    expect{ dalli.get("key") }.to change{ Memdash::Report.count }.by(1)
  end

  it "waits between recording gets" do
    dalli.get("key")
    sleep 1
    expect{ dalli.get("key") }.to_not change{ Memdash::Report.count }
    sleep 2
    expect{ dalli.get("key") }.to change{ Memdash::Report.count }.by(1)
  end

  it "records sets" do
    expect{ dalli.set("key", "value") }.to change{ Memdash::Report.count }.by(1)
  end

  it "waits between recording sets" do
    dalli.set("key", "value")
    sleep 1
    expect{ dalli.set("key", "value") }.to_not change{ Memdash::Report.count }
    sleep 2
    expect{ dalli.set("key", "value") }.to change{ Memdash::Report.count }.by(1)
  end
end
