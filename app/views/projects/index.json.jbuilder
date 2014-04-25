json.array!(@projects) do |project|
  json.extract! project, :id
  json.url project_url(project)
  json.attachment project.attachment.url
end
