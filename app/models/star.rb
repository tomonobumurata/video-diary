class Star < ActiveHash::Base
  include ActiveHash::Associations
  has_many :reviews

  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
    { id: 3, name: 'SF' },
  ]
end