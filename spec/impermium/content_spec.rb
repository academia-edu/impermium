require 'spec_helper'

describe "content comment events" do
  before(:each) do
    @uid_ref = "uid_ref"
    @content = "just a comment"
    @resouce_url = "http://example.com"
    @enduser_ip = "1.1.1.1"
  end

  describe "blog_entry API call" do
    describe "missing blog_entry arguments" do
      
      it "should raise BadRequest error if 'enduser_ip' is missing" do
        stub = stub_post("content/blog_entry").to_return(
          :status => 400,
          :body => "400:Unable to verify the schema of the event: (Value '' is not of type 'string' for element 'enduser_ip')",
          :headers => { :content_type => "application/json; charset=utf-u" }
          )
        lambda { Impermium.comment(@uid_ref, @content, @resource_url, "") }.should raise_error(Impermium::BadRequest)
      end
      
      it "should raise BadRequest error if 'resource_url' is missing" do
        stub = stub_post("content/blog_entry").to_return(
          :status => 400,
          :body => "400:Unable to verify the schema of the event: (Value '' is not of type 'string' for element 'enduser_ip')",
          :headers => { :content_type => "application/json; charset=utf-u" }
          )
        lambda { Impermium.comment(@uid_ref, @content, "", @enduser_ip) }.should raise_error(Impermium::BadRequest)
      end
      
    end

    describe "successful blog_entry request" do
      it "should flag 'just a comment' as not spam" do
        stub = stub_post("content/blog_entry").to_return(:status => 200, :body => fixture_content('blog_entry'),
          :headers => {:content_type => "application/json; charset=utf-8"})
        res = Impermium.comment(@uid_ref, @content, @resource_url, @enduser_ip)
        res.spam.confidence.should == "medium"
        res.spam.label.should == "notspam"
      end
    end
  end

  describe "chat_message API call" do
    describe "missing chat_message arguments" do
      
      it "should raise BadRequest error if 'enduser_ip' is missing" do
        stub = stub_post("content/chat_message").to_return(
          :status => 400,
          :body => "400:Unable to verify the schema of the event: (Value '' is not of type 'string' for element 'enduser_ip')",
          :headers => { :content_type => "application/json; charset=utf-u" }
          )
        lambda { Impermium.comment(@uid_ref, @content, @resource_url, "") }.should raise_error(Impermium::BadRequest)
      end
      
      it "should raise BadRequest error if 'resource_url' is missing" do
        stub = stub_post("content/chat_message").to_return(
          :status => 400,
          :body => "400:Unable to verify the schema of the event: (Value '' is not of type 'string' for element 'enduser_ip')",
          :headers => { :content_type => "application/json; charset=utf-u" }
          )
        lambda { Impermium.comment(@uid_ref, @content, "", @enduser_ip) }.should raise_error(Impermium::BadRequest)
      end
      
    end

    describe "successful chat_message request" do
      it "should flag 'just a comment' as not spam" do
        stub = stub_post("content/chat_message").to_return(:status => 200, :body => fixture_content('chat_message'),
          :headers => {:content_type => "application/json; charset=utf-8"})
        res = Impermium.comment(@uid_ref, @content, @resource_url, @enduser_ip)
        res.spam.confidence.should == "medium"
        res.spam.label.should == "notspam"
      end
    end
  end

  describe "comment API call" do
    describe "missing comment arguments" do
      
      it "should raise BadRequest error if 'enduser_ip' is missing" do
        stub = stub_post("content/comment").to_return(
          :status => 400,
          :body => "400:Unable to verify the schema of the event: (Value '' is not of type 'string' for element 'enduser_ip')",
          :headers => { :content_type => "application/json; charset=utf-u" }
          )
        lambda { Impermium.comment(@uid_ref, @content, @resource_url, "") }.should raise_error(Impermium::BadRequest)
      end
      
      it "should raise BadRequest error if 'resource_url' is missing" do
        stub = stub_post("content/comment").to_return(
          :status => 400,
          :body => "400:Unable to verify the schema of the event: (Value '' is not of type 'string' for element 'enduser_ip')",
          :headers => { :content_type => "application/json; charset=utf-u" }
          )
        lambda { Impermium.comment(@uid_ref, @content, "", @enduser_ip) }.should raise_error(Impermium::BadRequest)
      end
      
    end

    describe "successful comment request" do
      it "should flag 'just a comment' as not spam" do
        stub = stub_post("content/comment").to_return(:status => 200, :body => fixture_content('comment'),
          :headers => {:content_type => "application/json; charset=utf-8"})
        res = Impermium.comment(@uid_ref, @content, @resource_url, @enduser_ip)
        res.spam.confidence.should == "medium"
        res.spam.label.should == "notspam"
      end
    end
  end

end
