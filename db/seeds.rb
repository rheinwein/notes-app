u = User.create(name: 'Laura Frank', chip_id: 'password', admin: true)
User.create(name: 'Donald Duck', chip_id: 'ddee2e4e4e1b')
User.create(name: 'Scrooge McDuck', chip_id: '31a8fb2dcf6b')

# categories = %w(Engineering Marketing Support Sales Personal)
# categories.map! do |category|
#   Category.create(name: category)
# end

Issue.create(text: 'Make this repository public', user: u)
Issue.create(text: 'Eat some bacon', user: u)

Comment.create(text: 'Hi, I\'m a comment!', user: u, issue: Issue.first, type: :comment)
