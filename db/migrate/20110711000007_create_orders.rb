# encoding: utf-8
#---
# Excerpted from "Agile Web Development with Rails, 4th Ed.",
# published by The Pragmatic Bookshelf.
# Copyrights apply to this code. It may not be used to create training material, 
# courses, books, articles, and the like. Contact us if you are in doubt.
# We make no guarantees that this code is fit for any purpose. 
# Visit http://www.pragmaticprogrammer.com/titles/rails4 for more book information.
#
# 日本語版については http://ssl.ohmsha.co.jp/cgi-bin/menu.cgi?ISBN=978-4-274-06866-9
#---
class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :name
      t.text :address
      t.string :email
      t.string :pay_type

      t.timestamps
    end
  end
end
