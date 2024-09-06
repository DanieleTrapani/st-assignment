class CreateEntries < ActiveRecord::Migration[7.1]
  def change
    create_table(:entries) do |t|
      t.string(:company)
      t.decimal(:kwh)
      t.date(:startdate)
      t.date(:enddate)
      t.boolean(:approved, default: nil)
      t.references(:user, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
