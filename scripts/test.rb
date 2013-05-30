class UI
  def self.login(username)
    user = User.where(:username => username).first

    if user
      UI.new(user)
    else
      raise ArgumentError.new("No such user")
    end
  end

  def logout
    exit
  end

  def self.create_account
    puts "Enter desired username"
    username = gets.chomp
    puts "Enter email address"
    email = gets.chomp

    User.create(:username => username, :email => email)
    UI.login(username)
  end

  def initialize(user)
    @current_user = user
  end

  def post_link
    puts "Type long version of URL"
    long_url = gets.chomp
    puts "Type title for post"
    title = gets.chomp
    puts "Type tag. You have to do it."
    tag_topic = gets.chomp

    @current_user.add_link(long_url, title, tag_topic) if tag_topic
    @current_user.add_link(long_url, title) unless tag_topic
  end

  def visit_link(link)
    @current_user.visit_link(link)
    @current_link = ShortUrl.where(:short_url => link).first
  end

  def comment
    puts "Enter comment"
    comment = gets.chomp
    @current_link.comment(@current_user.id, comment) if @current_link
    p "You're not viewing a link" unless @current_link
  end

end
