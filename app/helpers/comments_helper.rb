module CommentsHelper
  def nested_comments(comments)
    comments.map do |comment, sub_comments|
      if sub_comments.present?
        render(comment) + content_tag(:div, nested_comments(sub_comments), class: 'nested_comments')
      else
        render(comment)
      end
    end.join.html_safe
  end
end
