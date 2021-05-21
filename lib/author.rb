class Author

    @@all = []

    def self.all
        @@all
    end

    def self.post_count
        self.all.collect {|author| author.posts}.flatten.length
    end


    attr_accessor :name
    
    def initialize(name)
        @name = name
        @@all << self
    end

    def posts
        Post.all.select {|post| post.author == self}
    end

    def add_post_by_title(title)
        new_post = Post.new(title)
        new_post.author = self
    end

    def add_post(post)
        post.author = self
    end

end