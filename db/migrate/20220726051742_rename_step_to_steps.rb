class RenameStepToSteps < ActiveRecord::Migration[6.1]
  def change
    rename_column :recipes, :step, :steps
  end
end
