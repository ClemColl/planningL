users = team.users
json.id team.id

json.user1 best_in_place(users[0], :name)
json.user2 best_in_place(users[1], :name)

json.link best_in_place(team, :name)


json.url team_path(team)