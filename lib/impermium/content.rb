require "impermium/content/blog_post"
require "impermium/content/bookmark"
require "impermium/content/comment"
require "impermium/content/connection"
require "impermium/content/listing"
require "impermium/content/generic_content"

module Impermium
  module Content
    include BlogPost
    include Bookmark
    include Comment
    include Connection
    include Listing
    include GenericContent
  end
end
