ActiveAdmin.register Mood do
  menu parent: "Partner Options", label: "Mood", priority: 1
  permit_params :name
end
