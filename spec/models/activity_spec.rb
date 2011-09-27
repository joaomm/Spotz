require 'spec_helper'

describe Activity do
  it {should validate_presence_of :user}
  it {should validate_presence_of :act}
  it {should validate_presence_of :location}
end
