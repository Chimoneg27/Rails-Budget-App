class DropTransactionsTable < ActiveRecord::Migration[7.1]
  def up
    drop_table :transactions
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
