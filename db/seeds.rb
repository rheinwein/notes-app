u = User.create(name: 'Laura', chip_id: 'password', admin: true)
User.create(name: 'Pu der Bär', chip_id: 'ddee2e4e4e1b')

Issue.create(text: 'Sacrifice to the demo gods', user: u)
Issue.create(text: 'Drink some coffee', user: u)

Comment.create(text: 'Sure hope this works!', user: u, issue: Issue.first, type: :comment)

