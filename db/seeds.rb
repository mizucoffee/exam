if Category.count == 0
  Category.create([
    {name: 'Programming'},
    {name: 'Hobby'},
    {name: 'Other'},
  ])
end