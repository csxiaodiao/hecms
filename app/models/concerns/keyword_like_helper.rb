# frozen_string_literal: true

module KeywordLikeHelper
  # example
  # Add `scope_keyword_like users: [:username, :email], user_auth_tokens: [:value]' to model/user.rb

  # explain: users is current table name, :username, :email is current table field.
  # users_auth_tokens tables need joined to current table,  [value] is joins table fields
  # maybe exist any amount joins table.

  # And then run ` User.keyword_like('some keyword')', generate following SQL.

  # "SELECT `users`.* FROM `users` INNER JOIN `user_auth_tokens` ON
  # `user_auth_tokens`.`user_id` = `users`.`id`
  # WHERE ( users.username LIKE '%some keyword%' OR users.email LIKE '%some keyword%' OR
  # user_auth_tokens.value LIKE '%some keyword%' )"
  # 新增管理员修改密码时增加到最外层的enumeration
  # TODO: Need add test.
  def scope_keyword_like(scope_name: :keyword_like, **args)
    adapter = ActiveRecord::Base.connection_config[:adapter]
    joins_chained = "".dup
    sql_query = "".dup
    keyword_args = "".dup
    args.each do |table, fields|
      table_name = self.table_name
      unless table.to_s == table_name
        table_name = table.to_s.singularize.camelize.constantize.table_name
        joins_chained << ".joins(:#{table})"
      end
      fields.each do |field|
        field = "id::text" if field == :id && adapter == "postgresql"
        like = adapter == "postgresql" ? "ILIKE" : "LIKE"
        sql_query << " #{table_name}.#{field} #{like} ? OR"
        keyword_args << '"%#{keyword}%", '
      end
    end
    sql_query.chomp!("OR")
    keyword_args.chomp!(", ")

    scope_result = <<-HEREDOC
      scope \"#{scope_name}\", -> (keyword) do
        return all if keyword.blank?
        self#{joins_chained}.where(\"#{sql_query}\", #{keyword_args})
      end
HEREDOC

    class_eval scope_result
  end
end
