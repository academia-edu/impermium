module Impermium
  module GenericContent
    def generic_content(content_id, user_id, content, options={}, &block)
      options.merge!(
	:content_id => content_id,
        :user_id => user_id,
        :content => content,
        )
      post("generic_content", options, &block)
    end
  end
end
