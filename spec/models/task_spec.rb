require "spec_helper"

describe Task do
  it { should belong_to (:list) }
  it { should validate_presence_of(:title_task) }
  it { should validate_uniqueness_of(:title_task) }
end