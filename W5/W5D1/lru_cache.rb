class LRUCache
    def initialize(max)
        @cache = []
        @max = max
    end

    def count
        self.cache.size
    end

    def add(el)
        if self.cache.include?(el)
            new_cache = []
            self.cache.each {|ele| new_cache << ele if ele != el}
            new_cache << el
            self.cache = new_cache
        else
            if self.cache.length + 1 > max
                self.cache.shift
            end
            self.cache << el
        end

    end

    def show
        p @cache
    end

    private
    attr_accessor :cache, :max

end

 johnny_cache = LRUCache.new(4)

johnny_cache.add("I walk the line")
johnny_cache.add(5)

johnny_cache.show

p johnny_cache.count # => returns 2

johnny_cache.add([1,2,3])
johnny_cache.add(5)
johnny_cache.add(-5)
johnny_cache.show

johnny_cache.add({a: 1, b: 2, c: 3})
johnny_cache.add([1,2,3,4])
johnny_cache.add("I walk the line")
johnny_cache.add(:ring_of_fire)
johnny_cache.add("I walk the line")
johnny_cache.add({a: 1, b: 2, c: 3})

johnny_cache.show
