# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


jobs = [
  { user_id: 1, role_id: 9276, theatre_id: 3},
  { user_id: 1, role_id: 8093, theatre_id: 15},
  { user_id: 1, role_id: 7647, theatre_id: 17},
  { user_id: 1, role_id: 7703, theatre_id: 35}
]

if Job.all.count == 0

  jobs.each do |job|
    j = Job.new
    j.user_id = job[:user_id]
    j.role_id = job[:role_id]
    j.theatre_id = job[:theatre_id]
    j.save
  end

end

auditions = [
  { name: "How To Succeed...",
    audition_start: "2014-07-10",
    audition_end: "2014-07-15",
    description: "Power, sex, ambition, greed...it's just another day at the office. This satirical look at big business follows the rise of one “J. Pierrepont Finch” who uses a little “How to…” handbook to climb the corporate ladder from lowly window washer to high-powered executive. Follow our hero as he navigates the dangers of the aggressively compliant 'company man,' the office party, backstabbing co-workers, caffeine addiction and, of course, true love.",
    theatre_id: 4,
    play_id: 731,
    equity: false },
  { name: "Damn Yankees",
    audition_start: "2014-07-10",
    audition_end: "2014-07-12",
    description: "Middle-aged Joe Boyd will do anything to see his beloved Washington Senators win the pennant—even sell his soul to the Devil. When he is transformed into young Joe Hardy, the baseball sensation of the year, he must decide if the life he gave up is more important than youth and fame. Can Satan’s sultry siren Lola persuade him?",
    theatre_id: 5,
    play_id: 716,
    equity: false },
  { name: "You're A Good Man, Charlie Brown",
    audition_start: "2014-04-21",
    audition_end: "2014-04-25",
    description: "You're a Good Man Charlie Brown tells the story of an average day in the life of the famous comic strip child hero, Charlie Brown. Most of the characters are 5-6 years old, however the show is generally cast with adults. The audience is introduced to the whole Peanuts gang: Patty, Shroeder, Lucy and Snoopy. All of the characters share their observations, largely negative, of Charlie Brown. As the play progresses, the relationships of the Peanuts characters to one another are further expanded.",
    play_id: 832,
    theatre_id: 6,
    equity: true }
]

if Audition.all.count == 0
  auditions.each do |audition|
    a = Audition.new
    a.name = audition[:name]
    a.audition_start = audition[:audition_start]
    a.audition_end = audition[:audition_end]
    a.description = audition[:description]
    a.theatre_id = audition[:theatre_id]
    a.play_id = audition[:play_id]
    a.equity = audition[:equity]
    a.save
  end
end
