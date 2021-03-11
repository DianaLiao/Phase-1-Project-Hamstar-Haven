class AddProfileColumnsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :avatar, :string, :default => "😊"
    add_column :users, :motto, :text, :default => "Be the Hamstar"
    add_column :users, :happy_url, :string, :default => "https://www.reddit.com/r/aww/"
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
