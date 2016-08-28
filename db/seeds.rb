u = User.create(name: 'Laura')

Issue.create(text: 'Sacrifice to the demo gods', user: u)
Issue.create(text: 'Drink some coffee', user: u)

Comment.create(text: 'Sure hope this works!', user: u, issue: Issue.first, type: :comment)
