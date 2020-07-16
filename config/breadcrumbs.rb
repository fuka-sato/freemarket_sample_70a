# ルート
crumb :root do
  link "トップページ", root_path
end

crumb :user do
  link "マイページ", users_path(current_user)
  parent :root
end

crumb :show do
  link "商品詳細", item_path
  parent :root
end

crumb :creditcard1 do
  link "お支払方法", card_users_path(current_user)
  parent :user
end

crumb :creditcard2 do
  link "クレジットカード登録", creditcard_path(current_user)
  parent :creditcard1
end

crumb :exit do
  link "ログアウト", destroy_user_session_path(current_user)
  parent :user
end

# crumb :projects do
#   link "Projects", projects_path
# end

# crumb :project do |project|
#   link project.name, project_path(project)
#   parent :projects
# end

# crumb :project_issues do |project|
#   link "Issues", project_issues_path(project)
#   parent :project, project
# end

# crumb :issue do |issue|
#   link issue.title, issue_path(issue)
#   parent :project_issues, issue.project
# end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).