import Foundation

class Node {
    var children = Dictionary<Character, Node>()
    var isEnd = false
    init(){
        self.children = Dictionary<Character, Node>() 
        self.isEnd = false
    }
}

class Trie{
    var root : Node
    init() {
        self.root = Node()
    }

    func insert(key:String){
        var node = root
        for char in key{
            var nextNode = node.children[char]
            if nextNode ==  nil{
                nextNode = Node()
                node.children[char] = nextNode
            }
            node = nextNode!
        }
        node.isEnd = true
    }   
    // func addNode(charList : [Node]) {
    //     var mainNode = root 
    //     for node in charList{
    //         let nextNode = mainNode.children[node.char]
    //         if (nextNode != nil) {
    //             mainNode =  nextNode!!
    //         } else {
    //             mainNode.children[node.char] = node
    //             mainNode = node
    //         }
    //     }
        
    // }

    func containWord(string: String) -> Bool{
        var mainNode = root
        for char in string {
            let nextNode = mainNode.children[char]
            if (nextNode != nil){
                mainNode = nextNode!
            } else {
                return false
            }
        }
        if mainNode.isEnd {
            return true
        }
        return false
    }
}

var x = Trie()
x.insert(key:"sre")
x.insert(key:"stre")
x.insert(key:"t")
print(x.root.children)
