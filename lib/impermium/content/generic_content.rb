module Impermium
  module GenericContent

    REPORTER_USER_TYPE_VALUES = ["ENDUSER", "MODERATOR"]

    def generic_content(content_id, user_id, content, options={}, &block)
      options.merge!(
	      :content_id => content_id,
        :user_id => user_id,
        :content => content,
        )
      post("generic_content", options, &block)
    end

    def generic_content_analyst_feedback(analyst_id, comment_id, desired_result, options={}, &block)
      options.merge!(
        :analyst_id => analyst_id,
        :content_id => comment_id,
        :desired_result => desired_result
        )
      post("generic_content/analyst_feedback", options, &block)
    end

    def generic_content_user_feedback(rep_usr_id, rep_usr_type, reporter_ip, comment_id, desired_result, options={}, &block)
      options.merge!(
        :reporter_user_id => rep_usr_id,
        :reporter_user_type => REPORTER_USER_TYPE_VALUES.include?(rep_usr_type) ? rep_usr_type : REPORTER_USER_TYPE_VALUES.first,
        :reporter_ip => reporter_ip,
        :content_id => content_id,
        :desired_result => desired_result
        )
      post("generic_content/user_feedback", options, &block)
    end
  end
end
