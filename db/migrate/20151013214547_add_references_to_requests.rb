class AddReferencesToRequests < ActiveRecord::Migration
  def change
    add_reference :requests, :user, index: true
  end
end
