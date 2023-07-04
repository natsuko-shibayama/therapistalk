class Role < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '患者さん' },
    { id: 2, name: 'セラピスト' }
  ]

  include ActiveHash::Associations
  has_many :users

  end