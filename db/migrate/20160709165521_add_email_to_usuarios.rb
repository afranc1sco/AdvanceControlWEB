class AddEmailToUsuarios < ActiveRecord::Migration
  def change
    ## Database authenticatable
  #  remove_column :usuarios, :usuario, :string

    add_column :usuarios, :email, :string, null: false, default: ""
    add_column :usuarios, :encrypted_password, :string, null: false, default: ""
    add_column :usuarios, :usuario, :string, null: false, default: ""


    ## Recoverable
    add_column :usuarios, :reset_password_token, :string
    add_column :usuarios, :reset_password_sent_at, :datetime

    ## Rememberable
    add_column :usuarios, :remember_created_at, :datetime

    ## Trackable
    add_column :usuarios, :sign_in_count, :integer, default: 0, null: false
    add_column :usuarios, :current_sign_in_at, :datetime
    add_column :usuarios, :last_sign_in_at, :datetime
    add_column :usuarios, :current_sign_in_ip, :string
    add_column :usuarios, :last_sign_in_ip, :string

    ## Confirmable
    # t.string   :confirmation_token
    # t.datetime :confirmed_at
    # t.datetime :confirmation_sent_at
    # t.string   :unconfirmed_email # Only if using reconfirmable

    ## Lockable
    # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
    # t.string   :unlock_token # Only if unlock strategy is :email or :both
    # t.datetime :locked_at

    #informacion extra

  add_index :usuarios, :usuario, unique: true
  add_index :usuarios, :email, unique: true
  #add_index :usuarios, :reset_password_token, unique: true
  # add_index :users, :confirmation_token,   unique: true
  # add_index :users, :unlock_token,         unique: true
  end
end
