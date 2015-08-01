require "open-uri"

print "---------- Generating Seed Data ----------"
# Temporary admin account
u = User.new(
    email: "admin@example.com",
    password: "devPassword1",
    password_confirmation: "devPassword1",
    admin: true
)
u.skip_confirmation!
u.save!
# generate user accounts
(1..10).each do |i|
  u = User.new(
    email: "user#{i}@example.com",
    password: "Password1",
    password_confirmation: "Password1",
    first_name: "user",
    last_name: "\##{i}",
      image: open('http://i.imgur.com/vDo0IT9.png')
  )
  u.skip_confirmation!
  u.save!
  print i, " user(s) created with id ", u.id, "\n"
  # generate dummy posts
  (1..6).each do |i|
    p = Post.new(
      title: (0...8).map { (65 + rand(26)).chr }.join,
      user: u,
      content_md: "this is a descriptive description!",
      year_created: (2000 + i),
      medium: (0...4).map { (65 + rand(26)).chr }.join,
      dimension_height: (1 + rand(69)),
      dimension_width: (1 + rand(69)),
      measurement: 'in',
      weight_in_pounds: rand(22),
      price: (rand(1000000)) * (0.01),
      quantity: rand(33),
      image: open('http://i.imgur.com/vDo0IT9.png')
    )
    p.save!
    print i, "..."
  end
  print " posts created!\n"
end


# generate dummy comments
print "\nGenerating comments"
(1..500).each do |i|
  #-1)+1 in comment poster rand is to exclude the Admin account at 0
  @comment_post = Post.offset(rand(Post.count)).first
  @comment_poster = User.offset(rand(User.count-1)+1).first
  c = Comment.new(
    message: (0...25).map { (65 + rand(26)).chr }.join,
    user_id: @comment_poster.id,
    post_id: @comment_post.id,
    user: @comment_poster
  )
  c.save!
  if i%50 == 0
    print "."
  end
end

print "\nGenerating post votes"
(1..1000).each do |i|
  @target_post = Post.offset(rand(Post.count)).first
  @voter = User.offset(rand(User.count-1)+1).first
  if not PostVote.where(:post_id => @target_post.id, :user_id => @voter, :state => 1).present?
    pv = PostVote.new(
        user_id: @voter.id,
        post_id: @target_post.id,
        state: 1
    )
    pv.save!
    if i%50 == 0
      print "."
    end
  end
end

print "\nGenerating comment votes"
(1..1000).each do |i|
  @target_comment = Comment.offset(rand(Comment.count)).first
  @voter = User.offset(rand(User.count-1)+1).first
  if not CommentVote.where(:comment_id => @target_comment.id, :user_id => @voter).present?
     cv = CommentVote.new(
        user_id: @voter.id,
        comment_id: @target_comment.id,
        state: rand(3)-1
    )
    cv.save!
    if i%50 == 0
      print "."
    end
  end
end

print "\n\n---------- Seed Data Generated ----------\n"