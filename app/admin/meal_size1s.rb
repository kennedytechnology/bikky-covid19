ActiveAdmin.register MealSize1 do
  menu parent: "Partner Options", label: "Meal Size 1", priority: 4
  permit_params :name
end
