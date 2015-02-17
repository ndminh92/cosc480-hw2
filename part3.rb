class CartesianProduct
    include Enumerable
    def initialize(collection1, collection2)
        @pair_list = []
        collection1.each do |a|
            collection2.each do |b|
                @pair_list << [a,b]
            end
        end
    end

    def each(&block)
        @pair_list.each do |pair|
            block.call(pair)
        end
    end    
end

class BinaryTree
    def initialize(value=nil)
        @root = value
        @left_subtree = nil
        @right_subtree = nil
    end

    def empty?
        @root == nil 
    end

    def <<(value)
        if @root == nil
            @root = value
        elsif root > value 
            if @left_subtree == nil
                @left_subtree = BinaryTree.new(value)
            else
                @left_subtree << value
            end
        else
            if @right_subtree == nil
                @right_subtree = BinaryTree.new(value)
            else
                @right_subtree << value
            end
        end
    end

    def each(&block)
        @left_substree.each {|node| block.call(node)} unless @left_subtree == nil
        block.call(@root) unless @root == nil
        @right_subtree.each {|node| block.call(node)} unless @right_subtree == nil
    end 
end
#c = CartesianProduct.new([:a,:b],[4,5])
#c.each {|elt| puts elt.inspect}

