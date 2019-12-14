
require 'awspec'

describe "test bucket" do
  describe s3_bucket('flugeltest2bucket') do
    it { should exist }
    it { should have_object('file1.txt') }
    it { should have_object('file2.txt') }
  end
end
