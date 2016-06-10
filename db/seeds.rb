u = User.create(name: 'Laura Frank', chip_id: 'password', admin: true)
User.create(name: 'Pu der Bär', chip_id: 'ddee2e4e4e1b')

Issue.create(text: 'Make this repository public', user: u)
Issue.create(text: 'Eat some bacon', user: u)

Comment.create(text: 'Hi, I\'m a comment!', user: u, issue: Issue.first, type: :comment)
