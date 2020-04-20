ActiveAdmin.register Deal do
  menu parent: "Partner Options", label: "Deals", priority: 6
  permit_params :name
end
