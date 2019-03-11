class ChangeBrandsPasswordToPasswordDigest < ActiveRecord::Migration[5.2]
  def up
    rename_column :brands, :password, :password_digest
  end

  def down
    rename_column :brands, :password_digest, :password
  end
end
