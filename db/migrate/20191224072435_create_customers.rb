class CreateCustomers < ActiveRecord::Migration[5.2]
  def create
    create_table :customers do |t|
      t.string :name
      t.string :address
      t.string :idcard
      t.string :mobile
      t.string :remark

      t.timestamps
    end
  end
end
